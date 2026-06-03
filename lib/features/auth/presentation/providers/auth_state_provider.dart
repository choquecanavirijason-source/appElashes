import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/secure_storage.dart';

/// Estado de sesión de la app.
///
/// En Fase 0 sólo distinguimos tres estados: cargando inicial, autenticado
/// (hay token guardado) o no autenticado. En Fase 1 esto se ampliará con
/// el `AuthUser` recibido de `GET /auth/me`.
enum AuthStatus { initial, authenticated, unauthenticated }

class AuthStateController extends Notifier<AuthStatus> implements Listenable {
  final ValueNotifier<int> _ticker = ValueNotifier<int>(0);

  @override
  AuthStatus build() {
    ref.onDispose(_ticker.dispose);
    return AuthStatus.initial;
  }

  /// Lee el token en almacenamiento seguro y publica el estado inicial.
  /// Llamado por el splash al arrancar la app. Cualquier fallo se trata
  /// como sesión inexistente para no dejar al usuario atascado.
  Future<void> hydrate() async {
    try {
      final hasToken = await ref.read(secureStorageProvider).hasToken();
      _set(hasToken ? AuthStatus.authenticated : AuthStatus.unauthenticated);
    } catch (error, stackTrace) {
      developer.log(
        'No se pudo leer el token en hydrate(): $error',
        name: 'auth.hydrate',
        error: error,
        stackTrace: stackTrace,
      );
      _set(AuthStatus.unauthenticated);
    }
  }

  /// Marca al usuario como autenticado y persiste el token.
  Future<void> markSignedIn(String token) async {
    await ref.read(secureStorageProvider).writeToken(token);
    _set(AuthStatus.authenticated);
  }

  /// Limpia el token y marca al usuario como no autenticado.
  /// El interceptor de Dio lo invoca ante un 401.
  Future<void> markSignedOut() async {
    await ref.read(secureStorageProvider).clearToken();
    _set(AuthStatus.unauthenticated);
  }

  void _set(AuthStatus next) {
    if (state == next) return;
    state = next;
    _ticker.value++;
  }

  @override
  void addListener(VoidCallback listener) => _ticker.addListener(listener);

  @override
  void removeListener(VoidCallback listener) => _ticker.removeListener(listener);
}

final authStateProvider =
    NotifierProvider<AuthStateController, AuthStatus>(AuthStateController.new);

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/auth_user.dart';

// NOTA ARQUITECTURAL: este archivo NO importa de data/ (auth_repository_impl,
// auth_api) porque dio_client.dart ya importa auth_state_provider.dart —
// importar data/ desde aquí cerraría un ciclo circular en tiempo de compilación.
// La orquestación de login y hydrate vive en LoginScreen y SplashScreen.

enum AuthStatus { initial, authenticated, unauthenticated }

class AuthStateController extends Notifier<AuthStatus> implements Listenable {
  final ValueNotifier<int> _ticker = ValueNotifier<int>(0);

  AuthUser? _currentUser;

  /// Usuario autenticado actualmente. `null` si no hay sesión.
  AuthUser? get currentUser => _currentUser;

  @override
  AuthStatus build() {
    ref.onDispose(_ticker.dispose);
    return AuthStatus.initial;
  }

  /// Persiste token + user y marca la sesión como autenticada.
  /// Llamado por LoginScreen y SplashScreen tras validar con el backend.
  Future<void> markSignedInWithUser(String token, AuthUser user) async {
    await ref.read(secureStorageProvider).writeToken(token);
    _currentUser = user;
    _set(AuthStatus.authenticated);
  }

  /// Limpia el token y marca al usuario como no autenticado.
  /// El interceptor 401 de Dio lo invoca directamente.
  Future<void> markSignedOut() async {
    await ref.read(secureStorageProvider).clearToken();
    _currentUser = null;
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
  void removeListener(VoidCallback listener) =>
      _ticker.removeListener(listener);
}

final authStateProvider =
    NotifierProvider<AuthStateController, AuthStatus>(AuthStateController.new);

/// Usuario autenticado actualmente. Se recalcula cada vez que cambia el estado
/// de auth. `null` si no hay sesión activa.
final authUserProvider = Provider<AuthUser?>((ref) {
  ref.watch(authStateProvider);
  return ref.read(authStateProvider.notifier).currentUser;
});

import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/presentation/organisms/loader_screen.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../auth/data/auth_repository_impl.dart';
import '../../../auth/presentation/providers/auth_state_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _hydrate());
  }

  Future<void> _hydrate() async {
    try {
      final storage = ref.read(secureStorageProvider);
      final hasToken = await storage.hasToken();

      if (!hasToken) {
        await ref.read(authStateProvider.notifier).markSignedOut();
        return;
      }

      // Valida el token y carga los datos del usuario actual.
      final user = await ref.read(authRepositoryProvider).me();
      final token = await storage.readToken();
      await ref
          .read(authStateProvider.notifier)
          .markSignedInWithUser(token!, user);
    } on ApiException catch (e) {
      developer.log(
        'Sesión inválida en hydrate: ${e.message}',
        name: 'auth.hydrate',
        error: e,
      );
      await ref.read(authStateProvider.notifier).markSignedOut();
    } catch (e, st) {
      developer.log(
        'Error inesperado en hydrate',
        name: 'auth.hydrate',
        error: e,
        stackTrace: st,
      );
      await ref.read(authStateProvider.notifier).markSignedOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const LoaderScreen(message: 'Cargando…');
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/organisms/loader_screen.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(authStateProvider.notifier).hydrate());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LoaderScreen(message: 'Cargando…');
  }
}

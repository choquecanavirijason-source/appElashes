import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/data/auth_repository_impl.dart';
import '../providers/auth_state_provider.dart';
import '../widgets/login_hero_header.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _extractErrorMessage(Object e) {
    if (e is DioException) {
      final inner = e.error;
      if (inner is DioException) return _extractErrorMessage(inner);
      if (inner != null) {
        final msg = inner.toString();
        if (msg.isNotEmpty && msg != 'null') return msg;
      }
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return 'Sin conexión al servidor. Verifica tu red.';
      }
      final detail = e.response?.data;
      if (detail is Map && detail['detail'] is String) {
        return detail['detail'] as String;
      }
      return e.message ?? 'Error de red desconocido';
    }
    return 'Error inesperado. Intenta de nuevo.';
  }

  Future<void> _onLoginPressed() async {
    final username = _userController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() => _errorMessage = 'Completa usuario y contraseña.');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await ref
          .read(authRepositoryProvider)
          .login(username, password);
      await ref
          .read(authStateProvider.notifier)
          .markSignedInWithUser(result.token, result.user);
    } catch (e, st) {
      final msg = _extractErrorMessage(e);
      developer.log('Login fallido: $msg', name: 'auth.login', error: e, stackTrace: st);
      if (mounted) setState(() => _errorMessage = msg);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LoginHeroHeader(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bienvenido de vuelta',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ingresa tus credenciales para continuar',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.45),
                        ),
                      ),
                      const SizedBox(height: 28),
                      _DarkField(
                        label: 'USUARIO',
                        hintText: 'Ingresa tu usuario',
                        prefixIcon: Icons.person_outline_rounded,
                        controller: _userController,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      _DarkField(
                        label: 'CONTRASEÑA',
                        hintText: 'Ingresa tu contraseña',
                        prefixIcon: Icons.lock_outline_rounded,
                        controller: _passwordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _onLoginPressed(),
                      ),
                      if (_errorMessage != null) ...[
                        const SizedBox(height: 16),
                        _ErrorBanner(message: _errorMessage!),
                      ],
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PillButton(
                        label: _isLoading ? 'Iniciando…' : 'Iniciar Sesión',
                        onPressed: _isLoading ? null : _onLoginPressed,
                        color: AppColors.goldAccent,
                        foregroundColor: Colors.black87,
                        height: 56,
                      ),
                      const SizedBox(height: 20),
                      // Divider con texto
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'eLashes Admin · v1.0',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withValues(alpha: 0.2),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Input field estilo dark card ─────────────────────────────────────────────

class _DarkField extends StatefulWidget {
  const _DarkField({
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.textInputAction,
    this.onSubmitted,
  });

  final String label;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  State<_DarkField> createState() => _DarkFieldState();
}

class _DarkFieldState extends State<_DarkField> {
  bool _obscure = true;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = _focused
        ? AppColors.brandAccent.withValues(alpha: 0.6)
        : AppColors.darkCardElevated;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.4),
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: AppColors.darkCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: AppColors.brandAccent.withValues(alpha: 0.08),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Focus(
            onFocusChange: (v) => setState(() => _focused = v),
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword && _obscure,
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              autocorrect: false,
              enableSuggestions: !widget.isPassword,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.25),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(
                    widget.prefixIcon,
                    color: _focused
                        ? AppColors.brandAccent
                        : Colors.white.withValues(alpha: 0.35),
                    size: 20,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: Colors.white.withValues(alpha: 0.35),
                        ),
                        onPressed: () =>
                            setState(() => _obscure = !_obscure),
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Banner de error ──────────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.offlineRed.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.offlineRed.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 18,
            color: AppColors.offlineRed,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.offlineRed,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

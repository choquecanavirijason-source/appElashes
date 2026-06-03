import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/atoms/pill_button.dart';
import '../../../../core/presentation/molecules/labeled_underlined_field.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/login_hero_header.dart';

/// Pantalla de inicio de sesión del salón de belleza Elashes.
///
/// Auth deshabilitada temporalmente: el botón "Iniciar Sesión" navega
/// directo al shell sin validar credenciales. Cuando se reactive el
/// flujo, este `onPressed` llamará al notifier de login.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    context.go(AppRoutes.shell);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  padding:
                      const EdgeInsets.fromLTRB(28, 8, 28, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.brandPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Comienza tu viaje de belleza',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 28),
                      LabeledUnderlinedField(
                        label: 'Usuario',
                        hintText: 'Ingresa tu usuario',
                        prefixIcon: Icons.person_outline,
                        controller: _userController,
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 18),
                      LabeledUnderlinedField(
                        label: 'Contraseña',
                        hintText: 'Ingresa tu contraseña',
                        prefixIcon: Icons.lock_outline,
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        autocorrect: false,
                        onSubmitted: (_) => _onLoginPressed(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(28, 8, 28, 28),
                  child: PillButton(
                    label: 'Iniciar Sesión',
                    onPressed: _onLoginPressed,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manolista/core/constants/app_images.dart';
import 'package:manolista/core/core.dart';
import 'package:manolista/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    await ref
        .read(authProvider.notifier)
        .login(_emailController.text.trim(), _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go(RouteNames.home);
      }
    });

    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: context.colors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

          child: Column(
            children: [
              const SizedBox(height: 32),

              const _LoginHeader(),

              const SizedBox(height: 40),

              _LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,

                onTogglePassword: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),

              if (authState.error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),

                  child: Text(
                    authState.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),

              const SizedBox(height: 20),

              _LoginButton(isLoading: authState.isLoading, onPressed: _login),

              const SizedBox(height: 24),

              const _RegisterRedirect(),
            ],
          ),
        ),
      ),
    );
  }
}

// =======================
// HEADER
// =======================

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logo, width: 160, height: 160),
        Text(
          '¡Bienvenido de vuelta!',

          style: TextStyle(
            color: context.colors.textPrimary,

            fontSize: 26,

            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'Ingresa tus credenciales para continuar',

          style: TextStyle(color: context.colors.textSecondary, fontSize: 14),
        ),
      ],
    );
  }
}

// =======================
// FORMULARIO
// =======================

class _LoginForm extends StatelessWidget {
  final TextEditingController emailController;

  final TextEditingController passwordController;

  final bool obscurePassword;

  final VoidCallback onTogglePassword;

  const _LoginForm({
    required this.emailController,

    required this.passwordController,

    required this.obscurePassword,

    required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,

          keyboardType: TextInputType.emailAddress,

          decoration: InputDecoration(
            labelText: 'Correo electrónico',

            prefixIcon: const Icon(Icons.email_outlined),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),

            filled: true,

            fillColor: context.colors.surface,
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: passwordController,

          obscureText: obscurePassword,

          decoration: InputDecoration(
            labelText: 'Contraseña',

            prefixIcon: const Icon(Icons.lock_outlined),

            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),

              onPressed: onTogglePassword,
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),

            filled: true,

            fillColor: context.colors.surface,
          ),
        ),
      ],
    );
  }
}

// =======================
// BOTON LOGIN
// =======================

class _LoginButton extends StatelessWidget {
  final bool isLoading;

  final VoidCallback onPressed;

  const _LoginButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      height: 54,

      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primary,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),

        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                'Iniciar Sesión',

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

// =======================
// REGISTRO
// =======================

class _RegisterRedirect extends StatelessWidget {
  const _RegisterRedirect();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          '¿No tienes una cuenta? ',

          style: TextStyle(color: context.colors.textSecondary),
        ),

        GestureDetector(
          onTap: () => context.go(RouteNames.register),

          child: Text(
            'Regístrate',

            style: TextStyle(
              color: context.colors.primary,

              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:manolista/core/core.dart';
import 'package:manolista/features/auth/presentation/providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _fadeAnimation;

  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,

      duration: const Duration(milliseconds: 1800),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: 0.7,

      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    _finishSplash();
  }

  Future<void> _finishSplash() async {
    // Tiempo mínimo visible del Splash

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    ref.read(authProvider.notifier).completeSplash();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,

      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,

          child: ScaleTransition(
            scale: _scaleAnimation,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),

                        blurRadius: 24,

                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Icon(
                    Icons.handyman_rounded,

                    size: 72,

                    color: context.colors.primary,
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Manolista',

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 36,

                    fontWeight: FontWeight.w800,

                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Tu red de servicios de confianza',

                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),

                const SizedBox(height: 64),

                const SizedBox(
                  width: 28,

                  height: 28,

                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,

                    valueColor: AlwaysStoppedAnimation(Colors.white54),
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

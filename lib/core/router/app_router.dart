import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/providers/auth_state.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/main_shell_screen.dart';

import '../../features/services/presentation/screens/services_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/bookings/presentation/screens/bookings_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

// =====================================================
// ROUTER NOTIFIER
// =====================================================

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authProvider, (_, __) {
      notifyListeners();
    });

    _ref.listen(onboardingProvider, (_, __) {
      notifyListeners();
    });
  }

  AuthState get authState => _ref.read(authProvider);

  bool get hasCompletedOnboarding => _ref.read(onboardingProvider);
}

// =====================================================
// ROUTER PROVIDER
// =====================================================

final routerProvider = Provider((ref) {
  final notifier = RouterNotifier(ref);

  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: RouteNames.splash,

    refreshListenable: notifier,

    redirect: (context, state) {
      final location = state.matchedLocation;

      final auth = notifier.authState;

      // =====================================
      // ESPERAR SPLASH + TOKEN
      // =====================================

      if (!auth.initialized || !auth.splashCompleted) {
        if (location != RouteNames.splash) {
          return RouteNames.splash;
        }

        return null;
      }

      // =====================================
      // USUARIO CON TOKEN
      // =====================================

      if (auth.isAuthenticated) {
        if (location == RouteNames.splash ||
            location == RouteNames.login ||
            location == RouteNames.onboarding) {
          return RouteNames.home;
        }

        return null;
      }

      // =====================================
      // USUARIO NUEVO
      // =====================================

      if (!notifier.hasCompletedOnboarding) {
        if (location != RouteNames.onboarding) {
          return RouteNames.onboarding;
        }

        return null;
      }

      // =====================================
      // SIN SESION
      // =====================================

      final protected = RouteNames.protectedRoutes.contains(location);

      if (protected) {
        return RouteNames.login;
      }

      return null;
    },

    routes: [
      // =========================
      // SPLASH
      // =========================
      GoRoute(
        path: RouteNames.splash,

        name: 'splash',

        builder: (context, state) => const SplashScreen(),
      ),

      // =========================
      // ONBOARDING
      // =========================
      GoRoute(
        path: RouteNames.onboarding,

        name: 'onboarding',

        builder: (context, state) => const OnboardingScreen(),
      ),

      // =========================
      // LOGIN
      // =========================
      GoRoute(
        path: RouteNames.login,

        name: 'login',

        builder: (context, state) => const LoginScreen(),
      ),

      // =========================
      // SERVICES
      // =========================
      GoRoute(
        path: RouteNames.services,

        name: 'services',

        builder: (context, state) => const ServicesScreen(),
      ),

      // =========================
      // MAIN SHELL
      // =========================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellScreen(navigationShell: navigationShell);
        },

        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,

                name: 'home',

                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.search,

                name: 'search',

                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.bookings,

                name: 'bookings',

                builder: (context, state) => const BookingsScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.chat,

                name: 'chat',

                builder: (context, state) => const ChatScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.profile,

                name: 'profile',

                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(child: Text('Ruta no encontrada: ${state.uri}')),
      );
    },
  );
});

// =====================================================
// APP ROUTER
// =====================================================

class AppRouter {
  AppRouter._();
}

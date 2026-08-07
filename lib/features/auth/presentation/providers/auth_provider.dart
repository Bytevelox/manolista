import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:manolista/core/di/providers.dart';
import 'package:manolista/core/storage/token_storage.dart';

import '../../domain/usecases/login_usecase.dart';

import 'auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final LoginUseCase loginUseCase;

  late final TokenStorage tokenStorage;

  @override
  AuthState build() {
    loginUseCase = ref.read(loginUseCaseProvider);

    tokenStorage = ref.read(tokenStorageProvider);

    _restoreSession();

    return const AuthState(isLoading: false);
  }

  // ================================
  // RESTAURAR TOKEN
  // ================================

  Future<void> _restoreSession() async {
    final token = await tokenStorage.getToken();

    if (token != null && token.isNotEmpty) {
      state = state.copyWith(isAuthenticated: true, initialized: true);
    } else {
      state = state.copyWith(isAuthenticated: false, initialized: true);
    }
  }

  // ================================
  // LOGIN
  // ================================

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final session = await loginUseCase(email, password);

      await tokenStorage.saveToken(session.token);

      state = state.copyWith(
        isAuthenticated: true,

        initialized: true,

        isLoading: false,

        session: session,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  // ================================
  // SPLASH TERMINADO
  // ================================

  void completeSplash() {
    state = state.copyWith(splashCompleted: true);
  }

  // ================================
  // LOGOUT
  // ================================

  Future<void> logout() async {
    await tokenStorage.deleteToken();

    state = const AuthState(initialized: true, splashCompleted: true);
  }
}

// ================================
// PROVIDER
// ================================

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

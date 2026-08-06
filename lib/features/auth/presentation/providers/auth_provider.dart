import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manolista/core/di/providers.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';

// =====================
// STATE
// =====================

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final UserEntity? user;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    UserEntity? user,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,

      isLoading: isLoading ?? this.isLoading,

      user: user ?? this.user,

      error: error,
    );
  }
}

// =====================
// DEPENDENCY
// =====================

// Este provider entrega el caso de uso
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

// =====================
// NOTIFIER
// =====================

class AuthNotifier extends Notifier<AuthState> {
  late LoginUseCase loginUseCase;

  @override
  AuthState build() {
    loginUseCase = ref.read(loginUseCaseProvider);

    return const AuthState();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await loginUseCase(email, password);

      state = state.copyWith(
        isLoading: false,

        isAuthenticated: true,

        user: user,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {
    state = const AuthState();
  }
}

// =====================
// PROVIDER PRINCIPAL
// =====================

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

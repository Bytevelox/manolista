import '../../domain/entities/auth_session_entity.dart';

class AuthState {
  final bool isAuthenticated;

  final bool initialized;

  final bool isLoading;

  final bool splashCompleted;

  final AuthSessionEntity? session;

  final String? error;

  const AuthState({
    this.isAuthenticated = false,

    this.initialized = false,

    this.isLoading = false,

    this.splashCompleted = false,

    this.session,

    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,

    bool? initialized,

    bool? isLoading,

    bool? splashCompleted,

    AuthSessionEntity? session,

    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,

      initialized: initialized ?? this.initialized,

      isLoading: isLoading ?? this.isLoading,

      splashCompleted: splashCompleted ?? this.splashCompleted,

      session: session ?? this.session,

      error: error ?? this.error,
    );
  }
}

class RouteNames {
  RouteNames._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/';
  static const String services = '/services';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String chat = '/chat';
  static const String bookings = '/bookings';
  static const String reviews = '/reviews';

  /// Rutas públicas accesibles sin restricciones iniciales.
  static const List<String> publicRoutes = [
    splash,
    onboarding,
    home,
    services,
    search,
  ];

  /// Rutas exclusivas para usuarios sin sesión (invitados).
  static const List<String> authOnlyRoutes = [
    login,
    register,
  ];

  /// Rutas protegidas que requieren autenticación.
  static const List<String> protectedRoutes = [
    profile,
    chat,
    bookings,
    reviews,
  ];
}

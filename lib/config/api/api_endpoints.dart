class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const login = '/auth/login';
  static const logout = '/auth/logout';
  static const register = '/auth/register';
  static const refreshToken = '/auth/refresh';

  // Users
  static const profile = '/users/profile';
  static const users = '/users';

  // Products
  static const products = '/products';

  // Orders
  static const orders = '/orders';
}

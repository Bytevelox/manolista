class ApiHeaders {
  ApiHeaders._();

  static Map<String, String> json() {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  static Map<String, String> auth(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}

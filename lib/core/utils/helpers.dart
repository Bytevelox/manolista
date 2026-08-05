class Helpers {
  Helpers._();

  static bool isNullOrEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
}

extension StringExtension on String {
  bool get isEmail {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(this);
  }

  bool get isNotBlank => trim().isNotEmpty;
}

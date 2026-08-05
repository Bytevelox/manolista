class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo';
    }

    final email = RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!email.hasMatch(value)) {
      return 'Correo inválido';
    }

    return null;
  }
}

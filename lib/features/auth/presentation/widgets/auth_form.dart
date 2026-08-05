import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        TextField(decoration: InputDecoration(labelText: 'Email')),
        SizedBox(height: 16),
        TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:manolista/core/theme/app_theme.dart';
import 'package:manolista/core/theme/theme_extensions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Manolista',

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      // Usa el tema del dispositivo
      themeMode: ThemeMode.system,

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,

      appBar: AppBar(
        title: const Text('Ejemplo de Tema'),
        backgroundColor: context.colors.primary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola Flutter',
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'ThemeExtension',
                  style: TextStyle(color: context.colors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

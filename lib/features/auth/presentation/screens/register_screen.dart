// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:manolista/core/core.dart';
// import '../providers/auth_provider.dart';
// import '../../domain/entities/user_model.dart';

// class RegisterScreen extends ConsumerStatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends ConsumerState<RegisterScreen> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   UserRole _selectedRole = UserRole.client;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _register() async {
//     await ref.read(authProvider.notifier).register(
//           _nameController.text.trim(),
//           _emailController.text.trim(),
//           _passwordController.text,
//           _selectedRole,
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authProvider);
//     final isLoading = authState.isLoading;
//     final error = authState.error;

//     return Scaffold(
//       backgroundColor: context.colors.background,
//       appBar: AppBar(
//         title: const Text('Crear Cuenta'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 'Únete a Manolista',
//                 style: TextStyle(
//                   color: context.colors.textPrimary,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Crea una cuenta como Cliente o Profesional.',
//                 style: TextStyle(color: context.colors.textSecondary),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Nombre completo',
//                   prefixIcon: const Icon(Icons.person_outline),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Correo electrónico',
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Contraseña',
//                   prefixIcon: const Icon(Icons.lock_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<UserRole>(
//                 initialValue: _selectedRole,
//                 decoration: InputDecoration(
//                   labelText: 'Tipo de cuenta',
//                   prefixIcon: const Icon(Icons.work_outline),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: UserRole.client,
//                     child: Text('Cliente'),
//                   ),
//                   DropdownMenuItem(
//                     value: UserRole.professional,
//                     child: Text('Profesional'),
//                   ),
//                 ],
//                 onChanged: (role) {
//                   if (role != null) {
//                     setState(() => _selectedRole = role);
//                   }
//                 },
//               ),
//               if (error != null) ...[
//                 const SizedBox(height: 12),
//                 Text(
//                   error,
//                   style: const TextStyle(color: Colors.red, fontSize: 13),
//                 ),
//               ],
//               const SizedBox(height: 24),
//               SizedBox(
//                 height: 52,
//                 child: ElevatedButton(
//                   onPressed: isLoading ? null : _register,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: context.colors.primary,
//                     foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: isLoading
//                       ? const SizedBox(
//                           width: 22,
//                           height: 22,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2.5,
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.white),
//                           ),
//                         )
//                       : const Text(
//                           'Registrarme',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '¿Ya tienes cuenta? ',
//                     style: TextStyle(color: context.colors.textSecondary),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       context.go(RouteNames.login);
//                     },
//                     child: Text(
//                       'Inicia Sesión',
//                       style: TextStyle(
//                         color: context.colors.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

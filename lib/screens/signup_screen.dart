// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shoe_shop/screens/home_screen.dart';

// import '../providers/auth_provider.dart';
// import '../constants/app_colors.dart';
// import 'main_screen.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   bool _loading = false;

//   Future<void> _signup() async {
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }

//     setState(() => _loading = true);

//     try {
//       await context.read<AuthProvider>().signup(
//             _emailController.text,
//             _passwordController.text,
//           );

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     } finally {
//       if (mounted) setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 const SizedBox(height: 40),

//                 // 👋 Title
//                 const Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 const Text(
//                   'Sign up to start shopping',
//                   style: TextStyle(color: Colors.grey),
//                 ),

//                 const SizedBox(height: 32),

//                 // 📧 Email
//                 TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // 🔒 Password
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // 🔐 Confirm Password
//                 TextField(
//                   controller: _confirmPasswordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),

//                 const SizedBox(height: 24),

//                 // 🔘 Signup Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primary,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: _loading ? null : _signup,
//                     child: _loading
//                         ? const CircularProgressIndicator(
//                             color: Colors.white,
//                           )
//                         : const Text(
//                             'Sign Up',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // 🔁 Login Navigation
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already have an account? '),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const LoginScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Login',
//                         style: TextStyle(color: AppColors.primary),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
 




//  import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/auth_provider.dart';
// import 'main_screen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _email = TextEditingController();
//   final _password = TextEditingController();

//   bool _loading = false;
//   String? _error;

//   Future<void> _signup() async {
//     setState(() {
//       _loading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().signUp(
//             _email.text.trim(),
//             _password.text.trim(),
//           );

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const MainScreen()),
//       );
//     } catch (e) {
//       setState(() => _error = 'Signup failed');
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Create Account')),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             TextField(
//               controller: _email,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _password,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: 'Password'),
//             ),
//             const SizedBox(height: 24),
//             if (_error != null)
//               Text(_error!, style: const TextStyle(color: Colors.red)),
//             ElevatedButton(
//               onPressed: _loading ? null : _signup,
//               child: _loading
//                   ? const CircularProgressIndicator()
//                   : const Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
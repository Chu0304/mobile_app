// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/auth_provider.dart';
// import 'main_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _isLoading = false;
//   String? _error;

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().login(
//             _emailController.text.trim(),
//             _passwordController.text.trim(),
//           );

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const MainScreen()),
//       );
//     } catch (e) {
//       setState(() {
//         _error = 'Invalid email or password';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Welcome Back',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               const SizedBox(height: 8),

//               const Text(
//                 'Login to continue',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey),
//               ),

//               const SizedBox(height: 40),

//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               if (_error != null)
//                 Text(
//                   _error!,
//                   style: const TextStyle(color: Colors.red),
//                   textAlign: TextAlign.center,
//                 ),

//               const SizedBox(height: 12),

//               ElevatedButton(
//                 onPressed: _isLoading ? null : _login,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(
//                         color: Colors.white,
//                       )
//                     : const Text(
//                         'Log In',
//                         style: TextStyle(fontSize: 16),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/auth_provider.dart';
// import 'main_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _isLoading = false;
//   String? _error;

//   // Email/password login
//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().login(
//             _emailController.text.trim(),
//             _passwordController.text.trim(),
//           );

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const MainScreen()),
//       );
//     } catch (e) {
//       setState(() {
//         _error = 'Invalid email or password';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Google login
//   Future<void> _loginWithGoogle() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().loginWithGoogle();

//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const MainScreen()),
//       );
//     } catch (e) {
//       setState(() {
//         _error = 'Google sign-in failed';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Welcome Back',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Login to continue',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 40),
//               // Email
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Password
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               if (_error != null)
//                 Text(
//                   _error!,
//                   style: const TextStyle(color: Colors.red),
//                   textAlign: TextAlign.center,
//                 ),
//               const SizedBox(height: 12),
//               // Email/password login button
//               ElevatedButton(
//                 onPressed: _isLoading ? null : _login,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(
//                         'Log In',
//                         style: TextStyle(fontSize: 16),
//                       ),
//               ),
//               const SizedBox(height: 16),
//               // Google login button
//               ElevatedButton.icon(
//                 onPressed: _isLoading ? null : _loginWithGoogle,
//                 icon: const Icon(Icons.login),
//                 label: const Text('Sign in with Google'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/auth_provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;
//   String? _error;

//   // ================= LOGIN WITH EMAIL =================
//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().login(
//             _emailController.text.trim(),
//             _passwordController.text.trim(),
//           );

//       if (!mounted) return;

//       // Navigate to main screen
//       Navigator.pushReplacementNamed(context, '/main');
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // ================= LOGIN WITH GOOGLE =================
//   Future<void> _loginWithGoogle() async {
//     setState(() {
//       _isLoading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().loginWithGoogle();

//       if (!mounted) return;

//       Navigator.pushReplacementNamed(context, '/main');
//     } catch (e) {
//       setState(() {
//         _error = 'Google sign-in failed';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text(
//                   'Welcome Back 👋',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Login to continue',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 const SizedBox(height: 40),

//                 // ================= EMAIL =================
//                 TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // ================= PASSWORD =================
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 if (_error != null)
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 12),
//                     child: Text(
//                       _error!,
//                       style: const TextStyle(color: Colors.red),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),

//                 // ================= LOGIN BUTTON =================
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: _isLoading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text(
//                           'Log In',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                 ),

//                 const SizedBox(height: 16),

//                 // ================= GOOGLE LOGIN =================
//                 ElevatedButton.icon(
//                   onPressed: _isLoading ? null : _loginWithGoogle,
//                   icon: const Icon(Icons.login),
//                   label: const Text('Sign in with Google'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/auth_provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _loading = false;
//   String? _error;

//   // ================= LOGIN =================
//   Future<void> _login() async {
//     setState(() {
//       _loading = true;
//       _error = null;
//     });

//     try {
//       await context.read<AuthProvider>().login(
//             _emailController.text.trim(),
//             _passwordController.text.trim(),
//           );

//       if (!mounted) return;
//       Navigator.pushReplacementNamed(context, '/main');
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//       });
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfffdf5f2),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Welcome Back 👋",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Login to your shoe shop",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 30),

//               // EMAIL
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // PASSWORD
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               if (_error != null)
//                 Text(
//                   _error!,
//                   style: const TextStyle(color: Colors.red),
//                 ),

//               const SizedBox(height: 10),

//               // LOGIN BUTTON
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _loading ? null : _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     padding: const EdgeInsets.all(15),
//                   ),
//                   child: _loading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("Log In"),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // REGISTER BUTTON
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/register');
//                 },
//                 child: const Text(
//                   "Don’t have an account? Register",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/auth_provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _loading = false;
//   String? _error;

//   // ================= FIXED LOGIN =================
//   Future<void> _login() async {
//     setState(() {
//       _loading = true;
//       _error = null;
//     });

//     final email = _emailController.text.trim().toLowerCase();
//     final password = _passwordController.text.trim();

//     // ✅ VALIDATION FIRST
//     if (email.isEmpty || !email.contains('@')) {
//       setState(() {
//         _error = 'Please enter a valid email';
//         _loading = false;
//       });
//       return;
//     }

//     if (password.isEmpty || password.length < 6) {
//       setState(() {
//         _error = 'Password must be 6+ characters';
//         _loading = false;
//       });
//       return;
//     }

//     try {
//       // ✅ USE context.read (your original works)
//       await context.read<AuthProvider>().login(
//             email,
//             password,
//           );

//       if (!mounted) return;
      
//       // ✅ SUCCESS - Navigate
//       Navigator.pushReplacementNamed(context, '/main');
      
//     } on FirebaseAuthException catch (e) {
//       // ✅ SPECIFIC ERROR MESSAGES
//       String errorMsg;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMsg = 'No account found with this email';
//           break;
//         case 'wrong-password':
//           errorMsg = 'Incorrect password';
//           break;
//         case 'invalid-email':
//           errorMsg = 'Invalid email format';
//           break;
//         case 'user-disabled':
//           errorMsg = 'Account has been disabled';
//           break;
//         case 'too-many-requests':
//           errorMsg = 'Too many failed attempts. Try again later';
//           break;
//         default:
//           errorMsg = e.message ?? 'Login failed';
//       }
//       setState(() => _error = errorMsg);
      
//     } catch (e) {
//       setState(() => _error = 'Login failed. Please try again');
//     } finally {
//       if (mounted) {
//         setState(() => _loading = false);
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfffdf5f2),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.shopping_bag,
//                 size: 80,
//                 color: Colors.pink,
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 "Welcome Back 👋",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Login to your shoe shop",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 40),

//               // EMAIL
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   prefixIcon: const Icon(Icons.email, color: Colors.pink),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // PASSWORD
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   prefixIcon: const Icon(Icons.lock, color: Colors.pink),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // ERROR MESSAGE
//               if (_error != null)
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.red[50],
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.red[200]!),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.error, color: Colors.red[600]),
//                       const SizedBox(width: 8),
//                       Expanded(child: Text(_error!)),
//                     ],
//                   ),
//                 ),

//               const SizedBox(height: 24),

//               // LOGIN BUTTON
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: _loading ? null : _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     foregroundColor: Colors.white,
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: _loading
//                       ? const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             ),
//                             SizedBox(width: 12),
//                             Text('Logging in...'),
//                           ],
//                         )
//                       : const Text(
//                           "LOG IN",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // REGISTER BUTTON
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () => Navigator.pushNamed(context, '/register'),
//                     child: const Text(
//                       "Register",
//                       style: TextStyle(
//                         color: Colors.pink,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
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








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/auth_provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _loading = false;
//   String? _error;

//   Future<void> _login() async {
//     setState(() {
//       _loading = true;
//       _error = null;
//     });

//     final email = _emailController.text.trim().toLowerCase();
//     final password = _passwordController.text.trim();

//     if (email.isEmpty || !email.contains('@')) {
//       setState(() {
//         _error = 'Please enter a valid email';
//         _loading = false;
//       });
//       return;
//     }

//     if (password.isEmpty || password.length < 6) {
//       setState(() {
//         _error = 'Password must be 6+ characters';
//         _loading = false;
//       });
//       return;
//     }

//     // ✅ AuthProvider returns String? - NO try/catch needed
//     final error = await context.read<AuthProvider>().login(email, password);

//     if (error == null) {
//       if (!mounted) return;
//       Navigator.pushReplacementNamed(context, '/main');
//     } else {
//       setState(() => _error = error);
//     }

//     if (mounted) {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfffdf5f2),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.shopping_bag, size: 80, color: Colors.pink),
//               const SizedBox(height: 16),
//               const Text(
//                 "Welcome Back 👋",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text("Login to your shoe shop", style: TextStyle(color: Colors.grey)),
//               const SizedBox(height: 40),

//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   prefixIcon: const Icon(Icons.email, color: Colors.pink),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   prefixIcon: const Icon(Icons.lock, color: Colors.pink),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               if (_error != null)
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.red[50],
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.red[200]!),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.error, color: Colors.red[600]),
//                       const SizedBox(width: 8),
//                       Expanded(child: Text(_error!)),
//                     ],
//                   ),
//                 ),

//               const SizedBox(height: 24),

//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: _loading ? null : _login,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     foregroundColor: Colors.white,
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   child: _loading
//                       ? const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                             ),
//                             SizedBox(width: 12),
//                             Text('Logging in...'),
//                           ],
//                         )
//                       : const Text("LOG IN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ),
//               ),

//               const SizedBox(height: 24),
//               GestureDetector(
//                 onTap: () => Navigator.pushNamed(context, '/register'),
//                 child: const Text(
//                   "Don't have an account? Register",
//                   style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final email = _emailController.text.trim().toLowerCase();
    final password = _passwordController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _error = 'Please enter a valid email';
        _loading = false;
      });
      return;
    }

    if (password.isEmpty || password.length < 6) {
      setState(() {
        _error = 'Password must be 6+ characters';
        _loading = false;
      });
      return;
    }

    final error = await context.read<AuthProvider>().login(email, password);

    if (error == null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      setState(() => _error = error);
    }

    if (mounted) {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf5f2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              // Logo & Title
              const Icon(Icons.shopping_bag, size: 64, color: Colors.pink),
              const SizedBox(height: 16),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 48),

              // Form Card
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Email Field
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined, color: Colors.pink),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.pink, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.pink),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.pink, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Error Message
                    if (_error != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, size: 20, color: Colors.red[600]),
                            const SizedBox(width: 10),
                            Expanded(child: Text(_error!, style: TextStyle(color: Colors.red[800]))),
                          ],
                        ),
                      ),

                    // const SizedBox(height: _error == null ? 32 : 20),
                    SizedBox(height: _error == null ? 32 : 20),


                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.pink.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: _loading
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('Signing In...', style: TextStyle(fontSize: 16)),
                                ],
                              )
                            : const Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New here? ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

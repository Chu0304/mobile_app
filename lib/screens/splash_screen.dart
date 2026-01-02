// // import 'package:flutter/material.dart';
// // import 'main_navigator.dart'; // Navigate to the main app after splash

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Simulate a loading time and then navigate to the main app
// //     Future.delayed(const Duration(seconds: 3), () {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const MainNavigator()),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Image.asset(
// //               'assets/logo.png', // Your pink shoe logo
// //               width: 150,
// //               height: 150,
// //             ),
// //             const SizedBox(height: 20),
// //             const Text(
// //               'Project Shop',
// //               style: TextStyle(
// //                 fontSize: 28,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }







// // import 'package:flutter/material.dart';
// // import 'package:shoe_shop/screens/home_page.dart';
// // import 'home_screen.dart'; // adjust path if needed

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();

// //     Future.delayed(const Duration(seconds: 2), () {
// //       if (!mounted) return;

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => const HomeScreen(),
// //         ),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: CircleAvatar(
// //           radius: 50,
// //           backgroundColor: Colors.pink,
// //           child: const Icon(
// //             Icons.shopping_bag,
// //             color: Colors.white,
// //             size: 40,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// //import 'home_page.dart'; // Make sure the path is correct

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe Shop',
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Wait for 2 seconds and navigate to HomeScreen
//     Future.delayed(const Duration(seconds: 2), () {
//       if (!mounted) return; // Ensure widget is still in the tree

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const HomeScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircleAvatar(
//           radius: 50,
//           backgroundColor: Colors.pink,
//           child: const Icon(
//             Icons.shopping_bag,
//             color: Colors.white,
//             size: 40,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Example HomeScreen
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: const Center(
//         child: Text(
//           'App Running',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'main_screen.dart';
// import 'login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigate();
//   }

//   Future<void> _navigate() async {
//     await Future.delayed(const Duration(seconds: 2));

//     final user = FirebaseAuth.instance.currentUser;

//     if (!mounted) return;

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (_) => user == null
//             ? const LoginScreen()
//             : const MainScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // 🔵 App Logo (replace with your asset if needed)
//             Container(
//               height: 120,
//               width: 120,
//               decoration: BoxDecoration(
//                 color: Colors.pink.shade100,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.directions_run,
//                 size: 60,
//                 color: Colors.pink,
//               ),
//             ),

//             const SizedBox(height: 24),

//             const Text(
//               'Shoe Shop',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 8),

//             const Text(
//               'Find your perfect style',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),

//             const SizedBox(height: 30),

//             const CircularProgressIndicator(
//               color: Colors.pink,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_screen.dart';
import 'login_screen.dart';
import 'OnboardingScreen.dart';  // ✅ ADD THIS IMPORT

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    // ✅ PERFECT FLOW: Check auth → Route accordingly
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => user == null
            ? const OnboardingScreen()      // ✅ NEW: First-time users see shoes
            : const MainScreen(),           // ✅ Logged-in users go direct to home
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔵 App Logo
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_bag,  // ✅ Better shoe store icon
                size: 60,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Shoe Shop',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Find your perfect style',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 40),

            // Animated Loading
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:shoe_shop/providers/cart_provider.dart';

// import 'providers/product_provider.dart';
// // ignore: duplicate_import
// import 'providers/product_provider.dart';
// import 'providers/auth_provider.dart';
// import 'screens/main_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Shoe Shop',
//         theme: ThemeData(primarySwatch: Colors.pink),
//         home: const MainScreen(),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart'; // Required
// import 'package:provider/provider.dart';

// // 1. IMPORTANT: Import your generated options file
// import 'firebase_options.dart'; 

// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'screens/splash_screen.dart';

// void main() async {
//   // 2. Ensure Flutter bindings are initialized
//   WidgetsFlutterBinding.ensureInitialized();

//   // 3. Pass the DefaultFirebaseOptions to the initialization
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const SplashScreen(),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

// import 'firebase_options.dart'; 
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// // 1. ADD THIS IMPORT (Make sure this file exists in your providers folder)
// import 'providers/product_provider.dart'; 

// import 'screens/splash_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         // 2. FIX: Add the ProductProvider here so HomeScreen can find it
//         ChangeNotifierProvider(create: (_) => ProductProvider()), 
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // You can use your app_colors.dart here for the theme
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

// import 'firebase_options.dart';
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'providers/product_provider.dart';

// import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/main_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),

//       /// 🔀 ROUTES (important for Profile → Logout)
//       routes: {
//         '/login': (_) => const LoginScreen(),
//         '/main': (_) => const MainScreen(),
//       },

//       /// 🏁 ENTRY POINT
//       home: const SplashScreen(),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart'; // ✅ Added Stripe Import

// import 'firebase_options.dart';
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'providers/product_provider.dart';
// import 'providers/payment_provider.dart'; // ✅ Added Payment Provider Import

// import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/main_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 1️⃣ Initialize Firebase
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // 2️⃣ Initialize Stripe with your Publishable Key
//   // Replace "pk_test_..." with your actual key from the Stripe Dashboard
//   Stripe.publishableKey = "pk_test_your_key_here";
//   await Stripe.instance.applySettings();

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//         ChangeNotifierProvider(create: (_) => PaymentProvider()), // ✅ Added this line
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
//       ),

//       /// 🔀 ROUTES
//       routes: {
//         '/login': (_) => const LoginScreen(),
//         '/main': (_) => const MainScreen(),
//       },

//       /// 🏁 ENTRY POINT
//       home: const SplashScreen(),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart'; 
// import 'package:flutter/foundation.dart' show kIsWeb; // ✅ Needed for Web check

// import 'firebase_options.dart';
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'providers/product_provider.dart';
// import 'providers/payment_provider.dart'; 

// import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/main_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 1️⃣ Initialize Firebase (Works on both Web and Mobile)
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // 2️⃣ Initialize Stripe ONLY if NOT running on Web
//   // This prevents the "Unsupported operation: Platform" error
//   if (!kIsWeb) {
//     Stripe.publishableKey = "<pk_test_51SjTeRBaCSDV5YEFTuT9VNowfuTIYA1Y85zMZwcaZvzCVglF99hGE9HrtSDM4LxwimErwP4yHS2mcQK3zYc2EiSQ00bqpHHyG0>"; // 🔑 Replace with your actual key
//     await Stripe.instance.applySettings();
//   }

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//         ChangeNotifierProvider(create: (_) => PaymentProvider()), 
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
//         useMaterial3: true,
//       ),

//       /// 🔀 ROUTES
//       routes: {
//         '/login': (_) => const LoginScreen(),
//         '/main': (_) => const MainScreen(),
//       },

//       /// 🏁 ENTRY POINT
//       home: const SplashScreen(),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:shoe_shop/screens/register_screen.dart';

// import 'firebase_options.dart';

// // Providers
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'providers/product_provider.dart';
// import 'providers/payment_provider.dart';

// // Screens
// import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/main_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 🔥 Initialize Firebase (Web + Mobile)
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // 💳 Initialize Stripe ONLY on Mobile
//   if (!kIsWeb) {
//     Stripe.publishableKey =
//         'pk_test_51SjTeRBaCSDV5YEFTuT9VNowfuTIYA1Y85zMZwcaZvzCVglF99hGE9HrtSDM4LxwimErwP4yHS2mcQK3zYc2EiSQ00bqpHHyG0'; // ✅ REMOVE < > and use real key
//     await Stripe.instance.applySettings();
//   }

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//         ChangeNotifierProvider(create: (_) => PaymentProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
//         useMaterial3: true,
//       ),

//       // 🔀 ROUTES
//       routes: {
//         '/login': (_) => const LoginScreen(),
//         '/main': (_) => const MainScreen(),
//         '/register': (context) => RegisterScreen(),  // ✅ Use this

//       },

//       // 🏁 ENTRY POINT
//       home: const SplashScreen(),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shoe_shop/screens/OnboardingScreen.dart';
import 'package:shoe_shop/screens/register_screen.dart';
import 'firebase_options.dart';

// Providers
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/product_provider.dart';
import 'providers/payment_provider.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/cart_screen.dart';  // ✅ ADD THIS

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Initialize Firebase (Web + Mobile)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 💳 Initialize Stripe ONLY on Mobile
  if (!kIsWeb) {
    Stripe.publishableKey =
        'pk_test_51SjTeRBaCSDV5YEFTuT9VNowfuTIYA1Y85zMZwcaZvzCVglF99hGE9HrtSDM4LxwimErwP4yHS2mcQK3zYc2EiSQ00bqpHHyG0';
    await Stripe.instance.applySettings();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),

      // ✅ FIX 1: Start with Splash Screen
      initialRoute: '/splash',

      // ✅ FIX 2: ALL ROUTES DEFINED
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),  // ✅ ADD THIS
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),  // ✅ Fixed const
        '/main': (_) => const MainScreen(),          // ✅ Your home screen
        '/home': (_) => const MainScreen(),          // ✅ ADDED - Fixes Register error
        '/cart': (_) => const CartScreen(),          // ✅ Cart screen
      },

      // ✅ FIX 3: Unknown route fallback
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      },
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:shoe_shop/screens/home_screen.dart';
// import 'screens/favorites_screen.dart';
// import 'screens/cart_screen.dart';
// //import 'screens/profile_screen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;

//   late final List<Widget> _screens;

//   @override
//   void initState() {
//     super.initState();
//     _screens = const [
//       HomeScreen(),
//       FavoritesScreen(),
//       CartScreen(),
//       ProfileScreen(),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.pink,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Discover',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Simple ProfileScreen placeholder
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Profile Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

// import 'firebase_options.dart';
// import 'providers/auth_provider.dart';
// import 'providers/cart_provider.dart';
// import 'providers/favorites_provider.dart';
// import 'providers/product_provider.dart';
// import 'screens/splash_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Shoe App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink, // matches your favorites/cart UI
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.pink,
//           elevation: 0,
//           centerTitle: true,
//         ),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
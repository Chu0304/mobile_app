
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shoe_shop/screens/settings_screen.dart';
import 'providers/theme_provider.dart';  // ✅ NEW IMPORT

// Providers
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/product_provider.dart';
import 'providers/payment_provider.dart';

// Screens
import 'screens/OnboardingScreen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/cart_screen.dart';
import 'firebase_options.dart';

// do ur task here

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shoe_shop/screens/settings_screen.dart';
import 'providers/theme_provider.dart';  // ✅ NEW IMPORT

// Providers
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/product_provider.dart';
import 'providers/payment_provider.dart';

// Screens
import 'screens/OnboardingScreen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/cart_screen.dart';
import 'firebase_options.dart';

// do ur task here
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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),  // ✅ NEW: Theme first
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
    return Consumer<ThemeProvider>(  // ✅ Wrap MaterialApp with Consumer
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shoe App',
          
          // ✅ DYNAMIC THEME MODE
          themeMode: themeProvider.themeMode,
          
          // ✅ LIGHT THEME
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          
          // ✅ DARK THEME
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink,
              brightness: Brightness.dark,
            ),
            brightness: Brightness.dark,
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.grey[900],
          ),

          // ✅ START WITH SPLASH
          initialRoute: '/splash',

          // ✅ ALL ROUTES
          routes: {
            '/splash': (_) => const SplashScreen(),
            '/onboarding': (_) => const OnboardingScreen(),
            '/login': (_) => const LoginScreen(),
            '/register': (_) => const RegisterScreen(),
            '/main': (_) => const MainScreen(),
            '/home': (_) => const MainScreen(),
            '/cart': (_) => const CartScreen(),
            '/settings': (_) => const SettingsScreen(),
          },

          // ✅ FALLBACK ROUTE
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            );
          },
        );
      },
    );
  }
}

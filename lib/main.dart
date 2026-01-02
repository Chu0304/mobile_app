
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
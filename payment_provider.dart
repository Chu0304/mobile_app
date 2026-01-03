// import 'package:flutter/material.dart';

// enum PaymentMethod { card, applePay, googlePay, cash }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod _selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;

//   PaymentMethod get selectedMethod => _selectedMethod;
//   bool get isProcessing => _isProcessing;

//   void setMethod(PaymentMethod method) {
//     _selectedMethod = method;
//     notifyListeners();
//   }

//   // Simulated Payment Process
//   Future<bool> processPayment(double amount) async {
//     _isProcessing = true;
//     notifyListeners();

//     // Simulate network delay to the bank
//     await Future.delayed(const Duration(seconds: 3));

//     _isProcessing = false;
//     notifyListeners();
    
//     return true; // Assume success for this demo
//   }

//   Future<bool> makePayment(double totalPrice, BuildContext context) async {
//     final bool success = await processPayment(totalPrice);

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Payment successful')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Payment failed')),
//       );
//     }

//     return success;
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart'; // ✅ Required for real payments
// import 'package:dio/dio.dart'; // ✅ Required to talk to Stripe server

// enum PaymentMethod { card, applePay, googlePay, cash }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod _selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;

//   PaymentMethod get selectedMethod => _selectedMethod;
//   bool get isProcessing => _isProcessing;

//   void setMethod(PaymentMethod method) {
//     _selectedMethod = method;
//     notifyListeners();
//   }

//   /// 💳 The Real Stripe Payment Logic
//   Future<bool> makePayment(double amount, BuildContext context) async {
//     try {
//       _isProcessing = true;
//       notifyListeners();

//       // 1. Create Payment Intent (Simulating a backend call to Stripe)
//       // Stripe expects amounts in cents ($10.00 = 1000)
//       final int amountInCents = (amount * 100).toInt();
      
//       // NOTE: In a real app, move this Dio call to your own Node.js/Firebase backend
//       final response = await Dio().post(
//         'https://api.stripe.com/v1/payment_intents',
//         data: {
//           'amount': amountInCents.toString(),
//           'currency': 'usd',
//           'payment_method_types[]': 'card',
//         },
//         options: Options(headers: {
//           'Authorization': 'Bearer sk_test_YOUR_SECRET_KEY', // 🔑 Use your Secret Key
//           'Content-Type': 'application/x-www-form-urlencoded'
//         }),
//       );

//       final String clientSecret = response.data['client_secret'];

//       // 2. Initialize the Payment Sheet UI
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: clientSecret,
//           merchantDisplayName: 'Shoe Shop Deluxe',
//           style: ThemeMode.light,
//         ),
//       );

//       // 3. Present the Sheet to the User
//       await Stripe.instance.presentPaymentSheet();

//       // ✅ SUCCESS
//       return true;

//     } catch (e) {
//       // ❌ FAILURE
//       if (e is StripeException) {
//         debugPrint("Stripe Error: ${e.error.localizedMessage}");
//       } else {
//         debugPrint("General Payment Error: $e");
//       }
//       return false; 
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }




















// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentMethod;
// import 'package:dio/dio.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shoe_shop/screens/checkout_screen.dart';

// class PaymentProvider with ChangeNotifier {
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   PaymentMethod? get selectedMethod => null;

//   /// 💳 Make Stripe Payment
//   Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
//     try {
//       _isProcessing = true;
//       notifyListeners();

//       final user = _auth.currentUser;
//       if (user == null) return false;

//       // 1️⃣ Call your backend to create PaymentIntent
//       final response = await Dio().post(
//         'https://your-backend.com/create-payment-intent', // replace with your backend URL
//         data: {'amount': (amount * 100).toInt()},
//       );

//       final clientSecret = response.data['clientSecret'];

//       // 2️⃣ Initialize Payment Sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: clientSecret,
//           merchantDisplayName: 'Shoe Shop Deluxe',
//         ),
//       );

//       // 3️⃣ Present Payment Sheet
//       await Stripe.instance.presentPaymentSheet();

//       // ✅ Payment successful → save order
//       await _saveOrder(user.uid, cartItems, amount);

//       return true;

//     } catch (e) {
//       debugPrint('Payment failed: $e');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }

//   /// Save order to Firestore
//   Future<void> _saveOrder(String userId, List<Map<String, dynamic>> items, double total) async {
//     final orderRef = _firestore.collection('orders').doc();
//     await orderRef.set({
//       'userId': userId,
//       'items': items,
//       'total': total,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   void setMethod(PaymentMethod paymentMethod) {}
// }








// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class PaymentProvider with ChangeNotifier {
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // For selection, can expand if needed
//   PaymentMethod selectedMethod = PaymentMethod.card;

//   /// ✅ Make a fake payment for testing
//   Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       // Simulate payment delay
//       await Future.delayed(const Duration(seconds: 2));

//       final user = _auth.currentUser;
//       if (user == null) return false;

//       // Save order to Firestore
//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': cartItems,
//         'total': amount,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       return true; // payment successful
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }

//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }
// }

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }













// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card; // default selected method
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Update selected payment method
//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// Simulate payment and save order to Firestore
//   Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       // Simulate payment delay
//       await Future.delayed(const Duration(seconds: 2));

//       final user = _auth.currentUser;
//       if (user == null) return false;

//       // Save order to Firestore
//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': cartItems,
//         'total': amount,
//         'paymentMethod': selectedMethod.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       return true; // payment successful
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Update selected payment method
//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// ✅ FIXED: Proper payment simulation with error handling
//   Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       print('🔍 PaymentProvider: Starting payment for \$${amount.toStringAsFixed(2)}');
//       print('🔍 PaymentProvider: Items count: ${cartItems.length}');
//       print('🔍 PaymentProvider: User: ${_auth.currentUser?.uid ?? "NO USER"}');

//       // 1. Validate inputs
//       if (amount <= 0) {
//         print('❌ PaymentProvider: Invalid amount: $amount');
//         return false;
//       }

//       if (cartItems.isEmpty) {
//         print('❌ PaymentProvider: Empty cart items');
//         return false;
//       }

//       final user = _auth.currentUser;
//       if (user == null) {
//         print('❌ PaymentProvider: No authenticated user');
//         return false;
//       }

//       // 2. Simulate payment processing
//       await Future.delayed(const Duration(seconds: 2));

//       // 3. ✅ FIXED: Validate Firestore write permissions & connection
//       await _firestore.collection('orders').limit(1).get();
      
//       // 4. Save order to Firestore
//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': cartItems,
//         'total': amount,
//         'paymentMethod': selectedMethod.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       print('✅ PaymentProvider: Order saved successfully!');
//       return true;

//     } catch (e, stackTrace) {
//       print('💥 PaymentProvider ERROR: $e');
//       print('💥 StackTrace: $stackTrace');
//       return false;
      
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// ✅ FIXED: Proper Product to Map conversion
//   Map<String, dynamic> _productToMap(dynamic item) {
//     return {
//       'id': item.id?.toString() ?? '',
//       'name': item.name ?? 'Unknown',
//       'price': item.price?.toDouble() ?? 0.0,
//       'image': item.image ?? '',
//     };
//   }

//   Future<bool> makePayment(double amount, List<dynamic> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       print('🔍 PaymentProvider: Starting payment for \$${amount.toStringAsFixed(2)}');
      
//       // ✅ FIX 1: Convert Product objects to Maps
//       final paymentItems = cartItems.map(_productToMap).toList();
//       print('🔍 PaymentProvider: Converted ${cartItems.length} items to maps');

//       final user = _auth.currentUser;
//       if (user == null) {
//         print('❌ No authenticated user');
//         return false;
//       }

//       // 2. Simulate payment
//       await Future.delayed(const Duration(seconds: 2));

//       // 3. Save to Firestore with proper Maps
//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': paymentItems,  // ✅ Now proper Maps, not Product objects
//         'total': amount,
//         'paymentMethod': selectedMethod.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       print('✅ PaymentProvider: Order saved successfully!');
//       return true;

//     } catch (e, stackTrace) {
//       print('💥 PaymentProvider ERROR: $e');
//       print('💥 StackTrace: $stackTrace');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/product.dart';  // ✅ ADD THIS IMPORT

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// ✅ FIXED: Type-safe Product conversion
//   Map<String, dynamic> _productToMap(dynamic item) {
//     // Handle both Product objects AND Maps
//     if (item is Product) {
//       return {
//         'id': item.id.toString(),
//         'name': item.name,
//         'price': item.price.toDouble(),
//         'image': item.image,
//       };
//     } else if (item is Map<String, dynamic>) {
//       return {
//         'id': item['id']?.toString() ?? '',
//         'name': item['name'] ?? 'Unknown',
//         'price': (item['price'] as num?)?.toDouble() ?? 0.0,
//         'image': item['image'] ?? '',
//       };
//     }
//     return {'id': '', 'name': 'Unknown', 'price': 0.0, 'image': ''};
//   }

//   Future<bool> makePayment(double amount, List<dynamic> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       print('🔍 PaymentProvider: Starting payment for \$${amount.toStringAsFixed(2)}');
      
//       // ✅ SAFE CONVERSION - handles Product OR Map
//       final paymentItems = cartItems.map(_productToMap).toList();
//       print('✅ PaymentProvider: Converted ${cartItems.length} → ${paymentItems.length} Maps');
//       print('✅ First item type: ${paymentItems.isNotEmpty ? paymentItems.first.runtimeType : 'empty'}');

//       final user = _auth.currentUser;
//       if (user == null) {
//         print('❌ No authenticated user');
//         return false;
//       }

//       await Future.delayed(const Duration(seconds: 2));

//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': paymentItems,  // ✅ Pure Maps only
//         'total': amount,
//         'paymentMethod': selectedMethod.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       print('✅ SUCCESS: Order saved to Firestore!');
//       return true;

//     } catch (e, stackTrace) {
//       print('💥 PaymentProvider ERROR: $e');
//       print('💥 StackTrace: $stackTrace');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }






















// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// ✅ FIXED: NO PROPERTY ACCESS - Pure Map extraction only
//   Map<String, dynamic> _safeToMap(dynamic item) {
//     try {
//       // Handle Maps (Firestore IdentityMap, LinkedHashMap, etc.)
//       if (item is Map) {
//         return {
//           'id': item['id']?.toString() ?? '',
//           'name': item['name'] ?? 'Unknown',
//           'price': (item['price'] as num?)?.toDouble() ?? 0.0,
//           'image': item['image']?.toString() ?? '',
//         };
//       }
      
//       // Handle Product objects
//       return {
//         'id': item.toString(),  // Safe fallback
//         'name': 'Product',
//         'price': 0.0,
//         'image': '',
//       };
//     } catch (e) {
//       print('⚠️ _safeToMap error: $e');
//       return {'id': '', 'name': 'Error', 'price': 0.0, 'image': ''};
//     }
//   }

//   Future<bool> makePayment(double amount, List<dynamic> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       print('🔍 PaymentProvider: Starting payment for \$${amount.toStringAsFixed(2)}');
      
//       // ✅ ULTRA-SAFE: Only Map extraction, NO property access
//       final paymentItems = cartItems.map(_safeToMap).toList();
      
//       print('✅ PaymentProvider: Processed ${cartItems.length} → ${paymentItems.length} items');
      
//       final user = _auth.currentUser;
//       if (user == null) {
//         print('❌ No authenticated user');
//         return false;
//       }

//       // Simulate payment
//       await Future.delayed(const Duration(seconds: 2));

//       // ✅ Firestore-safe Maps only
//       await _firestore.collection('orders').add({
//         'userId': user.uid,
//         'items': paymentItems,
//         'total': amount,
//         'paymentMethod': selectedMethod.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       print('✅ SUCCESS: Order saved to Firestore!');
//       return true;

//     } catch (e, stackTrace) {
//       print('💥 PaymentProvider ERROR: $e');
//       print('💥 StackTrace: $stackTrace');
//       return false;
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
// import 'package:url_launcher/url_launcher.dart';

// enum PaymentMethod {
//   card,
//   paypal,    // ✅ NEW
//   googlePay,
//   cash,
// }

// class PaymentProvider with ChangeNotifier {
//   PaymentMethod selectedMethod = PaymentMethod.card;
//   bool _isProcessing = false;
//   bool get isProcessing => _isProcessing;

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // ✅ PayPal Credentials (Get from PayPal Developer Dashboard)
//   static const String paypalClientId = 'YOUR_PAYPAL_CLIENT_ID';
//   static const String paypalSecret = 'YOUR_PAYPAL_SECRET';

//   void setMethod(PaymentMethod method) {
//     selectedMethod = method;
//     notifyListeners();
//   }

//   /// ✅ REAL PAYMENT INTEGRATION
//   Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
//     _isProcessing = true;
//     notifyListeners();

//     try {
//       final user = _auth.currentUser;
//       if (user == null) return false;

//       // ✅ Route payment by method
//       switch (selectedMethod) {
//         case PaymentMethod.card:
//           return await _processCardPayment(amount, cartItems, user.uid);
//         case PaymentMethod.paypal:
//           return await _processPayPalPayment(amount, cartItems, user.uid);
//         case PaymentMethod.googlePay:
//           return await _processGooglePay(amount, cartItems, user.uid);
//         case PaymentMethod.cash:
//           return await _processCashOnDelivery(amount, cartItems, user.uid);
//       }
//     } finally {
//       _isProcessing = false;
//       notifyListeners();
//     }
//   }

//   /// 💳 Card Payment (Stripe simulation)
//   Future<bool> _processCardPayment(double amount, List<Map<String, dynamic>> cartItems, String userId) async {
//     await Future.delayed(const Duration(seconds: 2)); // Simulate Stripe
//     return await _saveOrder(amount, cartItems, userId, 'card');
//   }

//   /// ✅ REAL PayPal Payment
//   Future<bool> _processPayPalPayment(double amount, List<Map<String, dynamic>> cartItems, String userId) async {
//     try {
//       final paypalPayment = await FlutterPaypalPayment(
//         clientId: paypalClientId,
//         secret: paypalSecret,
//         amount: amount.toString(),
//         currency: 'USD',
//         sandboxMode: true, // Change to false for production
//         successCallback: (response) {
//           print('✅ PayPal Success: $response');
//           _saveOrder(amount, cartItems, userId, 'paypal');
//         },
//         cancelCallback: (response) {
//           print('❌ PayPal Cancelled: $response');
//         },
//         errorCallback: (response) {
//           print('💥 PayPal Error: $response');
//         },
//       );
      
//       // Launch PayPal
//       if (await canLaunchUrl(Uri.parse(paypalPayment.paymentUrl))) {
//         await launchUrl(Uri.parse(paypalPayment.paymentUrl));
//       }
      
//       return true; // PayPal handles verification
//     } catch (e) {
//       print('💥 PayPal Error: $e');
//       return false;
//     }
//   }

//   /// 💰 Google Pay (Future implementation)
//   Future<bool> _processGooglePay(double amount, List<Map<String, dynamic>> cartItems, String userId) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return await _saveOrder(amount, cartItems, userId, 'google_pay');
//   }

//   /// 🛵 Cash on Delivery
//   Future<bool> _processCashOnDelivery(double amount, List<Map<String, dynamic>> cartItems, String userId) async {
//     return await _saveOrder(amount, cartItems, userId, 'cash_on_delivery');
//   }

//   /// ✅ Save Order to Firestore
//   Future<bool> _saveOrder(double amount, List<Map<String, dynamic>> cartItems, String userId, String method) async {
//     try {
//       await _firestore.collection('orders').add({
//         'userId': userId,
//         'items': cartItems,
//         'total': amount,
//         'paymentMethod': method,
//         'status': method == 'cash_on_delivery' ? 'pending' : 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//       print('✅ Order saved: $method');
//       return true;
//     } catch (e) {
//       print('💥 Save Order Error: $e');
//       return false;
//     }
//   }
// }












import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

enum PaymentMethod { card, paypal, googlePay, cash }

class PaymentProvider with ChangeNotifier {
  PaymentMethod selectedMethod = PaymentMethod.card;
  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setMethod(PaymentMethod method) {
    selectedMethod = method;
    notifyListeners();
  }

  Future<bool> makePayment(double amount, List<Map<String, dynamic>> cartItems) async {
    _isProcessing = true;
    notifyListeners();

    try {
      final user = _auth.currentUser;
      if (user == null) return false;

      switch (selectedMethod) {
        case PaymentMethod.card:
        case PaymentMethod.googlePay:
          await Future.delayed(Duration(seconds: 2)); // Simulate
          break;
        case PaymentMethod.paypal:
          await _launchPayPal(amount);
          break;
        case PaymentMethod.cash:
          break;
      }

      // Save order
      await _firestore.collection('orders').add({
        'userId': user.uid,
        'items': cartItems,
        'total': amount,
        'paymentMethod': selectedMethod.toString().split('.').last,
        'status': selectedMethod == PaymentMethod.cash ? 'pending' : 'paid',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      debugPrint('Payment error: $e');
      return false;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> _launchPayPal(double amount) async {
    // ✅ REAL PayPal Sandbox Link (Replace YOUR_CLIENT_ID)
    final paypalUrl = Uri.parse(
      'https://www.sandbox.paypal.com/ncpubugroup?amount=${amount.toStringAsFixed(2)}&currency=USD'
    );
    
    if (await canLaunchUrl(paypalUrl)) {
      await launchUrl(paypalUrl, mode: LaunchMode.externalApplication);
    }
  }
}


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

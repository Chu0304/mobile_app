import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../providers/cart_provider.dart';

enum PaymentMethod { card, googlePay, cash, paypal }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod? _selectedMethod;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final total = cart.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Order Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Order Summary
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Order Summary', 
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        ...cart.cartItems.map((item) => ListTile(
                              leading: Image.network(item.image, 
                                  width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(item.name, 
                                  style: const TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: const Text('x1'),
                              trailing: Text('\$${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            )),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total', 
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            Text('\$${total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 24, 
                                    fontWeight: FontWeight.w800, 
                                    color: Colors.pink)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Payment Methods
                const Text('Choose Payment Method', 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),

                // 1. CARD PAYMENT
                _buildPaymentOption(
                    'Credit/Debit Card', 
                    Icons.credit_card, 
                    Colors.blue, 
                    'Visa, MasterCard, Amex',
                    PaymentMethod.card
                ),
                const SizedBox(height: 12),

                // 2. GOOGLE PAY
                _buildPaymentOption(
                    'Google Pay', 
                    Icons.payment, 
                    Colors.green, 
                    'Fast & Secure', 
                    PaymentMethod.googlePay
                ),
                const SizedBox(height: 12),

                // 3. CASH ON DELIVERY
                _buildPaymentOption(
                    'Cash on Delivery', 
                    Icons.money_off, 
                    Colors.orange, 
                    'Pay when delivered',
                    PaymentMethod.cash
                ),
                const SizedBox(height: 12),

                // 4. PAYPAL
                _buildPaymentOption(
                    'PayPal', 
                    Icons.account_balance_wallet, 
                    Colors.purple, 
                    'Secure online payment',
                    PaymentMethod.paypal
                ),
              ],
            ),
          ),

          // Bottom Payment Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -2))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Payable:", 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.pink)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.pink.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _isProcessing || _selectedMethod == null 
                        ? null 
                        : () => _processPayment(context, cart, total),
                    child: _isProcessing
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
                              Text('Processing...', style: TextStyle(fontSize: 16)),
                            ],
                          )
                        : const Text(
                            "CONFIRM & PAY NOW",
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
          )
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, Color color, 
      String subtitle, PaymentMethod method) {
    final isSelected = _selectedMethod == method;

    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = method),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.withOpacity(0.08) : Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.pink : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                        color: isSelected ? Colors.pink : Colors.black87,
                      )),
                  Text(subtitle, 
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      )),
                ],
              ),
            ),
            Radio(
              value: method,
              groupValue: _selectedMethod,
              activeColor: Colors.pink,
              onChanged: (value) => setState(() => _selectedMethod = method),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _processPayment(BuildContext context, CartProvider cart, double total) async {
    setState(() => _isProcessing = true);

    try {
      switch (_selectedMethod) {
        case PaymentMethod.card:
          await _processCardPayment(context, total);
          break;
        case PaymentMethod.googlePay:
          await _processGooglePay(context);
          break;
        case PaymentMethod.cash:
          await _processCashPayment(context);
          break;
        case PaymentMethod.paypal:
          await _processPaypal(context);
          break;
        default:
          throw Exception('No payment method selected');
      }

      // Save to Firebase & Clear Cart
      await _saveOrderToFirebase(cart);
      cart.clearCart();
      
      if (context.mounted) {
        _showSuccessDialog(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  // ✅ FIXED REAL STRIPE CARD PAYMENT
  Future<void> _processCardPayment(BuildContext context, double total) async {
    try {
      // ✅ CALL YOUR FIREBASE FUNCTION - REPLACE WITH YOUR URL
      final response = await http.post(
        Uri.parse('https://us-central1-shoe-app-abc123.cloudfunctions.net/createPaymentIntent'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'amount': (total * 100).toInt()}), // cents
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent');
      }

      final paymentIntentData = jsonDecode(response.body);
      
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['clientSecret'],
          merchantDisplayName: 'Shoe Shop',
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
        ),
      );

      // ✅ Show real payment sheet
      await Stripe.instance.presentPaymentSheet();
      
    } catch (e) {
      throw Exception('Card payment failed: $e');
    }
  }

  Future<void> _processGooglePay(BuildContext context) async {
    // Simulate Google Pay
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _processCashPayment(BuildContext context) async {
    // Cash on Delivery - Instant success
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  Future<void> _processPaypal(BuildContext context) async {
    // Simulate PayPal redirect
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> _saveOrderToFirebase(CartProvider cart) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection('orders').add({
      'userId': user.uid,
      'items': cart.cartItems.map((item) => {
        'id': item.id,
        'name': item.name,
        'price': item.price,
        'quantity': 1,
        'image': item.image,
      }).toList(),
      'total': cart.totalPrice,
      'paymentMethod': _selectedMethod.toString().split('.').last,
      'status': 'paid',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              "🎉 Payment Successful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Your order has been placed successfully!\nTrack it from Profile.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Continue Shopping", 
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

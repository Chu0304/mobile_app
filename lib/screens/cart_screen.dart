import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/cart_provider.dart';
import '../providers/payment_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isProcessing = false;

  // ✅ PERFECT Payment Icons Helper
  IconData _getPaymentIcon(dynamic method) {
    switch (method.toString().split('.').last) {
      case 'card':
        return Icons.credit_card;
      case 'paypal':
        return Icons.account_balance_wallet;
      case 'googlePay':
        return Icons.payment;
      case 'cash':
        return Icons.money_off;
      default:
        return Icons.payment;
    }
  }

  Future<void> _handleCheckout() async {
    final cart = context.read<CartProvider>();
    final payment = context.read<PaymentProvider>();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showSnack('Please login to checkout', Colors.red);
      return;
    }

    if (cart.cartItems.isEmpty) {
      _showSnack('Your cart is empty!', Colors.orange);
      return;
    }

    setState(() => _isProcessing = true);

    try {
      // ✅ UPDATED: Include size, color, quantity
      final paymentItems = cart.cartItems.map((item) {
        return <String, dynamic>{
          'id': item.id.toString(),
          'name': item.name,
          'price': item.price.toDouble(),
          'image': item.image,
          'quantity': item.quantity ?? 1,  // ✅ From cart
          'size': item.selectedSize ?? 'US 8',  // ✅ From product details
          'color': item.selectedColor ?? 'White',  // ✅ From product details
        };
      }).toList();

      print('🔍 CartScreen: Sending ${paymentItems.length} items with size/color/qty');

      bool success = await payment.makePayment(cart.totalPrice, paymentItems);

      if (success) {
        await FirebaseFirestore.instance.collection('orders').add({
          'userId': user.uid,
          'items': paymentItems,  // ✅ Now has size/color/qty
          'total': cart.totalPrice,
          'paymentMethod': payment.selectedMethod.toString().split('.').last,
          'status': 'paid',
          'createdAt': FieldValue.serverTimestamp(),
        });

        await cart.clearCart();
        if (mounted) _showSuccessDialog();
      } else {
        _showSnack('Payment failed. Try again.', Colors.red);
      }
    } catch (e) {
      print('💥 CartScreen ERROR: $e');
      _showSnack('Checkout error: $e', Colors.red);
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  void _showSnack(String msg, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(seconds: 4)),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
        content: const Text(
          'Payment Successful!\nYour order has been placed 👟',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final payment = context.watch<PaymentProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart (${cart.cartItems.length})'),  // ✅ Item count
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: cart.cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty 🛒',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cart.cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              // ✅ Image + Product Name
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      item.image,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => 
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: const Icon(Icons.image_not_supported, color: Colors.grey),
                                          ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '\$${item.price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // ✅ Size, Color, Quantity Row
                              Row(
                                children: [
                                  // Size
                                  Expanded(
                                    child: _buildDetailChip('Size', item.selectedSize ?? 'US 8', Icons.straighten),
                                  ),
                                  const SizedBox(width: 8),
                                  // Color
                                  Expanded(
                                    child: _buildDetailChip('Color', item.selectedColor ?? 'White', Icons.palette),
                                  ),
                                  const SizedBox(width: 8),
                                  // Quantity
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: item.quantity! > 1 
                                              ? () => context.read<CartProvider>().updateQuantity(item.id, (item.quantity ?? 1) - 1)
                                              : null,
                                          icon: const Icon(Icons.remove, size: 20, color: Colors.grey),
                                        ),
                                        Text(
                                          '${item.quantity ?? 1}',
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        IconButton(
                                          onPressed: () => context.read<CartProvider>().updateQuantity(item.id, (item.quantity ?? 1) + 1),
                                          icon: const Icon(Icons.add, size: 20, color: Colors.pink),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // ✅ Subtotal & Delete
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal: \$${((item.price * (item.quantity ?? 1)).toStringAsFixed(2))}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.red, size: 24),
                                    onPressed: () => cart.removeFromCart(item),
                                    tooltip: 'Remove item',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ✅ Payment Method Selector
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: const Border(top: BorderSide(color: Colors.grey)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.payment, color: Colors.pink),
                          const SizedBox(width: 12),
                          const Text(
                            'Payment Method:',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<PaymentMethod>(
                        value: payment.selectedMethod,
                        decoration: InputDecoration(
                          labelText: 'Select Payment Method',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          prefixIcon: Icon(Icons.credit_card, color: Colors.pink),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: PaymentMethod.values.map((method) {
                          return DropdownMenuItem<PaymentMethod>(
                            value: method,
                            child: Row(
                              children: [
                                Icon(_getPaymentIcon(method), color: Colors.pink),
                                const SizedBox(width: 12),
                                Text(
                                  method.toString().split('.').last.toUpperCase(),
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: payment.isProcessing 
                            ? null 
                            : (PaymentMethod? value) {
                                if (value != null) {
                                  payment.setMethod(value);
                                }
                              },
                      ),
                    ],
                  ),
                ),

                // ✅ Checkout Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${cart.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _isProcessing ? null : _handleCheckout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[600],
                            foregroundColor: Colors.white,
                            elevation: 8,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: _isProcessing
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text('Processing...', style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              : const Text(
                                  'PAY AND CHECKOUT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // ✅ Detail Chip Widget
  Widget _buildDetailChip(String label, String? value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(
            '$label: ${value ?? 'N/A'}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

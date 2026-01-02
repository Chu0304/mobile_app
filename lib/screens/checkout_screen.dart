// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Checkout")),
//       body: Column(
//         children: [
//           // 1. Order Summary
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 _buildPaymentOption(context, "Credit Card", Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay", Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//               ],
//             ),
//           ),

//           // 2. Bottom Total & Pay Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Amount:", style: TextStyle(fontSize: 16)),
//                     Text("\$${cart.totalAmount.toStringAsFixed(2)}", 
//                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                     onPressed: payment.isProcessing ? null : () async {
//                       bool success = await payment.processPayment(cart.totalAmount);
//                       if (success) {
//                         cart.clearCart(); // Clear cart on success
//                         _showSuccessDialog(context);
//                       }
//                     },
//                     child: payment.isProcessing 
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("Confirm Payment", style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.read<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return ListTile(
//       leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//       title: Text(title),
//       trailing: Radio<PaymentMethod>(
//         value: method,
//         groupValue: provider.selectedMethod,
//         activeColor: Colors.pink,
//         onChanged: (val) => provider.setMethod(val!),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
//         content: const Text("Payment Successful! Your shoes are on the way. 👟", textAlign: TextAlign.center),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // Close dialog
//               Navigator.pop(context); // Go back to Home
//             },
//             child: const Text("Back to Shop"),
//           )
//         ],
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // ✅ Added for order saving
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // 1. Payment Method Selection
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text("Select Payment Method", 
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 15),
//                 _buildPaymentOption(context, "Credit Card (Stripe)", Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay", Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//                 const Divider(height: 40),
//                 const Text("Order Summary", 
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 Text("Items in cart: ${cart.cartItems.length}", style: const TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),

//           // 2. Bottom Summary & Payment Trigger
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", style: TextStyle(fontSize: 16)),
//                     Text("\$${cart.totalPrice.toStringAsFixed(2)}", 
//                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: payment.isProcessing ? null : () async {
//                       // 🚀 1. Trigger Stripe Payment Sheet
//                       bool success = await payment.makePayment(cart.totalPrice, context);
                      
//                       if (success) {
//                         // 🚀 2. If successful, save order to Firebase
//                         await _saveOrderToFirebase(cart);
                        
//                         // 🚀 3. Clear cart and show success
//                         cart.clearCart();
//                         if (context.mounted) _showSuccessDialog(context);
//                       }
//                     },
//                     child: payment.isProcessing 
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("CONFIRM AND PAY NOW", 
//                           style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Helper to save order details to Firestore after payment
//   Future<void> _saveOrderToFirebase(CartProvider cart) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'items': cart.cartItems.map((item) => {
//           'name': item.name,
//           'price': item.price,
//         }).toList(),
//         'total': cart.totalPrice,
//         'status': 'paid',
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       debugPrint("Firebase Save Error: $e");
//     }
//   }

//   Widget _buildPaymentOption(BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.watch<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return Card(
//       elevation: isSelected ? 2 : 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//         title: Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
//         trailing: Radio<PaymentMethod>(
//           value: method,
//           groupValue: provider.selectedMethod,
//           activeColor: Colors.pink,
//           onChanged: (val) => provider.setMethod(val!),
//         ),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           "Payment Successful!\nYour order has been placed. 👟", 
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//               onPressed: () {
//                 Navigator.pop(context); // Close dialog
//                 Navigator.of(context).popUntil((route) => route.isFirst); // Back to Home
//               },
//               child: const Text("Continue Shopping", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     final cartItems = cart.items
//         .map((p) => {
//               'id': p.id,
//               'name': p.name,
//               'price': p.price,
//               'image': p.image,
//             })
//         .toList();

//     final total = cart.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // 1️⃣ Cart Summary & Payment Method
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text(
//                   "Order Summary",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 ...cart.items.map((product) => ListTile(
//                       leading: Image.network(product.image, width: 50),
//                       title: Text(product.name),
//                       trailing:
//                           Text('\$${product.price.toStringAsFixed(2)}'),
//                     )),
//                 const Divider(height: 30),
//                 const Text(
//                   "Select Payment Method",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 _buildPaymentOption(context, "Credit Card (Stripe)",
//                     Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay",
//                     Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(
//                     context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//               ],
//             ),
//           ),

//           // 2️⃣ Bottom Payment Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", style: TextStyle(fontSize: 16)),
//                     Text("\$${total.toStringAsFixed(2)}",
//                         style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: payment.isProcessing
//                         ? null
//                         : () async {
//                             bool success = await payment.makePayment(
//                                 total, cartItems);

//                             if (success) {
//                               await _saveOrderToFirebase(cart);
//                               cart.clearCart();
//                               if (context.mounted) {
//                                 _showSuccessDialog(context);
//                               }
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Payment Failed')),
//                               );
//                             }
//                           },
//                     child: payment.isProcessing
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("CONFIRM AND PAY NOW",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Helper to save order details to Firestore after payment
//   Future<void> _saveOrderToFirebase(CartProvider cart) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'items': cart.items
//             .map((item) => {
//                   'id': item.id,
//                   'name': item.name,
//                   'price': item.price,
//                   'image': item.image,
//                 })
//             .toList(),
//         'total': cart.totalPrice,
//         'status': 'paid',
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       debugPrint("Firebase Save Error: $e");
//     }
//   }

//   Widget _buildPaymentOption(
//       BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.watch<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return Card(
//       elevation: isSelected ? 2 : 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//         title: Text(title,
//             style:
//                 TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
//         trailing: Radio<PaymentMethod>(
//           value: method,
//           groupValue: provider.selectedMethod,
//           activeColor: Colors.pink,
//           onChanged: (val) => provider.setMethod(val!),
//         ),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           "Payment Successful!\nYour order has been placed. 👟",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//               onPressed: () {
//                 Navigator.pop(context); // Close dialog
//                 Navigator.of(context).popUntil((route) => route.isFirst); // Home
//               },
//               child: const Text("Continue Shopping",
//                   style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }











// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     final total = cart.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // 1️⃣ Cart Summary & Payment Method
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text(
//                   "Order Summary",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 ...cart.items.map((product) => ListTile(
//                       leading: Image.network(product.image, width: 50),
//                       title: Text(product.name),
//                       trailing: Text('\$${product.price.toStringAsFixed(2)}'),
//                     )),
//                 const Divider(height: 30),
//                 const Text(
//                   "Select Payment Method",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 _buildPaymentOption(context, "Credit Card (Stripe)",
//                     Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay",
//                     Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(
//                     context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//               ],
//             ),
//           ),

//           // 2️⃣ Bottom Payment Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", style: TextStyle(fontSize: 16)),
//                     Text("\$${total.toStringAsFixed(2)}",
//                         style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: payment.isProcessing
//                         ? null
//                         : () async {
//                             // ✅ Correct: Pass context, not cartItems
//                             bool success =
//                                 await payment.makePayment(total, context as List<Map<String, dynamic>>);

//                             if (success) {
//                               await _saveOrderToFirebase(cart);
//                               cart.clearCart();
//                               if (context.mounted) {
//                                 _showSuccessDialog(context);
//                               }
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Payment Failed')),
//                               );
//                             }
//                           },
//                     child: payment.isProcessing
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("CONFIRM AND PAY NOW",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   // Save order to Firestore after successful payment
//   Future<void> _saveOrderToFirebase(CartProvider cart) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'userId': FirebaseAuth.instance.currentUser?.uid,
//         'items': cart.items
//             .map((item) => {
//                   'id': item.id,
//                   'name': item.name,
//                   'price': item.price,
//                   'image': item.image,
//                 })
//             .toList(),
//         'total': cart.totalPrice,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       debugPrint("Firebase Save Error: $e");
//     }
//   }

//   Widget _buildPaymentOption(
//       BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.watch<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return Card(
//       elevation: isSelected ? 2 : 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//         title: Text(title,
//             style:
//                 TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
//         trailing: Radio<PaymentMethod>(
//           value: method,
//           groupValue: provider.selectedMethod as PaymentMethod?,
//           activeColor: Colors.pink,
//           onChanged: (val) => provider.setMethod(val!),
//         ),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           "Payment Successful!\nYour order has been placed. 👟",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//               onPressed: () {
//                 Navigator.pop(context); // Close dialog
//                 Navigator.of(context).popUntil((route) => route.isFirst); // Back home
//               },
//               child: const Text("Continue Shopping",
//                   style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     final total = cart.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text(
//                   "Order Summary",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 ...cart.items.map((product) => ListTile(
//                       leading: Image.network(product.image, width: 50),
//                       title: Text(product.name),
//                       trailing: Text('\$${product.price.toStringAsFixed(2)}'),
//                     )),
//                 const Divider(height: 30),
//                 const Text(
//                   "Select Payment Method",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 _buildPaymentOption(context, "Credit Card (Stripe)",
//                     Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay",
//                     Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(
//                     context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", style: TextStyle(fontSize: 16)),
//                     Text("\$${total.toStringAsFixed(2)}",
//                         style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: payment.isProcessing
//                         ? null
//                         : () async {
//                             // Prepare cart items as Map
//                             final cartItems = cart.items
//                                 .map((item) => {
//                                       'id': item.id,
//                                       'name': item.name,
//                                       'price': item.price,
//                                       'image': item.image,
//                                     })
//                                 .toList();

//                             bool success =
//                                 await payment.makePayment(total, cartItems);

//                             if (success) {
//                               await _saveOrderToFirebase(cart);
//                               cart.clearCart();
//                               if (context.mounted) {
//                                 _showSuccessDialog(context);
//                               }
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Payment Failed')),
//                               );
//                             }
//                           },
//                     child: payment.isProcessing
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("CONFIRM AND PAY NOW",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _saveOrderToFirebase(CartProvider cart) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'userId': FirebaseAuth.instance.currentUser?.uid,
//         'items': cart.items
//             .map((item) => {
//                   'id': item.id,
//                   'name': item.name,
//                   'price': item.price,
//                   'image': item.image,
//                 })
//             .toList(),
//         'total': cart.totalPrice,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       debugPrint("Firebase Save Error: $e");
//     }
//   }

//   Widget _buildPaymentOption(
//       BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.watch<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return Card(
//       elevation: isSelected ? 2 : 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//         title: Text(title,
//             style:
//                 TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
//         trailing: Radio<PaymentMethod>(
//           value: method,
//           groupValue: provider.selectedMethod, // ✅ No casting needed
//           activeColor: Colors.pink,
//           onChanged: (val) {
//             if (val != null) provider.setMethod(val); // ✅ Safe null check
//           },
//         ),
//       ),
//     );
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           "Payment Successful!\nYour order has been placed. 👟",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               child: const Text("Continue Shopping",
//                   style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// enum PaymentMethod {
//   card,
//   googlePay,
//   cash,
// }



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();
//     final total = cart.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 const Text(
//                   "Order Summary",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 ...cart.items.map((product) => ListTile(
//                       leading: Image.network(product.image, width: 50),
//                       title: Text(product.name),
//                       trailing: Text('\$${product.price.toStringAsFixed(2)}'),
//                     )),
//                 const Divider(height: 30),
//                 const Text(
//                   "Select Payment Method",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 _buildPaymentOption(context, "Credit Card (Stripe)", Icons.credit_card, PaymentMethod.card),
//                 _buildPaymentOption(context, "Google Pay", Icons.account_balance_wallet, PaymentMethod.googlePay),
//                 _buildPaymentOption(context, "Cash on Delivery", Icons.money, PaymentMethod.cash),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", style: TextStyle(fontSize: 16)),
//                     Text("\$${total.toStringAsFixed(2)}",
//                         style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: payment.isProcessing
//                         ? null
//                         : () async {
//                             final cartItems = cart.items
//                                 .map((item) => {
//                                       'id': item.id,
//                                       'name': item.name,
//                                       'price': item.price,
//                                       'image': item.image,
//                                     })
//                                 .toList();

//                             bool success = await payment.makePayment(total, cartItems);

//                             if (success) {
//                               await _saveOrderToFirebase(cart, payment.selectedMethod);
//                               cart.clearCart();
//                               if (context.mounted) _showSuccessDialog(context);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Payment Failed')),
//                               );
//                             }
//                           },
//                     child: payment.isProcessing
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("CONFIRM AND PAY NOW",
//                             style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(
//       BuildContext context, String title, IconData icon, PaymentMethod method) {
//     final provider = context.watch<PaymentProvider>();
//     bool isSelected = provider.selectedMethod == method;

//     return Card(
//       elevation: isSelected ? 2 : 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//         side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
//         title: Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
//         trailing: Radio<PaymentMethod>(
//           value: method,
//           groupValue: provider.selectedMethod,
//           activeColor: Colors.pink,
//           onChanged: (val) {
//             if (val != null) provider.setMethod(val); // ✅ Safe
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> _saveOrderToFirebase(CartProvider cart, PaymentMethod method) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'userId': FirebaseAuth.instance.currentUser?.uid,
//         'items': cart.items
//             .map((item) => {
//                   'id': item.id,
//                   'name': item.name,
//                   'price': item.price,
//                   'image': item.image,
//                 })
//             .toList(),
//         'total': cart.totalPrice,
//         'paymentMethod': method.toString().split('.').last,
//         'status': 'paid',
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       debugPrint("Firebase Save Error: $e");
//     }
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           "Payment Successful!\nYour order has been placed. 👟",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//               },
//               child: const Text("Continue Shopping", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }






























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:flutter_stripe/flutter_stripe.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';
// import 'package:flutter_stripe/flutter_stripe.dart' hide Card;


// enum PaymentMethod { card, googlePay, cash, paypal }

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   PaymentMethod? _selectedMethod;
//   bool _isProcessing = false;

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final total = cart.totalPrice;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // Order Items
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 // Order Summary
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('Order Summary', 
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 16),
//                         ...cart.items.map((item) => ListTile(
//                           leading: Image.network(item.image, 
//                             width: 50, height: 50, fit: BoxFit.cover),
//                           title: Text(item.name, 
//                             style: const TextStyle(fontWeight: FontWeight.w500)),
//                           subtitle: Text('x1'),  // or remove subtitle completely
                          

//                           // trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}',
//                           trailing: Text('\$${item.price.toStringAsFixed(2)}',
//                             style: const TextStyle(fontWeight: FontWeight.bold)),
//                         )),
//                         const Divider(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text('Total', 
//                               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                             Text('\$${total.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 24, 
//                                 fontWeight: FontWeight.w800, 
//                                 color: Colors.pink)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // Payment Methods
//                 const Text('Choose Payment Method', 
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),

//                 // 1. CARD PAYMENT
//                 _buildPaymentOption(
//                   'Credit/Debit Card', 
//                   Icons.credit_card, 
//                   Colors.blue, 
//                   'Visa, MasterCard, Amex',
//                   PaymentMethod.card
//                 ),
//                 const SizedBox(height: 12),

//                 // 2. GOOGLE PAY
//                 _buildPaymentOption(
//                   'Google Pay', 
//                   Icons.payment, 
//                   Colors.green, 
//                   'Fast & Secure', 
//                   PaymentMethod.googlePay
//                 ),
//                 const SizedBox(height: 12),

//                 // 3. CASH ON DELIVERY
//                 _buildPaymentOption(
//                   'Cash on Delivery', 
//                   Icons.money_off, 
//                   Colors.orange, 
//                   'Pay when delivered',
//                   PaymentMethod.cash
//                 ),
//                 const SizedBox(height: 12),

//                 // 4. PAYPAL
//                 _buildPaymentOption(
//                   'PayPal', 
//                   Icons.account_balance_wallet, 
//                   Colors.purple, 
//                   'Secure online payment',
//                   PaymentMethod.paypal
//                 ),
//               ],
//             ),
//           ),

//           // Bottom Payment Button
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -2))
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Total Payable:", 
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     Text("\$${total.toStringAsFixed(2)}",
//                       style: const TextStyle(
//                         fontSize: 24, 
//                         fontWeight: FontWeight.bold, 
//                         color: Colors.pink)),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 60,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       foregroundColor: Colors.white,
//                       elevation: 0,
//                       shadowColor: Colors.pink.withOpacity(0.4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     onPressed: _isProcessing || _selectedMethod == null 
//                         ? null 
//                         : () => _processPayment(context, cart, total),
//                     child: _isProcessing
//                         ? const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2,
//                                 ),
//                               ),
//                               SizedBox(width: 12),
//                               Text('Processing...', style: TextStyle(fontSize: 16)),
//                             ],
//                           )
//                         : const Text(
//                             "CONFIRM & PAY NOW",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(String title, IconData icon, Color color, 
//     String subtitle, PaymentMethod method) {
//     final isSelected = _selectedMethod == method;

//     return GestureDetector(
//       onTap: () => setState(() => _selectedMethod = method),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink.withOpacity(0.08) : Colors.grey[50],
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: isSelected ? Colors.pink : Colors.grey.shade300,
//             width: isSelected ? 2 : 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(14),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, color: color, size: 28),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title, 
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
//                       color: isSelected ? Colors.pink : Colors.black87,
//                     )),
//                   Text(subtitle, 
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 14,
//                     )),
//                 ],
//               ),
//             ),
//             Radio(
//               value: method,
//               groupValue: _selectedMethod,
//               activeColor: Colors.pink,
//               onChanged: (value) => setState(() => _selectedMethod = method),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _processPayment(BuildContext context, CartProvider cart, double total) async {
//     setState(() => _isProcessing = true);

//     try {
//       switch (_selectedMethod) {
//         case PaymentMethod.card:
//           await _processCardPayment(context, total);
//           break;
//         case PaymentMethod.googlePay:
//           await _processGooglePay(context);
//           break;
//         case PaymentMethod.cash:
//           await _processCashPayment(context);
//           break;
//         case PaymentMethod.paypal:
//           await _processPaypal(context);
//           break;
//         default:
//           throw Exception('No payment method selected');
//       }

//       // Save to Firebase & Clear Cart
//       await _saveOrderToFirebase(cart);
//       cart.clearCart();
      
//       if (context.mounted) {
//         _showSuccessDialog(context);
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment failed: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   Future<void> _processCardPayment(BuildContext context, double amount) async {
//     // Stripe Payment Sheet
//     final paymentIntentData = await _createPaymentIntent(amount);
    
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntentData['client_secret'],
//         merchantDisplayName: 'Shoe Shop',
//         // googlePay: const PaymentSheetGooglePay(enabled: true, testEnv: true),
//       //),
//       googlePay: const PaymentSheetGooglePay(
//       merchantCountryCode: 'US',  // ✅ REQUIRED
//       testEnv: true,              // ✅ OK
//     ),)
//     );
    
//     await Stripe.instance.presentPaymentSheet();
//   }

//   Future<void> _processGooglePay(BuildContext context) async {
//     // Simulate Google Pay
//     await Future.delayed(const Duration(seconds: 2));
//   }

//   Future<void> _processCashPayment(BuildContext context) async {
//     // Cash on Delivery - Instant success
//     await Future.delayed(const Duration(milliseconds: 1500));
//   }

//   Future<void> _processPaypal(BuildContext context) async {
//     // Simulate PayPal redirect
//     await Future.delayed(const Duration(seconds: 3));
//   }

//   Future<Map<String, dynamic>> _createPaymentIntent(double amount) async {
//     // Backend call (replace with your endpoint)
//     return {
//       'client_secret': 'pi_test_secret_123',  // Mock for demo
//       'ephemeralKey': 'ek_test_key_123',
//       'customer': 'cus_test_123',
//     };
//   }

//   Future<void> _saveOrderToFirebase(CartProvider cart) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     await FirebaseFirestore.instance.collection('orders').add({
//       'userId': user.uid,
//       'items': cart.items.map((item) => {
//         'id': item.id,
//         'name': item.name,
//         'price': item.price,
//         // 'quantity': item.quantity,
//         'quantity': 1,  // Default quantity
//         'image': item.image,
//       }).toList(),
//       'total': cart.totalPrice,
//       'paymentMethod': _selectedMethod.toString().split('.').last,
//       'status': 'paid',
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   void _showSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.check_circle, color: Colors.green, size: 80),
//             const SizedBox(height: 20),
//             const Text(
//               "🎉 Payment Successful!",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Your order has been placed successfully!\nTrack it from Profile.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.of(context).popUntil((route) => route.isFirst);
//             },
//             child: const Text("Continue Shopping", 
//               style: TextStyle(color: Colors.white, fontSize: 16)),
//           ),
//         ],
//       ),
//     );
//   }
// }












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

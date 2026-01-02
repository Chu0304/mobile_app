// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Shopping Cart')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cart.items.length,
//               itemBuilder: (_, i) => ListTile(
//                 title: Text(cart.items[i].name),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => cart.remove(cart.items[i]),
//                 ),
//               ),
//             ),
//           ),
//           Text('Total: \$${cart.total.toStringAsFixed(2)}'),
//           ElevatedButton(
//             onPressed: () {},
//             child: const Text('Checkout'),
//           ),
//         ],
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shopping Cart'),
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : Column(
//               children: [
//                 /// 🛒 Cart items
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];

//                       return ListTile(
//                         leading: Image.network(
//                           item.image,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(item.name),
//                         subtitle: Text(
//                           '\$${item.price.toStringAsFixed(2)}',
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             cart.removeFromCart(item);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 /// 💰 Total + Checkout
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Total:',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // TODO: checkout logic
//                           },
//                           child: const Text('Checkout'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   /// ✅ Checkout function
//   Future<void> _checkout(BuildContext context) async {
//     final cart = context.read<CartProvider>();

//     // 1️⃣ Validate cart
//     if (cart.cartItems.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Your cart is empty!')),
//       );
//       return;
//     }

//     try {
//       // 2️⃣ Process payment (TODO: Integrate payment gateway)
//       // Example: Stripe, PayPal, Razorpay, etc.

//       // 3️⃣ Create order record in Firestore
//       final orderRef = FirebaseFirestore.instance.collection('orders').doc();
//       await orderRef.set({
//         'items': cart.cartItems.map((item) => {
//               'id': item.id,
//               'name': item.name,
//               'price': item.price,
//               'image': item.image,
//             }).toList(),
//         'total': cart.totalPrice,
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       // 4️⃣ Clear the cart
//       cart.clearCart();

//       // 5️⃣ Show confirmation
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Checkout successful!')),
//       );

//        /// Optional: Navigate to order summary page
//       // Navigator.push(context, MaterialPageRoute(builder: (_) => OrderSummaryScreen(orderId: orderRef.id)));

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Checkout failed: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Shopping Cart')),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : Column(
//               children: [
//                 /// 🛒 Cart items
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return ListTile(
//                         leading: Image.network(
//                           item.image,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(item.name),
//                         subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => cart.removeFromCart(item),
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 /// 💰 Total + Checkout
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Total:',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () => _checkout(context),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text(
//                             'Checkout',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isLoading = false;

//   /// ✅ Checkout function
//   Future<void> _checkout() async {
//     final cart = context.read<CartProvider>();

//     // 1️⃣ Validate cart
//     if (cart.cartItems.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Your cart is empty!')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       // 2️⃣ Process payment (placeholder)
//       // TODO: Integrate payment gateway like Stripe, PayPal, Razorpay

//       // 3️⃣ Create a new order document in Firestore
//       final orderRef = FirebaseFirestore.instance.collection('orders').doc(); // auto-ID
//       await orderRef.set({
//         'items': cart.cartItems.map((item) => {
//               'id': item.id,
//               'name': item.name,
//               'price': item.price,
//               'image': item.image,
//             }).toList(),
//         'total': cart.totalPrice,
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       // 4️⃣ Clear the cart
//       cart.clearCart();

//       // 5️⃣ Show confirmation
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Checkout successful!')),
//       );

//       // Optional: Navigate to order summary page
//       // Navigator.push(context, MaterialPageRoute(builder: (_) => OrderSummaryScreen(orderId: orderRef.id)));

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Checkout failed: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Shopping Cart')),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : Column(
//               children: [
//                 /// 🛒 Cart items
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return ListTile(
//                         leading: Image.network(
//                           item.image,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(item.name),
//                         subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => cart.removeFromCart(item),
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 /// 💰 Total + Checkout
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Total:',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _checkout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: _isLoading
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : const Text(
//                                   'Checkout',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isLoading = false;

//   /// ✅ Checkout logic
//   Future<void> _checkout() async {
//     final cart = context.read<CartProvider>();

//     if (cart.cartItems.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Your cart is empty!')),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       // Create order in Firestore
//       final orderRef = FirebaseFirestore.instance.collection('orders').doc();
      
//       await orderRef.set({
//         'items': cart.cartItems.map((item) => {
//               'id': item.id,
//               'name': item.name,
//               'price': item.price,
//               'image': item.image,
//             }).toList(),
//         'total': cart.totalPrice,
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       // Clear local cart state
//       cart.clearCart();

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Order placed successfully! 👟'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Checkout failed: $e')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty 🛒',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(
//                             item.image,
//                             width: 60,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 const Icon(Icons.broken_image),
//                           ),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 10,
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _checkout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isLoading
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text('PROCEED TO CHECKOUT', style: TextStyle(fontSize: 16, color: Colors.white)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart'; // ✅ Import your Payment Provider

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isLoading = false;

//   /// ✅ Integrated Stripe + Firebase Checkout logic
//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();

//     if (cart.cartItems.isEmpty) {
//       _showMsg('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       // 1️⃣ Step 1: Trigger Stripe Payment
//       // Note: adjust 'totalPrice' or 'totalAmount' based on your CartProvider getter name
//       bool paymentSuccessful = await payment.makePayment(cart.totalPrice, context);

//       // 2️⃣ Step 2: Only if payment succeeded, save to Firebase
//       if (paymentSuccessful) {
//         final orderRef = FirebaseFirestore.instance.collection('orders').doc();
        
//         await orderRef.set({
//           'items': cart.cartItems.map((item) => {
//                 'id': item.id,
//                 'name': item.name,
//                 'price': item.price,
//                 'image': item.image,
//               }).toList(),
//           'total': cart.totalPrice,
//           'status': 'paid', // Mark as paid
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         // 3️⃣ Step 3: Clear local cart
//         cart.clearCart();
        
//         _showMsg('Order placed successfully! 👟', Colors.green);
//       }
//     } catch (e) {
//       _showMsg('Checkout failed: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   void _showMsg(String text, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(text), backgroundColor: color),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(child: Text('Your cart is empty 🛒', style: TextStyle(fontSize: 18, color: Colors.grey)))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 60, fit: BoxFit.cover),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Bottom Summary Section
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isLoading
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text('PAY AND CHECKOUT', 
//                                   style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // ✅ Added for userId
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isLoading = false;

//   /// ✅ Integrated Stripe + Firebase Checkout logic
//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser; // ✅ Get the current user

//     // 1. Basic Validation
//     if (user == null) {
//       _showMsg('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showMsg('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       // 2. Trigger Stripe Payment
//       bool paymentSuccessful = await payment.makePayment(cart.totalPrice, context);

//       // 3. Save to Firebase only if payment succeeded
//       if (paymentSuccessful) {
//         // We use .add() to let Firebase generate a unique Order ID automatically
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid, // 👈 REQUIRED: This connects the order to the user
//           'items': cart.cartItems.map((item) => {
//                 'id': item.id,
//                 'name': item.name,
//                 'price': item.price,
//                 'image': item.image,
//               }).toList(),
//           'total': cart.totalPrice,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(), // ✅ For sorting on Orders Screen
//         });

//         // 4. Clear local and Firestore cart
//         await cart.clearCart();
        
//         _showMsg('Order placed successfully! 👟', Colors.green);
//       }
//     } catch (e) {
//       _showMsg('Checkout failed: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   void _showMsg(String text, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(text), backgroundColor: color),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text('Your cart is empty 🛒', 
//               style: TextStyle(fontSize: 18, color: Colors.grey)))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 60, fit: BoxFit.cover),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // Bottom Summary Section
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isLoading
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text('PAY AND CHECKOUT', 
//                                   style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isLoading = false;

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showMsg('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showMsg('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       // 1. Trigger Stripe Payment
//       bool paymentSuccessful = await payment.makePayment(cart.totalPrice, context);

//       // 2. Save to Firebase only if payment succeeded
//       if (paymentSuccessful) {
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid, // Required for filtering on Orders Screen
//           'items': cart.cartItems.map((item) => {
//                 'id': item.id,
//                 'name': item.name,
//                 'price': item.price,
//                 'image': item.image,
//               }).toList(),
//           'total': cart.totalPrice,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(), // Required for sorting
//         });

//         // 3. Clear cart locally and in Firestore
//         await cart.clearCart();
        
//         if (mounted) _showMsg('Order placed successfully! 👟', Colors.green);
//       }
//     } catch (e) {
//       _showMsg('Checkout failed: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isLoading = false);
//     }
//   }

//   void _showMsg(String text, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(text), backgroundColor: color),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text('Your cart is empty 🛒', 
//               style: TextStyle(fontSize: 18, color: Colors.grey)))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 60, height: 60, fit: BoxFit.cover),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isLoading
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text('PAY AND CHECKOUT', 
//                                   style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isProcessing = false;

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showSnack('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showSnack('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       // 1️⃣ Trigger Stripe Payment
//       bool success = await payment.makePayment(cart.totalPrice, context as List<Map<String, dynamic>>);

//       if (success) {
//         // 2️⃣ Save order to Firestore
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid,
//           'items': cart.cartItems.map((item) => {
//                 'id': item.id,
//                 'name': item.name,
//                 'price': item.price,
//                 'image': item.image,
//               }).toList(),
//           'total': cart.totalPrice,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         // 3️⃣ Clear cart locally & Firestore
//         await cart.clearCart();

//         // 4️⃣ Show success dialog
//         if (mounted) _showSuccessDialog();
//       } else {
//         _showSnack('Payment failed. Try again.', Colors.red);
//       }
//     } catch (e) {
//       _showSnack('Checkout error: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   void _showSnack(String msg, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(msg), backgroundColor: color),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           'Payment Successful!\nYour order has been placed 👟',
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
//               child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty 🛒',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 60, height: 60, fit: BoxFit.cover),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isProcessing ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isProcessing
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text(
//                                   'PAY AND CHECKOUT',
//                                   style: TextStyle(
//                                       fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isProcessing = false;

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showSnack('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showSnack('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       // Build payment items from cart items
//       final paymentItems = cart.cartItems.map((item) => {
//             'id': item.id,
//             'name': item.name,
//             // amount in smallest currency unit (e.g. cents) - adjust depending on your payment provider
//             'amount': (item.price * 100).toInt(),
//             'currency': 'usd',
//             'quantity': 1,
//           }).toList();

//       bool success = await payment.makePayment(cart.totalPrice, paymentItems);
 
//       if (success) {
//         // Save order to Firestore
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid,
//           'items': cart.cartItems.map((item) => {
//                 'id': item.id,
//                 'name': item.name,
//                 'price': item.price,
//                 'image': item.image,
//               }).toList(),
//           'total': cart.totalPrice,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         // Clear cart locally
//         await cart.clearCart();

//         // Show success dialog
//         if (mounted) _showSuccessDialog();
//       } else {
//         _showSnack('Payment failed. Try again.', Colors.red);
//       }
//     } catch (e) {
//       _showSnack('Checkout error: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   void _showSnack(String msg, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(msg), backgroundColor: color),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           'Payment Successful!\nYour order has been placed 👟',
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
//               child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty 🛒',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 60, height: 60, fit: BoxFit.cover),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text('\$${cart.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: _isProcessing ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                           child: _isProcessing
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text(
//                                   'PAY AND CHECKOUT',
//                                   style: TextStyle(
//                                     fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isProcessing = false;

//   IconData _getPaymentIcon(dynamic method) {
//     if (method.toString().contains('card')) return Icons.payment;
//     if (method.toString().contains('paypal')) return Icons.account_balance_wallet;
//     if (method.toString().contains('googlePay')) return Icons.payment;
//     if (method.toString().contains('cash')) return Icons.money;
//     return Icons.payment;
//   }

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showSnack('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showSnack('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       // ✅ FIXED: Convert Product → Pure Maps for Firestore
//       final paymentItems = cart.cartItems.map((item) {
//         return <String, dynamic>{
//           'id': item.id.toString(),
//           'name': item.name,
//           'price': item.price.toDouble(),
//           'image': item.image,
//           'quantity': 1,
//         };
//       }).toList();

//       print('🔍 CartScreen: Sending ${paymentItems.length} pure Maps');

//       bool success = await payment.makePayment(cart.totalPrice, paymentItems);

//       if (success) {
//         // ✅ Save order with pure Maps
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid,
//           'items': paymentItems,
//           'total': cart.totalPrice,
//           'paymentMethod': payment.selectedMethod.toString().split('.').last,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         await cart.clearCart();
//         if (mounted) _showSuccessDialog();
//       } else {
//         _showSnack('Payment failed. Try again.', Colors.red);
//       }
//     } catch (e) {
//       print('💥 CartScreen ERROR: $e');
//       _showSnack('Checkout error: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   void _showSnack(String msg, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(seconds: 4)),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           'Payment Successful!\nYour order has been placed 👟',
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
//               child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty 🛒',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(12),
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               item.image,
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) => 
//                                   Container(width: 60, height: 60, color: Colors.grey[300]),
//                             ),
//                           ),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // ✅ PAYMENT METHOD SELECTOR
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: const BoxDecoration(
//                     color: Colors.grey50,
//                     border: Border(top: BorderSide(color: Colors.grey)),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.payment, color: Colors.pink),
//                           const SizedBox(width: 12),
//                           const Text('Payment Method:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       DropdownButtonFormField(
//                         value: payment.selectedMethod,
//                         decoration: const InputDecoration(
//                           labelText: 'Choose Payment',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.credit_card, color: Colors.pink),
//                         ),
//                         items: payment.selectedMethod.toString().split('.').map((method) {
//                           return DropdownMenuItem(
//                             value: payment.selectedMethod,
//                             child: Row(
//                               children: [
//                                 Icon(_getPaymentIcon(payment.selectedMethod), color: Colors.pink),
//                                 const SizedBox(width: 12),
//                                 Text(method.split('.').last.toUpperCase()),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: payment.isProcessing ? null : (value) {
//                           // Update payment method
//                           payment.setMethod(value as dynamic);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // ✅ CHECKOUT SECTION
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55,
//                         child: ElevatedButton(
//                           onPressed: _isProcessing ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             foregroundColor: Colors.white,
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: _isProcessing
//                               ? const Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                                     ),
//                                     SizedBox(width: 12),
//                                     Text('Processing...', style: TextStyle(color: Colors.white)),
//                                   ],
//                                 )
//                               : const Text(
//                                   'PAY AND CHECKOUT',
//                                   style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }


















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isProcessing = false;

//   // ✅ FIXED Payment Icons Helper
//   IconData _getPaymentIcon(dynamic method) {
//     switch (method.toString().split('.').last) {
//       case 'card':
//         return Icons.credit_card;
//       case 'paypal':
//         return Icons.account_balance_wallet;
//       case 'googlePay':
//         return Icons.payment;
//       case 'cash':
//         return Icons.money_off;
//       default:
//         return Icons.payment;
//     }
//   }

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showSnack('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showSnack('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       // ✅ FIXED: Convert Product → Pure Maps for Firestore
//       final paymentItems = cart.cartItems.map((item) {
//         return <String, dynamic>{
//           'id': item.id.toString(),
//           'name': item.name,
//           'price': item.price.toDouble(),
//           'image': item.image,
//           'quantity': 1,
//         };
//       }).toList();

//       print('🔍 CartScreen: Sending ${paymentItems.length} pure Maps');

//       bool success = await payment.makePayment(cart.totalPrice, paymentItems);

//       if (success) {
//         // ✅ Save order with pure Maps
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid,
//           'items': paymentItems,
//           'total': cart.totalPrice,
//           'paymentMethod': payment.selectedMethod.toString().split('.').last,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         await cart.clearCart();
//         if (mounted) _showSuccessDialog();
//       } else {
//         _showSnack('Payment failed. Try again.', Colors.red);
//       }
//     } catch (e) {
//       print('💥 CartScreen ERROR: $e');
//       _showSnack('Checkout error: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   void _showSnack(String msg, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(seconds: 4)),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           'Payment Successful!\nYour order has been placed 👟',
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
//               child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty 🛒',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(12),
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               item.image,
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) => 
//                                   Container(width: 60, height: 60, color: Colors.grey[300]),
//                             ),
//                           ),
//                           title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // ✅ FIXED PAYMENT METHOD SELECTOR
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: const BoxDecoration(
//                     color: Colors.grey50,
//                     border: Border(top: BorderSide(color: Colors.grey)),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.payment, color: Colors.pink),
//                           const SizedBox(width: 12),
//                           const Text('Payment Method:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       // ✅ FIXED DROPDOWN - Now works perfectly!
//                       DropdownButtonFormField<PaymentMethod>(
//                         value: payment.selectedMethod,
//                         decoration: const InputDecoration(
//                           labelText: 'Choose Payment',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.credit_card, color: Colors.pink),
//                         ),
//                         items: PaymentMethod.values.map((method) {
//                           return DropdownMenuItem<PaymentMethod>(
//                             value: method,
//                             child: Row(
//                               children: [
//                                 Icon(_getPaymentIcon(method), color: Colors.pink),
//                                 const SizedBox(width: 12),
//                                 Text(method.toString().split('.').last.toUpperCase()),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: payment.isProcessing 
//                           ? null 
//                           : (PaymentMethod? value) {
//                               if (value != null) {
//                                 payment.setMethod(value);
//                               }
//                             },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // ✅ CHECKOUT SECTION
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Total:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55,
//                         child: ElevatedButton(
//                           onPressed: _isProcessing ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             foregroundColor: Colors.white,
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: _isProcessing
//                               ? const Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                                     ),
//                                     SizedBox(width: 12),
//                                     Text('Processing...', style: TextStyle(color: Colors.white)),
//                                   ],
//                                 )
//                               : const Text(
//                                   'PAY AND CHECKOUT',
//                                   style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../providers/cart_provider.dart';
// import '../providers/payment_provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   bool _isProcessing = false;

//   // ✅ PERFECT Payment Icons Helper
//   IconData _getPaymentIcon(dynamic method) {
//     switch (method.toString().split('.').last) {
//       case 'card':
//         return Icons.credit_card;
//       case 'paypal':
//         return Icons.account_balance_wallet;
//       case 'googlePay':
//         return Icons.payment;
//       case 'cash':
//         return Icons.money_off;
//       default:
//         return Icons.payment;
//     }
//   }

//   Future<void> _handleCheckout() async {
//     final cart = context.read<CartProvider>();
//     final payment = context.read<PaymentProvider>();
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       _showSnack('Please login to checkout', Colors.red);
//       return;
//     }

//     if (cart.cartItems.isEmpty) {
//       _showSnack('Your cart is empty!', Colors.orange);
//       return;
//     }

//     setState(() => _isProcessing = true);

//     try {
//       // ✅ FIXED: Pure Maps conversion
//       final paymentItems = cart.cartItems.map((item) {
//         return <String, dynamic>{
//           'id': item.id.toString(),
//           'name': item.name,
//           'price': item.price.toDouble(),
//           'image': item.image,
//           'quantity': 1,
//         };
//       }).toList();

//       print('🔍 CartScreen: Sending ${paymentItems.length} pure Maps');

//       bool success = await payment.makePayment(cart.totalPrice, paymentItems);

//       if (success) {
//         await FirebaseFirestore.instance.collection('orders').add({
//           'userId': user.uid,
//           'items': paymentItems,
//           'total': cart.totalPrice,
//           'paymentMethod': payment.selectedMethod.toString().split('.').last,
//           'status': 'paid',
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         await cart.clearCart();
//         if (mounted) _showSuccessDialog();
//       } else {
//         _showSnack('Payment failed. Try again.', Colors.red);
//       }
//     } catch (e) {
//       print('💥 CartScreen ERROR: $e');
//       _showSnack('Checkout error: $e', Colors.red);
//     } finally {
//       if (mounted) setState(() => _isProcessing = false);
//     }
//   }

//   void _showSnack(String msg, Color color) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(msg), backgroundColor: color, duration: const Duration(seconds: 4)),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Icon(Icons.check_circle, color: Colors.green, size: 80),
//         content: const Text(
//           'Payment Successful!\nYour order has been placed 👟',
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
//               child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();
//     final payment = context.watch<PaymentProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
//                   SizedBox(height: 16),
//                   Text(
//                     'Your cart is empty 🛒',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         elevation: 2,
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(12),
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               item.image,
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) => 
//                                   Container(
//                                     width: 60,
//                                     height: 60,
//                                     decoration: BoxDecoration(
//                                       color: Colors.grey[300],
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Icon(Icons.image_not_supported, color: Colors.grey),
//                                   ),
//                             ),
//                           ),
//                           title: Text(
//                             item.name,
//                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('\$${item.price.toStringAsFixed(2)}'),
//                               Text(
//                                 'Qty: 1',
//                                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                               ),
//                             ],
//                           ),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete_outline, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 // ✅ PERFECTED PAYMENT METHOD SELECTOR
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: const BoxDecoration(
//                     color: Colors.grey,
//                     border: Border(top: BorderSide(color: Colors.grey)),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.payment, color: Colors.pink),
//                           const SizedBox(width: 12),
//                           const Text(
//                             'Payment Method:',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       DropdownButtonFormField<PaymentMethod>(
//                         value: payment.selectedMethod,
//                         decoration: InputDecoration(
//                           labelText: 'Select Payment Method',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                           prefixIcon: Icon(Icons.credit_card, color: Colors.pink),
//                           filled: true,
//                           fillColor: Colors.white,
//                         ),
//                         items: PaymentMethod.values.map((method) {
//                           return DropdownMenuItem<PaymentMethod>(
//                             value: method,
//                             child: Row(
//                               children: [
//                                 Icon(_getPaymentIcon(method), color: Colors.pink),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   method.toString().split('.').last.toUpperCase(),
//                                   style: const TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: payment.isProcessing 
//                           ? null 
//                           : (PaymentMethod? value) {
//                               if (value != null) {
//                                 payment.setMethod(value);
//                               }
//                             },
//                       ),
//                     ],
//                   ),
//                 ),
//                 // ✅ CHECKOUT SECTION
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Total:',
//                             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.pink,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55,
//                         child: ElevatedButton(
//                           onPressed: _isProcessing ? null : _handleCheckout,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.pink,
//                             foregroundColor: Colors.white,
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: _isProcessing
//                               ? const Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                         color: Colors.white,
//                                         strokeWidth: 2,
//                                       ),
//                                     ),
//                                     SizedBox(width: 12),
//                                     Text(
//                                       'Processing...',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ],
//                                 )
//                               : const Text(
//                                   'PAY AND CHECKOUT',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }








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














// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   /// ✅ Checkout function
//   void _checkout(BuildContext context) async {
//     final cart = context.read<CartProvider>();
  
//     if (cart.cartItems.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Cart is empty!')),
//       );
//       return;
//     }

//     try {
//       // 1️⃣ Save order to Firestore
//       final orderRef = FirebaseFirestore.instance.collection('orders').doc();
//       await orderRef.set({
//         'items': cart.cartItems.map((item) => {
//           'id': item.id,
//           'name': item.name,
//           'price': item.price,
//           'image': item.image,
//         }).toList(),
//         'total': cart.totalPrice,
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       // 2️⃣ Clear the cart
//       cart.clearCart();

//       // 3️⃣ Show confirmation
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Checkout successful!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Checkout failed: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Shopping Cart')),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text('Your cart is empty'),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cart.cartItems[index];
//                       return ListTile(
//                         leading: Image.network(
//                           item.image,
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(item.name),
//                         subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             cart.removeFromCart(item);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Total:',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$${cart.totalPrice.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () => _checkout(context),
//                           child: const Text('Checkout'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty',
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (_, i) {
//                       final item = cart.cartItems[i];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 6, horizontal: 12),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 50),
//                           title: Text(item.name),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => cart.removeFromCart(item),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Checkout not implemented')),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.pink,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 12),
//                         ),
//                         child: const Text(
//                           'Checkout',
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
// //import '../providers/product_provider.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = context.watch<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Cart'),
//         backgroundColor: Colors.pink,
//       ),
//       body: cart.cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 'Your cart is empty',
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.cartItems.length,
//                     itemBuilder: (_, i) {
//                       final item = cart.cartItems[i];
//                       return Card(
//                         margin:
//                             const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                         child: ListTile(
//                           leading: Image.network(item.image, width: 50),
//                           title: Text(item.name),
//                           subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               cart.removeFromCart(item);
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
                        
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Checkout not implemented')),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.pink,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 12),
//                         ),
//                         child: const Text(
//                           'Checkout',
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
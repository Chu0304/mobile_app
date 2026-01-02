import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/cart_provider.dart';
import '../providers/payment_provider.dart';

// do ur task here







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
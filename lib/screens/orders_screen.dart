// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ordersRef = FirebaseFirestore.instance.collection('orders');

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Orders'),
//         backgroundColor: Colors.pink,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: ordersRef.orderBy('createdAt', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No orders found.'));
//           }

//           final orders = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               final items = order['items'] as List<dynamic>;
//               final total = order['total'] as num;

//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ExpansionTile(
//                   title: Text('Order #${order.id}'),
//                   subtitle: Text('Total: \$${total.toStringAsFixed(2)}'),
//                   children: items.map((item) {
//                     return ListTile(
//                       leading: Image.network(
//                         item['image'],
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                       title: Text(item['name']),
//                       trailing: Text('\$${(item['price'] as num).toStringAsFixed(2)}'),
//                     );
//                   }).toList(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ordersRef = FirebaseFirestore.instance.collection('orders');

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Orders'),
//         backgroundColor: Colors.pink,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: ordersRef.orderBy('createdAt', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No orders found.'));
//           }

//           final orders = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               final items = (order['items'] as List<dynamic>?) ?? [];
//               final total = (order['total'] as num?) ?? 0;

//               return Card(
//                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ExpansionTile(
//                   title: Text('Order #${order.id}'),
//                   subtitle: Text('Total: \$${total.toStringAsFixed(2)}'),
//                   children: items.map((item) {
//                     final name = (item['name'] as String?) ?? 'Unnamed Product';
//                     final image = (item['image'] as String?) ??
//                         'https://via.placeholder.com/50';
//                     final price = (item['price'] as num?) ?? 0;

//                     return ListTile(
//                       leading: Image.network(
//                         image,
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       ),
//                       title: Text(name),
//                       trailing: Text('\$${price.toStringAsFixed(2)}'),
//                     );
//                   }).toList(),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // ✅ Added Auth import

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 1️⃣ Get current user ID
//     final String? userId = FirebaseAuth.instance.currentUser?.uid;

//     // 2️⃣ Filter the query by userId
//     final ordersQuery = FirebaseFirestore.instance
//         .collection('orders')
//         .where('userId', isEqualTo: userId) // ✅ Only fetch MY orders
//         .orderBy('createdAt', descending: true);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Orders'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: userId == null 
//         ? const Center(child: Text('Please login to see orders'))
//         : StreamBuilder<QuerySnapshot>(
//             stream: ordersQuery.snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                 return const Center(child: Text('No orders found.'));
//               }

//               final orders = snapshot.data!.docs;

//               return ListView.builder(
//                 itemCount: orders.length,
//                 itemBuilder: (context, index) {
//                   final order = orders[index];
//                   final items = (order['items'] as List<dynamic>?) ?? [];
//                   final total = (order['total'] as num?) ?? 0;

//                   return Card(
//                     margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     child: ExpansionTile(
//                       title: Text('Order #${order.id.substring(0, 8)}...'),
//                       subtitle: Text('Total: \$${total.toStringAsFixed(2)}'),
//                       children: items.map((item) {
//                         return ListTile(
//                           leading: Image.network(
//                             item['image'] ?? '',
//                             width: 50,
//                             errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
//                           ),
//                           title: Text(item['name'] ?? 'Product'),
//                           trailing: Text('\$${item['price']}'),
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current user ID
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Please login to see orders'),
        ),
      );
    }

    // Filter the query by userId
    final ordersQuery = FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ordersQuery.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return const Center(child: Text('No orders found.'));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final order = docs[index].data() as Map<String, dynamic>;
              
              // Safe handling if fields are missing
              final items = (order['items'] as List<dynamic>?) ?? [];
              final total = (order['total'] as num?) ?? 0;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ExpansionTile(
                  title: Text('Order #${docs[index].id.substring(0, 8)}...'),
                  subtitle: Text('Total: \$${total.toStringAsFixed(2)}'),
                  children: items.map((item) {
                    final itemMap = item as Map<String, dynamic>? ?? {};
                    return ListTile(
                      leading: Image.network(
                        itemMap['image'] ?? '',
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported),
                        fit: BoxFit.cover,
                      ),
                      title: Text(itemMap['name'] ?? 'Product'),
                      trailing: Text(
                        '\$${(itemMap['price'] as num?)?.toStringAsFixed(2) ?? '0.00'}',
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

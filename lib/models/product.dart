// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String category;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.category,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'].toString(),
//       name: json['title'],
//       price: double.parse(json['price'].toString()),
//       image: json['image'],
//       category: json['category']?.toString() ?? '',
//     );
//   }
// }




// class Product {
//   final int id;
//   final String name;
//   final double price;
//   final String image;
//   final String category;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.category,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'] as int,
//       name: json['title'] as String, // FakeStore uses "title"
//       price: (json['price'] as num).toDouble(),
//       image: json['image'] as String,
//       category: json['category'] as String,
//     );
//   }
// }







// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String description;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       // 1. Convert ID to String to prevent type mismatch errors
//       id: json['id'].toString(), 
//       // 2. DummyJSON uses 'title' for the product name
//       name: json['title'] ?? 'Unknown Shoe', 
//       // 3. Handle prices that might be integers or doubles
//       price: (json['price'] as num).toDouble(), 
//       // 4. DummyJSON uses 'thumbnail' for the main product image
//       image: json['thumbnail'] ?? '', 
//       // 5. Safely handle the description field
//       description: json['description'] ?? '',
//     );
//   }
// }


// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String description;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'].toString(),
//       name: json['title'] ?? 'No Name',
//       // Safely convert any number type (int or double) to double
//       price: (json['price'] as num?)?.toDouble() ?? 0.0,
//       // Using 'thumbnail' as requested for faster loading
//       image: json['thumbnail'] ?? '',
//       description: json['description'] ?? '',
//     );
//   }
// }

// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String description;
//   final String category; // Added to distinguish between Men, Women, Kids

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//     required this.category,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'].toString(),
//       name: json['title'] ?? 'No Name',
//       price: (json['price'] as num?)?.toDouble() ?? 0.0,
//       image: json['thumbnail'] ?? '',
//       description: json['description'] ?? '',
//       category: json['category'] ?? 'unassigned',
//     );
//   }
// }








import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      // Some APIs use 'title', others use 'name'
      name: json['title'] ?? json['name'] ?? 'Premium Shoe',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      // Some APIs use 'thumbnail', others use 'image'
      image: json['thumbnail'] ?? json['image'] ?? 'https://via.placeholder.com/150',
      description: json['description'] ?? 'No description available.',
      category: json['category'] ?? 'General',
    );
  }

  get brand => null;

  static fromFirestore(QueryDocumentSnapshot<Object?> doc) {}
}



















// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String description;
//   final String category;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//     required this.category,
//   });

//   // ✅ From JSON (API support)
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'].toString(),
//       name: json['title'] ?? json['name'] ?? 'Premium Shoe',
//       price: (json['price'] as num?)?.toDouble() ?? 0.0,
//       image: json['thumbnail'] ?? json['image'] ?? 'https://via.placeholder.com/150',
//       description: json['description'] ?? 'No description available.',
//       category: json['category'] ?? 'General',
//     );
//   }

//   // ✅ From Firestore (Your shoe app data)
//   factory Product.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Product(
//       id: doc.id,  // Firestore document ID
//       name: data['name'] ?? 'Premium Shoe',
//       price: (data['price'] as num?)?.toDouble() ?? 0.0,
//       image: data['image'] ?? 'https://via.placeholder.com/150',
//       description: data['description'] ?? 'No description available.',  // ← UNIQUE per shoe!
//       category: data['category'] ?? 'General',
//     );
//   }

//   // ✅ To Firestore (for saving new products)
//   Map<String, dynamic> toFirestore() {
//     return {
//       'name': name,
//       'price': price,
//       'image': image,
//       'description': description,  // ← Your unique shoe description
//       'category': category,
//     };
//   }

//   // ✅ Brand getter (for future use)
//   String? get brand => null;

//   // Convert to JSON for other uses
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'image': image,
//       'description': description,
//       'category': category,
//     };
//   }
// }






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;
//   final String description;
//   final String category;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//     required this.category,
//   });

//   // ✅ From Online API (Fake Store API)
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'].toString(),
//       name: json['title'] ?? 'Premium Shoe',
//       price: (json['price'] as num).toDouble(),
//       image: json['image'] ?? 'https://via.placeholder.com/150',
//       description: json['description'] ?? 'No description available.',
//       category: _mapCategory(json['category'] ?? 'general'),
//     );
//   }

//   // ✅ Static method to fetch from online API
//   static Future<List<Product>> fetchFromAPI() async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://fakestoreapi.com/products'),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         return data.map((json) => Product.fromJson(json)).toList();
//       }
//     } catch (e) {
//       print('API Error: $e');
//     }
//     return [];
//   }

//   // ✅ Keep Firestore support (optional)
//   factory Product.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Product(
//       id: doc.id,
//       name: data['name'] ?? 'Premium Shoe',
//       price: (data['price'] as num?)?.toDouble() ?? 0.0,
//       image: data['image'] ?? 'https://via.placeholder.com/150',
//       description: data['description'] ?? 'No description available.',
//       category: data['category'] ?? 'General',
//     );
//   }

//   // ✅ Map API categories to your app categories
//   static String _mapCategory(String apiCategory) {
//     switch (apiCategory.toLowerCase()) {
//       case 'men\'s clothing':
//         return 'men';
//       case 'women\'s clothing':
//         return 'women';
//       case 'electronics':
//         return 'accessories';
//       default:
//         return 'all';
//     }
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       'name': name,
//       'price': price,
//       'image': image,
//       'description': description,
//       'category': category,
//     };
//   }

//   String? get brand => null;

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'image': image,
//       'description': description,
//       'category': category,
//     };
//   }

//   copyWith({required String category}) {}
// }

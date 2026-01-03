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



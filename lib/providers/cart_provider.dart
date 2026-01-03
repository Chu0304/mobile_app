import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<CartItem> get cartItems => List.unmodifiable(_items);
  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * (item.quantity ?? 1)));
  }

  /// ➕ Add product to cart with size/color/quantity (Syncs Local + Firestore)
  Future<void> addToCart(
    Product product, {
    int quantity = 1,
    String? size,
    String? color,
  }) async {
    // Check if item already exists
    final existingIndex = _items.indexWhere((item) => item.id == product.id);
    
    if (existingIndex >= 0) {
      // Update quantity if same product
      _items[existingIndex] = CartItem(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: (_items[existingIndex].quantity ?? 1) + quantity,
        selectedSize: size ?? _items[existingIndex].selectedSize,
        selectedColor: color ?? _items[existingIndex].selectedColor,
      );
    } else {
      // Add new item
      final newItem = CartItem(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        quantity: quantity,
        selectedSize: size ?? 'US 8',  // Default size
        selectedColor: color ?? 'White',  // Default color
      );
      _items.add(newItem);
    }

    notifyListeners();

    // ✅ Save to Firestore
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('cart')
            .doc(product.id)
            .set({
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'image': product.image,
          'quantity': quantity,
          'selectedSize': size ?? 'US 8',
          'selectedColor': color ?? 'White',
          'addedAt': FieldValue.serverTimestamp(),
        });
        debugPrint("✅ CartProvider: Added to Firestore with size/color/qty");
      } catch (e) {
        debugPrint("❌ Firestore Add Error: $e");
      }
    }
  }

  /// ➖ Update quantity
  Future<void> updateQuantity(String productId, int newQuantity) async {
    final index = _items.indexWhere((item) => item.id == productId);
    if (index >= 0 && newQuantity > 0) {
      _items[index] = CartItem(
        id: _items[index].id,
        name: _items[index].name,
        price: _items[index].price,
        image: _items[index].image,
        quantity: newQuantity,
        selectedSize: _items[index].selectedSize,
        selectedColor: _items[index].selectedColor,
      );
      notifyListeners();

      // Update Firestore
      final user = _auth.currentUser;
      if (user != null) {
        try {
          await _firestore
              .collection('users')
              .doc(user.uid)
              .collection('cart')
              .doc(productId)
              .update({'quantity': newQuantity});
        } catch (e) {
          debugPrint("❌ Firestore Update Error: $e");
        }
      }
    } else if (newQuantity == 0) {
      removeFromCartById(productId);
    }
  }

  /// ❌ Remove product from cart
  Future<void> removeFromCart(CartItem item) async {
    await removeFromCartById(item.id);
  }

  Future<void> removeFromCartById(String productId) async {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();

    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('cart')
            .doc(productId)
            .delete();
        debugPrint("✅ CartProvider: Removed from Firestore");
      } catch (e) {
        debugPrint("❌ Firestore Delete Error: $e");
      }
    }
  }

  /// 🗑️ Clear entire cart
  Future<void> clearCart() async {
    final currentItems = List<CartItem>.from(_items);
    _items.clear();
    notifyListeners();

    final user = _auth.currentUser;
    if (user != null) {
      try {
        final snapshots = await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('cart')
            .get();
        
        final batch = _firestore.batch();
        for (var doc in snapshots.docs) {
          batch.delete(doc.reference);
        }
        await batch.commit();
        debugPrint("✅ CartProvider: Cleared entire cart from Firestore");
      } catch (e) {
        debugPrint("❌ Firestore Clear Error: $e");
      }
    }
  }

  /// 🔄 Load cart from Firestore on app start
  Future<void> loadCartFromFirestore() async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('cart')
          .orderBy('addedAt', descending: true)
          .get();

      _items.clear();
      for (var doc in snapshot.docs) {
        final data = doc.data();
        _items.add(CartItem(
          id: data['id'] ?? '',
          name: data['name'] ?? '',
          price: (data['price'] as num?)?.toDouble() ?? 0.0,
          image: data['image'] ?? '',
          quantity: data['quantity'] ?? 1,
          selectedSize: data['selectedSize'] ?? 'US 8',
          selectedColor: data['selectedColor'] ?? 'White',
        ));
      }
      notifyListeners();
      debugPrint("✅ CartProvider: Loaded ${_items.length} items from Firestore");
    } catch (e) {
      debugPrint("❌ Load Cart Error: $e");
    }
  }

  /// ❤️ Add from favorites
  void addToCartFromFavorites(Map<String, dynamic> product) {
    final newProduct = Product(
      id: product['id'].toString(),
      name: product['title'] ?? product['name'] ?? 'Unknown Shoe',
      price: (product['price'] as num).toDouble(),
      image: product['thumbnail'] ?? product['image'] ?? '',
      description: product['description'] ?? '',
      category: product['category'] ?? '',
    );
    addToCart(newProduct); // Default size/color
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.id == productId);
  }
}

/// ✅ CartItem Model with Size/Color/Quantity
class CartItem {
  final String id;
  final String name;
  final double price;
  final String image;
  final int? quantity;
  final String? selectedSize;
  final String? selectedColor;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity,
    this.selectedSize,
    this.selectedColor,
  });

  // ✅ Copy with method
  CartItem copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  // ✅ To Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity ?? 1,
      'selectedSize': selectedSize ?? 'US 8',
      'selectedColor': selectedColor ?? 'White',
    };
  }
}

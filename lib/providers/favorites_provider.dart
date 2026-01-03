import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// do  ur task here

class FavoritesProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _favoritesSub;
  StreamSubscription<User?>? _authSub;

  /// 🔐 Current user id
  String? get _uid => _auth.currentUser?.uid;
  bool get isLoggedIn => _uid != null;

  /// ⭐ Local cache
  final Map<String, Map<String, dynamic>> _favoriteProducts = {};

  /// 📦 Public getters (NON-NULLABLE)
  Map<String, Map<String, dynamic>> get favoriteProducts =>
      Map.unmodifiable(_favoriteProducts);

  List<String> get favoriteIds =>
      List.unmodifiable(_favoriteProducts.keys);

  FavoritesProvider() {
    _listenToAuth();
  }

  /// 🔐 Listen to auth changes
  void _listenToAuth() {
    _authSub = _auth.authStateChanges().listen((user) {
      _favoritesSub?.cancel();
      _favoriteProducts.clear();

      if (user != null) {
        _listenToFavorites();
      }

      notifyListeners();
    });
  }

  /// 🔁 Listen to Firestore favorites
  void _listenToFavorites() {
    final uid = _uid;
    if (uid == null) return;

    _favoritesSub = _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .snapshots()
        .listen((snapshot) {
      _favoriteProducts
        ..clear()
        ..addEntries(
          snapshot.docs.map(
            (doc) => MapEntry(doc.id, doc.data()),
          ),
        );

      notifyListeners();
    });
  }

  /// ❤️ Add favorite
  Future<void> addFavorite({
    required String productId,
    required String title,
    required dynamic price,
    required String image,
  }) async {
    final uid = _uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(productId)
        .set({
      'id': productId,
      'title': title,
      'price': (price as num).toDouble(),
      'image': image,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// 💔 Remove favorite
  Future<void> removeFavorite(String productId) async {
    final uid = _uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(productId)
        .delete();
  }

  /// 🔁 Toggle favorite (NO notifyListeners here)
  Future<void> toggleFavorite({
    required String productId,
    required String title,
    required double price,
    required String image,
  }) async {
    if (_favoriteProducts.containsKey(productId)) {
      await removeFavorite(productId);
    } else {
      await addFavorite(
        productId: productId,
        title: title,
        price: price,
        image: image,
      );
    }
  }

  /// 🔍 Fast local check
  bool isFavorite(String productId) =>
      _favoriteProducts.containsKey(productId);

  /// ❤️➡️🛒 Add favorite to cart
  void addToCartFromFavorites(
    String productId,
    void Function(Map<String, dynamic>) addToCart,
  ) {
    final product = _favoriteProducts[productId];
    if (product != null) {
      addToCart(product);
    }
  }

  @override
  void dispose() {
    _favoritesSub?.cancel();
    _authSub?.cancel();
    super.dispose();
  }
}





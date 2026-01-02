// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FavoritesProvider with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// 🔐 Get current user ID safely
//   String? get _uid => _auth.currentUser?.uid;

//   /// ❌ Prevent access if user not logged in
//   bool get isLoggedIn => _uid != null;

//   /// ⭐ Favorites stream (real-time)
//   Stream<QuerySnapshot<Map<String, dynamic>>> favoritesStream() {
//     if (_uid == null) {
//       return const Stream.empty();
//     }

//     return _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .snapshots();
//   }

//   /// ❤️ Add product to favorites
//   Future<void> addFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .set({
//       'id': productId,
//       'title': title,
//       'price': price,
//       'image': image,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   /// 💔 Remove product from favorites
//   Future<void> removeFavorite(String productId) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .delete();
//   }

//   /// 🔁 Toggle favorite (add/remove)
//   Future<void> toggleFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     final ref = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId);

//     final doc = await ref.get();

//     if (doc.exists) {
//       await ref.delete();
//     } else {
//       await ref.set({
//         'id': productId,
//         'title': title,
//         'price': price,
//         'image': image,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     }
//   }

//   /// 🔍 Check if product is favorite
//   Future<bool> isFavorite(String productId) async {
//     if (_uid == null) return false;

//     final doc = await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .get();

//     return doc.exists;
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FavoritesProvider with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// 🔐 Get current user ID safely
//   String? get _uid => _auth.currentUser?.uid;

//   /// ❌ Prevent access if user not logged in
//   bool get isLoggedIn => _uid != null;

//   /// 🔁 Keep track of favorite IDs locally
//   final Set<String> _favoriteIds = {};
//   Set<String> get favoriteIds => _favoriteIds;

//   FavoritesProvider() {
//     _syncFavorites();
//   }

//   get favoriteProducts => null;

//   /// ⭐ Favorites stream (real-time)
//   Stream<QuerySnapshot<Map<String, dynamic>>> favoritesStream() {
//     if (_uid == null) {
//       return const Stream.empty();
//     }

//     return _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .snapshots();
//   }

//   /// 🔁 Sync favorite IDs with local set
//   void _syncFavorites() {
//     if (_uid == null) return;

//     favoritesStream().listen((snapshot) {
//       _favoriteIds.clear();
//       for (var doc in snapshot.docs) {
//         _favoriteIds.add(doc.id);
//       }
//       notifyListeners();
//     });
//   }

//   /// ❤️ Add product to favorites
//   Future<void> addFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     final ref = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId);

//     await ref.set({
//       'id': productId,
//       'title': title,
//       'price': price,
//       'image': image,
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     _favoriteIds.add(productId);
//     notifyListeners();
//   }

//   /// 💔 Remove product from favorites
//   Future<void> removeFavorite(String productId) async {
//     if (_uid == null) return;

//     final ref = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId);

//     await ref.delete();

//     _favoriteIds.remove(productId);
//     notifyListeners();
//   }

//   /// 🔁 Toggle favorite (add/remove)
//   Future<void> toggleFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     final ref = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId);

//     final doc = await ref.get();

//     if (doc.exists) {
//       await ref.delete();
//       _favoriteIds.remove(productId);
//     } else {
//       await ref.set({
//         'id': productId,
//         'title': title,
//         'price': price,
//         'image': image,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//       _favoriteIds.add(productId);
//     }

//     notifyListeners();
//   }

//   /// 🔍 Check if product is favorite
//   bool isFavoriteLocal(String productId) {
//     return _favoriteIds.contains(productId);
//   }

//   Future<bool> isFavorite(String productId) async {
//     if (_uid == null) return false;

//     final doc = await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .get();

//     return doc.exists;
//   }

//   void addToCartFromFavorites(productData) {}
// }



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FavoritesProvider with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   StreamSubscription? _favoritesSub;

//   /// 🔐 Current user id
//   String? get _uid => _auth.currentUser?.uid;

//   bool get isLoggedIn => _uid != null;

//   /// ⭐ Local cache of favorite products
//   final Map<String, Map<String, dynamic>> _favoriteProducts = {};

//   /// 📦 Public getters
//   Map<String, Map<String, dynamic>> get favoriteProducts =>
//       _favoriteProducts;

//   List<String> get favoriteIds => _favoriteProducts.keys.toList();

//   FavoritesProvider() {
//     _listenToFavorites();
//   }

//   /// 🔁 Listen & sync favorites from Firestore
//   void _listenToFavorites() {
//     if (_uid == null) return;

//     _favoritesSub?.cancel();

//     _favoritesSub = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .snapshots()
//         .listen((snapshot) {
//       _favoriteProducts.clear();

//       for (var doc in snapshot.docs) {
//         _favoriteProducts[doc.id] = doc.data();
//       }

//       notifyListeners();
//     });
//   }

//   /// ❤️ Add to favorites
//   Future<void> addFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .set({
//       'id': productId,
//       'title': title,
//       'price': price,
//       'image': image,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   /// 💔 Remove from favorites
//   Future<void> removeFavorite(String productId) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .delete();
//   }

//   /// 🔁 Toggle favorite
//   Future<void> toggleFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     if (_favoriteProducts.containsKey(productId)) {
//       await removeFavorite(productId);
//     } else {
//       await addFavorite(
//         productId: productId,
//         title: title,
//         price: price,
//         image: image,
//       );
//     }
//   }

//   /// 🔍 Fast local check
//   bool isFavorite(String productId) {
//     return _favoriteProducts.containsKey(productId);
//   }

//   /// 🛒 Example: Add favorite item to cart
//   void addToCartFromFavorites(
//     String productId,
//     void Function(Map<String, dynamic>) addToCart,
//   ) {
//     final product = _favoriteProducts[productId];
//     if (product != null) {
//       addToCart(product);
//     }
//   }

//   @override
//   void dispose() {
//     _favoritesSub?.cancel();
//     super.dispose();
//   }
// }














// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FavoritesProvider with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _favoritesSub;

//   /// 🔐 Current user id
//   String? get _uid => _auth.currentUser?.uid;
//   bool get isLoggedIn => _uid != null;

//   /// ⭐ Local cache (FAST UI)
//   final Map<String, Map<String, dynamic>> _favoriteProducts = {};

//   /// 📦 Public getters (NON-NULLABLE)
//   Map<String, Map<String, dynamic>> get favoriteProducts =>
//       Map.unmodifiable(_favoriteProducts);

//   List<String> get favoriteIds =>
//       List.unmodifiable(_favoriteProducts.keys);

//   FavoritesProvider() {
//     _listenToFavorites();
//   }

//   /// 🔁 Sync favorites from Firestore
//   void _listenToFavorites() {
//     if (_uid == null) return;

//     _favoritesSub?.cancel();

//     _favoritesSub = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .snapshots()
//         .listen((snapshot) {
//       _favoriteProducts.clear();

//       for (var doc in snapshot.docs) {
//         _favoriteProducts[doc.id] = doc.data();
//       }

//       notifyListeners();
//     });
//   }

//   /// ❤️ Add favorite
//   Future<void> addFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .set({
//       'id': productId,
//       'title': title,
//       'price': price,
//       'image': image,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   /// 💔 Remove favorite
//   Future<void> removeFavorite(String productId) async {
//     if (_uid == null) return;

//     await _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId)
//         .delete();
//   }

//   /// 🔁 Toggle favorite (SINGLE SOURCE)
//   Future<void> toggleFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     if (_favoriteProducts.containsKey(productId)) {
//       await removeFavorite(productId);
//     } else {
//       await addFavorite(
//         productId: productId,
//         title: title,
//         price: price,
//         image: image,
//       );
//     }
//     notifyListeners();
//   }

//   /// 🔍 Fast local check
//   bool isFavorite(String productId) =>
//       _favoriteProducts.containsKey(productId);

//   /// ❤️➡️🛒 Add favorite to cart
//   void addToCartFromFavorites(
//     String productId,
//     void Function(Map<String, dynamic>) addToCart,
//   ) {
//     final product = _favoriteProducts[productId];
//     if (product != null) {
//       addToCart(product);
//     }
//   }

//   @override
//   void dispose() {
//     _favoritesSub?.cancel();
//     super.dispose();
//   }
// }








import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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





// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FavoritesProvider with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   String? get _uid => _auth.currentUser?.uid;

//   final Set<String> _favoriteIds = {};
//   Set<String> get favoriteIds => _favoriteIds;

//   FavoritesProvider() {
//     _syncFavorites();
//   }

//   void _syncFavorites() {
//     if (_uid == null) return;
//     _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .snapshots()
//         .listen((snapshot) {
//       _favoriteIds.clear();
//       for (var doc in snapshot.docs) {
//         _favoriteIds.add(doc.id);
//       }
//       notifyListeners();
//     });
//   }

//   Future<void> toggleFavorite({
//     required String productId,
//     required String title,
//     required double price,
//     required String image,
//   }) async {
//     if (_uid == null) return;

//     final ref = _firestore
//         .collection('users')
//         .doc(_uid)
//         .collection('favorites')
//         .doc(productId);

//     final doc = await ref.get();
//     if (doc.exists) {
//       await ref.delete();
//     } else {
//       await ref.set({
//         'id': productId,
//         'title': title,
//         'price': price,
//         'image': image,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     }
//   }
// }
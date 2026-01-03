
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _displayProducts = [];

  bool _isLoading = false;
  bool _isFetchingMore = false;
  String? _error;

  int _currentSkip = 0;
  final int _pageSize = 20;

  // Categories that contain footwear
  final List<String> _categories = ['mens-shoes', 'womens-shoes', 'sports-accessories'];
  int _categoryIndex = 0;

  bool _hasMore = true; // Tracks if more products exist

  List<Product> get products => _displayProducts;
  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  String? get error => _error;
  bool get hasMore => _hasMore;

  /// 👟 Core Fetch Logic with proper pagination and category switching
  Future<void> fetchProducts({bool isRefresh = true}) async {
    if (isRefresh) {
      _isLoading = true;
      _currentSkip = 0;
      _categoryIndex = 0;
      _allProducts = [];
      _displayProducts = [];
      _error = null;
      _hasMore = true;
    } else {
      // Prevent multiple simultaneous fetches
      if (_isFetchingMore || !_hasMore) return;
      _isFetchingMore = true;
    }
    notifyListeners();

    try {
      while (_categoryIndex < _categories.length) {
        String category = _categories[_categoryIndex];
        final url = Uri.parse(
            "https://dummyjson.com/products/category/$category?limit=$_pageSize&skip=$_currentSkip");

        final response = await http.get(url);

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          final List data = jsonData['products'];
          final int totalAvailable = jsonData['total'] ?? 0;

          // Only map items that are actually footwear
          final List<Product> newItems = data
              .map((item) => Product.fromJson(item))
              .where((p) {
                final name = p.name.toLowerCase();
                final cat = p.category.toLowerCase();
                return name.contains('shoe') ||
                    name.contains('sneaker') ||
                    name.contains('boot') ||
                    name.contains('heel') ||
                    name.contains('sandal') ||
                    name.contains('cleat') ||
                    cat.contains('shoes');
              })
              .toList();

          if (newItems.isNotEmpty) {
            _allProducts.addAll(newItems);
            _displayProducts = List.from(_allProducts);
          }

          _currentSkip += _pageSize;

          // If current category exhausted, move to next
          if (_currentSkip >= totalAvailable) {
            _categoryIndex++;
            _currentSkip = 0;
          }

          // Stop if we got new items
          if (newItems.isNotEmpty) break;
        } else {
          _error = "Failed to load products";
          break;
        }
      }

      // If all categories exhausted
      if (_categoryIndex >= _categories.length) {
        _hasMore = false;
      }
    } catch (e) {
      debugPrint("Fetch Error: $e");
      _error = "Could not load shoes.";
    } finally {
      _isLoading = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  /// 🏷️ Improved Category Filtering
  void filterProducts(String type) {
    if (type == 'women') {
      _displayProducts = _allProducts.where((p) {
        final name = p.name.toLowerCase();
        final cat = p.category.toLowerCase();
        return name.contains('women') || name.contains('heel') ||
            cat.contains('women') || cat.contains('heel');
      }).toList();
    } else if (type == 'men') {
      _displayProducts = _allProducts.where((p) {
        final name = p.name.toLowerCase();
        final cat = p.category.toLowerCase();
        return (name.contains('men') || cat.contains('men')) &&
            !name.contains('women') && !cat.contains('women');
      }).toList();
    } else if (type == 'kids') {
      _displayProducts = _allProducts.where((p) {
        final name = p.name.toLowerCase();
        return name.contains('kids') || name.contains('child') ||
            name.contains('boy') || name.contains('girl');
      }).toList();
    } else {
      _displayProducts = List.from(_allProducts);
    }
    notifyListeners();
  }

  /// 🔍 Search Products
  void searchProducts(String query) {
    if (query.isEmpty) {
      _displayProducts = List.from(_allProducts);
    } else {
      _displayProducts = _allProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}





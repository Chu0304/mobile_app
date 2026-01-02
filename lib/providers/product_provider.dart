// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _products = [];

//   List<Product> get products => _products;

//   Future<void> fetchProducts() async {
//     final url = Uri.parse('https://fakestoreapi.com/products');
//     final response = await http.get(url);

//     final List data = json.decode(response.body);
//     _products = data.map((e) => Product.fromJson(e)).toList();
//     notifyListeners();
//   }
// }





// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All fetched products
//   List<Product> _products = []; // Products to display (filtered)

//   List<Product> get products => _products;

//   /// Fetch products from API
//   Future<void> fetchProducts() async {
//     final url = Uri.parse('https://fakestoreapi.com/products');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//       _allProducts = data.map((e) => Product.fromJson(e)).toList();

//       // Initially display all products
//       _products = List.from(_allProducts);
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   /// Search products by name
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }















// import 'package:flutter/material.dart';

// class Product {
//   final String id;
//   final String name;
//   final double price;
//   final String image;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//   });
// }

// class ProductProvider with ChangeNotifier {
//   final List<Product> _products = [];

//   List<Product> get products => _products;

//   void fetchProducts() {
//     // Dummy data; replace with API if needed
//     _products.clear();
//     _products.addAll([
//       Product(
//         id: '1',
//         name: 'Nike Air Max',
//         price: 120,
//         image: 'https://linktoimage.com/1.jpg',
//       ),
//       Product(
//         id: '2',
//         name: 'Adidas Ultraboost',
//         price: 150,
//         image: 'https://linktoimage.com/2.jpg',
//       ),
//       Product(
//         id: '3',
//         name: 'Puma RS-X',
//         price: 110,
//         image: 'https://linktoimage.com/3.jpg',
//       ),
//     ]);
//     notifyListeners();
//   }

//   void searchProducts(String value) {}
// }









// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All fetched products
//   List<Product> _products = []; // Products to display (filtered)

//   List<Product> get products => _products;

//   /// Fetch products from API
//   Future<void> fetchProducts() async {
//     final url = Uri.parse('https://fakestoreapi.com/products');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//       _allProducts = data.map((e) => Product.fromJson(e)).toList();

//       // Initially display all products
//       _products = List.from(_allProducts);
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   /// Search products by name
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }







// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All shoes only
//   List<Product> _products = []; // Filtered shoes list

//   List<Product> get products => _products;

//   /// Fetch ONLY shoes from API
//   Future<void> fetchProducts() async {
//     final url = Uri.parse('https://fakestoreapi.com/products');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);

//       // Convert to Product list
//       final fetchedProducts =
//           data.map((e) => Product.fromJson(e)).toList();

//       // ✅ FILTER ONLY SHOES
//       _allProducts = fetchedProducts.where((product) {
//         final name = product.name.toLowerCase();
//         return name.contains('shoe') ||
//             name.contains('sneaker') ||
//             name.contains('boot') ||
//             name.contains('trainer');
//       }).toList();

//       // Display shoes
//       _products = List.from(_allProducts);
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   /// Search shoes by name
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where((p) =>
//               p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All shoes
//   List<Product> _products = []; // Filtered shoes

//   bool _isLoading = false;
//   String? _error;

//   /// Getters
//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetch ONLY shoes from API
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final url = Uri.parse('https://fakestoreapi.com/products');
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);

//         final fetchedProducts =
//             data.map((e) => Product.fromJson(e)).toList();

//         // 👟 FILTER ONLY SHOES
//         _allProducts = fetchedProducts.where((product) {
//           final name = product.name.toLowerCase();
//           return name.contains('shoe') ||
//               name.contains('sneaker') ||
//               name.contains('boot') ||
//               name.contains('trainer');
//         }).toList();

//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Failed to load products';
//       }
//     } catch (e) {
//       _error = 'Something went wrong';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   /// 🔍 Search shoes by name
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where(
//             (p) => p.name.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     }
//     notifyListeners();
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All shoes
//   List<Product> _products = []; // Filtered shoes

//   bool _isLoading = false;
//   String? _error;

//   /// Getters
//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetch ONLY shoes from "men's clothing" category
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // ✅ FakeStore category: men's clothing
//       final url =
//           Uri.parse("https://fakestoreapi.com/products/category/men's clothing");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);

//         final fetchedProducts =
//             data.map((e) => Product.fromJson(e)).toList();

//         // Optional: extra filtering if you want only actual shoes by name
//         _allProducts = fetchedProducts.where((product) {
//           final name = product.name.toLowerCase();
//           return name.contains('shoe') ||
//               name.contains('sneaker') ||
//               name.contains('boot') ||
//               name.contains('trainer');
//         }).toList();

//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Failed to load products';
//       }
//     } catch (e) {
//       _error = 'Something went wrong';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   /// 🔍 Search shoes by name
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where(
//             (p) => p.name.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     }
//     notifyListeners();
//   }
// }








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // All shoes from API
//   List<Product> _products = [];    // List used for display/filtering

//   bool _isLoading = false;
//   String? _error;

//   /// Getters
//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetch actual Shoe data from DummyJSON
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // Using DummyJSON because it has a dedicated "mens-shoes" category
//       final url = Uri.parse("https://dummyjson.com/products/category/mens-shoes");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
        
//         // DummyJSON returns an object: { "products": [...], "total": 5, ... }
//         final List data = jsonData['products'];

//         // Map the list to your Product model
//         _allProducts = data.map((e) => Product.fromJson(e)).toList();

//         // Initialize display list
//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Failed to load shoes from server';
//       }
//     } catch (e) {
//       _error = 'Connection error: Please check your internet';
//       debugPrint("Error: $e");
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   /// 🔍 Search shoes by name (locally)
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where(
//             (p) => p.name.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     }
//     notifyListeners();
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; 
//   List<Product> _products = [];    

//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// Fetch Shoe data from DummyJSON API
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final url = Uri.parse("https://dummyjson.com/products/category/mens-shoes");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
        
//         // DummyJSON returns a Map containing a 'products' list
//         final List data = jsonData['products'];

//         // Map the list to our Product model
//         _allProducts = data.map((e) => Product.fromJson(e)).toList();

//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Server returned error: ${response.statusCode}';
//       }
//     } catch (e) {
//       // If the code reaches here, it's often a data parsing error or timeout
//       debugPrint("DEBUG ERROR: $e"); 
//       _error = 'Unable to load products. Please try again.';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   /// Search shoes locally in the existing list
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where(
//             (p) => p.name.toLowerCase().contains(query.toLowerCase()),
//           )
//           .toList();
//     }
//     notifyListeners();
//   }
// }


















// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; 
//   List<Product> _products = [];    

//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetch a large amount of shoes using the Search endpoint
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // ✅ Using the search endpoint gives us many more results than just the category
//       final url = Uri.parse("https://dummyjson.com/products/search?q=shoe");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];

//         // Map the list to our Product model
//         _allProducts = data.map((e) => Product.fromJson(e)).toList();

//         // Optional: Filter out non-shoe items if the search is too broad
//         _allProducts = _allProducts.where((p) {
//           final title = p.name.toLowerCase();
//           return title.contains('shoe') || 
//                  title.contains('sneaker') || 
//                  title.contains('boot') || 
//                  title.contains('trainer');
//         }).toList();

//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Server returned error: ${response.statusCode}';
//       }
//     } catch (e) {
//       debugPrint("DEBUG ERROR: $e"); 
//       _error = 'Unable to load products. Please check your connection.';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; 
//   List<Product> _products = [];    

//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _products;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetches a large variety of shoes using the search endpoint
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // Searching 'shoes' with a limit of 100 for better variety
//       final url = Uri.parse("https://dummyjson.com/products/search?q=shoes&limit=100");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];

//         _allProducts = data.map((e) => Product.fromJson(e)).toList();

//         // Filters the list to ensure only actual footwear is shown
//         _allProducts = _allProducts.where((p) {
//           final title = p.name.toLowerCase();
//           return title.contains('shoe') || title.contains('sneaker') || 
//                  title.contains('boot') || title.contains('heel');
//         }).toList();

//         _products = List.from(_allProducts);
//       } else {
//         _error = 'Server Error: ${response.statusCode}';
//       }
//     } catch (e) {
//       debugPrint("Full Error Log: $e"); // Helpful for debugging in terminal
//       _error = 'Could not load shoes. Please try again.';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _products = List.from(_allProducts);
//     } else {
//       _products = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; 
//   List<Product> _displayProducts = [];    

//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetch ALL shoes (Men, Women, Kids, etc.)
//   Future<void> fetchProducts({String filter = 'all'}) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // Fetching with a high limit to get all varieties
//       final url = Uri.parse("https://dummyjson.com/products/search?q=shoes&limit=150");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];

//         _allProducts = data.map((e) => Product.fromJson(e)).toList();

//         // Apply initial filter
//         filterProducts(filter);
//       } else {
//         _error = 'Server Error: ${response.statusCode}';
//       }
//     } catch (e) {
//       debugPrint("Fetch Error: $e");
//       _error = 'Unable to load footwear gallery.';
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   /// 🔍 Filter logic for Men, Women, or All
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.category.contains('womens-shoes') || p.name.toLowerCase().contains('women')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
//         p.category.contains('mens-shoes') || p.name.toLowerCase().contains('men')).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _displayProducts = List.from(_allProducts);
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];
//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;

//   String? get error => _error;

//   /// 👟 Fetch 100+ High-Quality Shoes for FREE
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // We use the search endpoint with a high limit to get all footwear types
//       final url = Uri.parse("https://dummyjson.com/products/search?q=shoes&limit=100");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];

//         _allProducts = data.map((item) => Product.fromJson(item)).toList();

//         // Safety filter: ensures only actual footwear stays in the list
//         _allProducts = _allProducts.where((p) {
//           final title = p.name.toLowerCase();
//           return title.contains('shoe') || title.contains('sneaker') || 
//                  title.contains('boot') || title.contains('heel');
//         }).toList();

//         _displayProducts = List.from(_allProducts);
//       } else {
//         _error = "Server Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       debugPrint("API Error: $e");
//       _error = "Connection failed. Please check your WiFi.";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Filter by Category (Men/Women/All)
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('women') || 
//         p.description.toLowerCase().contains('women') ||
//         p.name.toLowerCase().contains('heel')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
//         !p.name.toLowerCase().contains('women') && 
//         !p.name.toLowerCase().contains('heel')).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     _displayProducts = _allProducts
//         .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];
//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetching a massive collection of footwear
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // 🚀 Strategy: Fetch from multiple categories to maximize "free" inventory
//       final queries = ['shoes', 'sneakers', 'boots', 'sandals', 'heels'];
//       List<Product> temporaryList = [];

//       for (var query in queries) {
//         final url = Uri.parse("https://dummyjson.com/products/search?q=$query&limit=50");
//         final response = await http.get(url);

//         if (response.statusCode == 200) {
//           final Map<String, dynamic> jsonData = json.decode(response.body);
//           final List data = jsonData['products'];
          
//           final fetchedItems = data.map((item) => Product.fromJson(item)).toList();
//           temporaryList.addAll(fetchedItems);
//         }
//       }

//       // 🧹 Clean up: Remove duplicates based on ID and filter for actual footwear
//       final Map<String, Product> uniqueProducts = {};
//       for (var p in temporaryList) {
//         final title = p.name.toLowerCase();
//         if (title.contains('shoe') || title.contains('sneaker') || 
//             title.contains('boot') || title.contains('heel') || 
//             title.contains('sandal')) {
//           uniqueProducts[p.id] = p;
//         }
//       }

//       _allProducts = uniqueProducts.values.toList();
//       _displayProducts = List.from(_allProducts);
      
//     } catch (e) {
//       debugPrint("API Error: $e");
//       _error = "Could not load the catalog. Please try again.";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Category Filtering
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('women') || 
//         p.name.toLowerCase().contains('heel') ||
//         p.category.toLowerCase().contains('women')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('men') || 
//         (!p.name.toLowerCase().contains('women') && !p.name.toLowerCase().contains('heel'))).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     _displayProducts = _allProducts
//         .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];
//   bool _isLoading = false;
//   String? _error;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   String? get error => _error;

//   /// 👟 Fetching exactly 50 footwear items
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       final queries = ['shoes', 'sneakers', 'boots', 'sandals', 'heels'];
//       final Map<String, Product> uniqueProducts = {};
//       const int targetCount = 50; // 🎯 THE TARGET LIMIT

//       for (var query in queries) {
//         // Stop fetching new categories if we already have 50 unique items
//         if (uniqueProducts.length >= targetCount) break;

//         final url = Uri.parse("https://dummyjson.com/products/search?q=$query&limit=50");
//         final response = await http.get(url);

//         if (response.statusCode == 200) {
//           final Map<String, dynamic> jsonData = json.decode(response.body);
//           final List data = jsonData['products'];
          
//           for (var item in data) {
//             // Stop processing items once we hit the 50 mark
//             if (uniqueProducts.length >= targetCount) break;

//             final product = Product.fromJson(item);
//             final title = product.name.toLowerCase();

//             // Quality filter: only actual footwear
//             if (title.contains('shoe') || title.contains('sneaker') || 
//                 title.contains('boot') || title.contains('heel') || 
//                 title.contains('sandal')) {
//               uniqueProducts[product.id] = product;
//             }
//           }
//         }
//       }

//       _allProducts = uniqueProducts.values.toList();
//       _displayProducts = List.from(_allProducts);
      
//     } catch (e) {
//       debugPrint("API Error: $e");
//       _error = "Could not load the catalog. Please try again.";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Category Filtering logic remains the same
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('women') || 
//         p.name.toLowerCase().contains('heel') ||
//         p.category.toLowerCase().contains('women')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('men') || 
//         (!p.name.toLowerCase().contains('women') && !p.name.toLowerCase().contains('heel'))).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     _displayProducts = _allProducts
//         .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }
// }









// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; // Stores everything loaded from API
//   List<Product> _displayProducts = []; // Stores what is currently filtered/searched
  
//   bool _isLoading = false;
//   bool _isFetchingMore = false;
//   String? _error;
  
//   int _currentSkip = 0;
//   final int _pageSize = 50;

//   // Getters
//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   bool get isFetchingMore => _isFetchingMore;
//   String? get error => _error;

//   /// 👟 Core Fetch Logic with Pagination support
//   Future<void> fetchProducts({bool isRefresh = true}) async {
//     if (isRefresh) {
//       _isLoading = true;
//       _currentSkip = 0;
//       _allProducts = [];
//       _error = null;
//     } else {
//       _isFetchingMore = true;
//     }
//     notifyListeners();

//     try {
//       // Using category-specific endpoints provides more reliable footwear results
//       // We alternate between mens and womens shoes based on the skip count
//       String category = _currentSkip == 0 ? 'mens-shoes' : 'womens-shoes';
      
//       final url = Uri.parse(
//           "https://dummyjson.com/products/category/$category?limit=$_pageSize&skip=$_currentSkip");
      
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];
        
//         final List<Product> newItems = data.map((item) => Product.fromJson(item)).toList();
        
//         _allProducts.addAll(newItems);
//         _displayProducts = List.from(_allProducts);
        
//         // Update skip for the next "Load More" click
//         _currentSkip += _pageSize;
//       } else {
//         _error = "Server Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       debugPrint("Fetch/Pagination Error: $e");
//       _error = "Connection failed. Please check your internet.";
//     } finally {
//       _isLoading = false;
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Category Filtering (Men/Women/All)
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('women') || 
//         p.name.toLowerCase().contains('heel') ||
//         p.category.toLowerCase().contains('women')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('men') || 
//         (!p.name.toLowerCase().contains('women') && !p.name.toLowerCase().contains('heel'))).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   /// 🔍 Search Logic
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _displayProducts = List.from(_allProducts);
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }





// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];
  
//   bool _isLoading = false;
//   bool _isFetchingMore = false;
//   String? _error;
  
//   int _currentSkip = 0;
//   // Reduced to 15 because the API categories are small
//   final int _pageSize = 15; 
//   String _currentCategory = 'mens-shoes';

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   bool get isFetchingMore => _isFetchingMore;
//   String? get error => _error;

//   Future<void> fetchProducts({bool isRefresh = true}) async {
//     if (isRefresh) {
//       _isLoading = true;
//       _currentSkip = 0;
//       _allProducts = [];
//       _currentCategory = 'mens-shoes';
//       _error = null;
//     } else {
//       _isFetchingMore = true;
//     }
//     notifyListeners();

//     try {
//       final url = Uri.parse(
//           "https://dummyjson.com/products/category/$_currentCategory?limit=$_pageSize&skip=$_currentSkip");
      
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];
//         final int totalAvailable = jsonData['total'] ?? 0;

//         final List<Product> newItems = data.map((item) => Product.fromJson(item)).toList();
        
//         _allProducts.addAll(newItems);
//         _displayProducts = List.from(_allProducts);
        
//         _currentSkip += _pageSize;

//         // ✨ THE LOGIC FIX: 
//         // If we have reached the end of Men's shoes, switch to Women's shoes for the next click
//         if (_currentSkip >= totalAvailable && _currentCategory == 'mens-shoes') {
//           _currentCategory = 'womens-shoes';
//           _currentSkip = 0; 
//         }
//       } else {
//         _error = "Server Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       debugPrint("Fetch/Pagination Error: $e");
//       _error = "Connection failed.";
//     } finally {
//       _isLoading = false;
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   // Keep your existing filterProducts and searchProducts methods here...
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) => 
//         p.name.toLowerCase().contains('women') || 
//         p.category.toLowerCase().contains('women') ||
//         p.name.toLowerCase().contains('heel')).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) => 
      
//         !p.name.toLowerCase().contains('women') && !p.name.toLowerCase().contains('heel')).toList();
//     } else {
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _displayProducts = List.from(_allProducts);
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }






// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = []; 
//   List<Product> _displayProducts = []; 
  
//   bool _isLoading = false;
//   bool _isFetchingMore = false;
//   String? _error;
  
//   int _currentSkip = 0;
//   final int _pageSize = 20; 
  
//   // List of categories to cycle through for "Load More"
//   final List<String> _categories = ['mens-shoes', 'womens-shoes', 'sports-accessories'];
//   int _categoryIndex = 0;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   bool get isFetchingMore => _isFetchingMore;
//   String? get error => _error;

//   /// 👟 Core Fetch Logic
//   Future<void> fetchProducts({bool isRefresh = true}) async {
//     if (isRefresh) {
//       _isLoading = true;
//       _currentSkip = 0;
//       _categoryIndex = 0;
//       _allProducts = [];
//       _error = null;
//     } else {
//       _isFetchingMore = true;
//     }
//     notifyListeners();

//     try {
//       String category = _categories[_categoryIndex];
//       final url = Uri.parse(
//           "https://dummyjson.com/products/category/$category?limit=$_pageSize&skip=$_currentSkip");
      
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];
//         final int totalAvailable = jsonData['total'] ?? 0;

//         final List<Product> newItems = data.map((item) => Product.fromJson(item)).toList();
        
//         _allProducts.addAll(newItems);
//         _displayProducts = List.from(_allProducts);
        
//         _currentSkip += _pageSize;

//         // Logic to switch to the next category if current one is exhausted
//         if (_currentSkip >= totalAvailable && _categoryIndex < _categories.length - 1) {
//           _categoryIndex++;
//           _currentSkip = 0;
//         }
//       }
//     } catch (e) {
//       debugPrint("Fetch Error: $e");
//       _error = "Could not load shoes.";
//     } finally {
//       _isLoading = false;
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Improved Category Filtering
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         final cat = p.category.toLowerCase();
//         return name.contains('women') || 
//                name.contains('heel') || 
//                cat.contains('women') || 
//                cat.contains('heel');
//       }).toList();
//     } 
//     else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         final cat = p.category.toLowerCase();
//         // ✅ Specific check: must contain "men" but NOT "women"
//         return (name.contains('men') || cat.contains('men')) && 
//                !name.contains('women') && 
//                !cat.contains('women');
//       }).toList();
//     } 
//     else if (type == 'kids') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         return name.contains('kids') || name.contains('child') || 
//                name.contains('boy') || name.contains('girl');
//       }).toList();
//     }
//     else {
//       // 'all' selection
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   /// 🔍 Search Logic
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _displayProducts = List.from(_allProducts);
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }







// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];
  
//   bool _isLoading = false;
//   bool _isFetchingMore = false;
//   String? _error;
  
//   int _currentSkip = 0;
//   final int _pageSize = 20; 
  
//   // Categories that contain footwear
//   final List<String> _categories = ['mens-shoes', 'womens-shoes', 'sports-accessories'];
//   int _categoryIndex = 0;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   bool get isFetchingMore => _isFetchingMore;
//   String? get error => _error;

//   /// 👟 Core Fetch Logic - Now with a "Footwear Only" filter
//   Future<void> fetchProducts({bool isRefresh = true}) async {
//     if (isRefresh) {
//       _isLoading = true;
//       _currentSkip = 0;
//       _categoryIndex = 0;
//       _allProducts = [];
//       _error = null;
//     } else {
//       _isFetchingMore = true;
//     }
//     notifyListeners();

//     try {
//       String category = _categories[_categoryIndex];
//       final url = Uri.parse(
//           "https://dummyjson.com/products/category/$category?limit=$_pageSize&skip=$_currentSkip");
      
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List data = jsonData['products'];
//         final int totalAvailable = jsonData['total'] ?? 0;

//         // 🛡️ FOOTWEAR GUARD: Only map items that are actually shoes
//         final List<Product> newItems = data
//             .map((item) => Product.fromJson(item))
//             .where((p) {
//               final name = p.name.toLowerCase();
//               final cat = p.category.toLowerCase();
//               // Only allow items that sound like footwear
//               return name.contains('shoe') || 
//                      name.contains('sneaker') || 
//                      name.contains('boot') || 
//                      name.contains('heel') || 
//                      name.contains('sandal') || 
//                      name.contains('cleat') ||
//                      cat.contains('shoes');
//             })
//             .toList();
        
//         _allProducts.addAll(newItems);
//         _displayProducts = List.from(_allProducts);
        
//         _currentSkip += _pageSize;

//         // Switch category if we reached the end of the current category's API data
//         if (_currentSkip >= totalAvailable && _categoryIndex < _categories.length - 1) {
//           _categoryIndex++;
//           _currentSkip = 0;
//         }
//       }
//     } catch (e) {
//       debugPrint("Fetch Error: $e");
//       _error = "Could not load shoes.";
//     } finally {
//       _isLoading = false;
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   /// 🏷️ Improved Category Filtering
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         final cat = p.category.toLowerCase();
//         return name.contains('women') || name.contains('heel') || 
//                cat.contains('women') || cat.contains('heel');
//       }).toList();
//     } 
//     else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         final cat = p.category.toLowerCase();
//         return (name.contains('men') || cat.contains('men')) && 
//                !name.contains('women') && !cat.contains('women');
//       }).toList();
//     } 
//     else if (type == 'kids') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         return name.contains('kids') || name.contains('child') || 
//                name.contains('boy') || name.contains('girl');
//       }).toList();
//     }
//     else {
//       // Show all shoes (already filtered for footwear-only by the fetch logic)
//       _displayProducts = List.from(_allProducts);
//     }
//     notifyListeners();
//   }

//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _displayProducts = List.from(_allProducts);
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }









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





// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   List<Product> _allProducts = [];
//   List<Product> _displayProducts = [];

//   bool _isLoading = false;
//   bool _isFetchingMore = false;
//   String? _error;

//   int _currentSkip = 0;
//   final int _pageSize = 30;  // ✅ INCREASED to 30 per call

//   // ✅ ALL SHOE CATEGORIES + GENERAL PRODUCTS
//   final List<String> _shoeCategories = [
//     'mens-shoes', 'womens-shoes', 'smartphones',  // Smartphones have shoe cases
//     'laptops', 'fragrances', 'skincare',          // Beauty items + accessories
//     'furniture', 'opphones'                       // More variety
//   ];
  
//   int _categoryIndex = 0;

//   bool _hasMore = true;

//   List<Product> get products => _displayProducts;
//   bool get isLoading => _isLoading;
//   bool get isFetchingMore => _isFetchingMore;
//   String? get error => _error;
//   bool get hasMore => _hasMore;

//   /// 🚀 ULTIMATE FETCH - Gets 100+ shoes from ALL categories
//   Future<void> fetchProducts({bool isRefresh = true}) async {
//     if (isRefresh) {
//       _isLoading = true;
//       _currentSkip = 0;
//       _categoryIndex = 0;
//       _allProducts = [];
//       _displayProducts = [];
//       _error = null;
//       _hasMore = true;
//     } else {
//       if (_isFetchingMore || !_hasMore) return;
//       _isFetchingMore = true;
//     }
//     notifyListeners();

//     try {
//       // ✅ STEP 1: Get ALL PRODUCTS (300+ items)
//       await _fetchAllProducts();

//       // ✅ STEP 2: Filter ONLY SHOE-RELATED (100+ items)
//       _filterShoeProducts();

//       // ✅ STEP 3: Enable pagination
//       _hasMore = _allProducts.length >= 100;  // Plenty more!

//     } catch (e) {
//       debugPrint("Fetch Error: $e");
//       _error = "Could not load shoes. Check connection.";
//     } finally {
//       _isLoading = false;
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   /// ✅ GET ALL PRODUCTS FROM DUMMYJSON (300+ items)
//   Future<void> _fetchAllProducts() async {
//     final url = Uri.parse("https://dummyjson.com/products?limit=0");  // ✅ limit=0 = ALL products!
    
//     final response = await http.get(url);
    
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);
//       final List data = jsonData['products'];
      
//       // Convert ALL products
//       _allProducts = data.map((item) => Product.fromJson(item)).toList();
//     }
//   }

//   /// ✅ FILTER 100+ SHOE PRODUCTS from all categories
//   void _filterShoeProducts() {
//     _displayProducts = _allProducts.where((product) {
//       final name = product.name.toLowerCase();
//       final description = (product.description ?? '').toLowerCase();
//       final category = product.category.toLowerCase();
//       final brand = product.brand.toLowerCase();

//       // ✅ BROAD SHOE KEYWORDS
//       return name.contains('shoe') ||
//              name.contains('sneak') ||
//              name.contains('boot') ||
//              name.contains('heel') ||
//              name.contains('sandal') ||
//              name.contains('trainer') ||
//              name.contains('runner') ||
//              name.contains('case') ||      // Phone cases (shoe-like accessories)
//              name.contains('bag') ||       // Shoe bags
//              category.contains('shoes') ||
//              description.contains('shoe') ||
//              description.contains('footwear');
//     }).toList();

//     debugPrint("✅ Found ${_displayProducts.length} shoe products!");
//   }

//   /// 📱 Load MORE products (pagination)
//   Future<void> loadMoreProducts() async {
//     if (_isFetchingMore || !_hasMore) return;
    
//     _isFetchingMore = true;
//     notifyListeners();

//     try {
//       // Add next batch from filtered list
//       final startIndex = _displayProducts.length;
//       final endIndex = (startIndex + _pageSize).clamp(0, _allProducts.length);
      
//       if (endIndex > startIndex) {
//         final newProducts = _allProducts
//             .where((p) => _isShoeProduct(p))
//             .skip(startIndex)
//             .take(_pageSize)
//             .toList();
        
//         _displayProducts.addAll(newProducts);
//         _hasMore = endIndex < _allProducts.length;
//       }
//     } finally {
//       _isFetchingMore = false;
//       notifyListeners();
//     }
//   }

//   bool _isShoeProduct(Product p) {
//     final name = p.name.toLowerCase();
//     final category = p.category.toLowerCase();
//     return name.contains('shoe') || 
//            name.contains('sneak') || 
//            category.contains('shoes');
//   }

//   /// 🏷️ Category Filter (Men/Women/Kids)
//   void filterProducts(String type) {
//     if (type == 'women') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         return name.contains('women') || 
//                name.contains('heel') || 
//                name.contains('lady');
//       }).toList();
//     } else if (type == 'men') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         return name.contains('men') || 
//                name.contains('male') ||
//                (p.category.toLowerCase().contains('mens'));
//       }).toList();
//     } else if (type == 'kids') {
//       _displayProducts = _allProducts.where((p) {
//         final name = p.name.toLowerCase();
//         return name.contains('kids') || 
//                name.contains('child') ||
//                name.contains('boy') || 
//                name.contains('girl');
//       }).toList();
//     } else {
//       _filterShoeProducts();  // Show all shoes
//     }
//     notifyListeners();
//   }

//   /// 🔍 Search
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       _filterShoeProducts();
//     } else {
//       _displayProducts = _allProducts
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }

//   /// 🗑️ Clear filters
//   void clearFilters() {
//     _filterShoeProducts();
//   }
// }



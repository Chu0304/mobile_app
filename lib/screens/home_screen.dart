// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ProductProvider>(context, listen: false).fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = Provider.of<ProductProvider>(context).products;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Discover')),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (_, i) {
//           final p = products[i];
//           return Card(
//             child: ListTile(
//               leading: Image.network(p.image, width: 50),
//               title: Text(p.name),
//               subtitle: Text('\$${p.price}'),
//               trailing: IconButton(
//                 icon: const Icon(Icons.add_shopping_cart),
//                 onPressed: () {
//                   Provider.of<CartProvider>(context, listen: false)
//                       .addToCart(p);
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }         

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch products from API or dummy list
//     Provider.of<ProductProvider>(context, listen: false).fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = Provider.of<ProductProvider>(context).products;
//     final favorites = Provider.of<FavoritesProvider>(context);
//     final cart = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.pink,
//       ),
//       body: products.isEmpty
//           ? const Center(child: Text('No products found'))
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (_, i) {
//                 final product = products[i];
//                 final isFav = favorites.favoriteIds.contains(product.id);

//                 return ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFav,
//                   onFavorite: () {
//                     favorites.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },
//                   onAdd: () {
//                     cart.addToCart(product);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }






















// 








// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:shoe_shop/providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();

//     /// Fetch products safely
//     Future.microtask(() {
//       // ignore: use_build_context_synchronously
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = context.watch<ProductProvider>().products;
//     final favorites = context.watch<FavoritesProvider>();
//     final cart = context.read<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.pink,
//       ),
//       body: products.isEmpty
//           ? const Center(
//               child: Text('No products found'),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 /// ✅ Correct favorite check
//                 final isFav =
//                     favorites.favoriteProducts.containsKey(product.id);

//                 return ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFav,

//                   /// ❤️ Toggle favorite
//                   onFavorite: () {
//                     favorites.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   /// 🛒 Add to cart
//                   onAdd: () {
//                     cart.addToCart(product);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     /// Fetch products safely
//     Future.microtask(() {
//       // ignore: use_build_context_synchronously
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = context.watch<ProductProvider>().products;
//     final favorites = context.watch<FavoritesProvider>();
//     final cart = context.read<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 context.read<ProductProvider>().searchProducts(value);
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           context.read<ProductProvider>().searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: products.isEmpty
//           ? const Center(
//               child: Text('No products found'),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 /// ✅ Correct favorite check
//                 final isFav = favorites.favoriteProducts.containsKey(product.id);

//                 return ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFav,

//                   /// ❤️ Toggle favorite
//                   onFavorite: () {
//                     favorites.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   /// 🛒 Add to cart
//                   onAdd: () {
//                     cart.addToCart(product);
//                   },
//                     /// ❌ Remove from cart
//                      onRemove: () {
//                         cart.removeFromCartById(product.id); // Implement this method in CartProvider
//                       },
//                 );
//               },
//             ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     /// Fetch products safely
//     Future.microtask(() {
//       // ignore: use_build_context_synchronously
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = context.watch<ProductProvider>().products;
//     final favorites = context.watch<FavoritesProvider>();
//     final cart = context.read<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 context.read<ProductProvider>().searchProducts(value);
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           context.read<ProductProvider>().searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: products.isEmpty
//           ? const Center(
//               child: Text('No products found'),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 /// ✅ Correct favorite check
//                 final isFav = favorites.favoriteProducts.containsKey(product.id);

//                 return ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFav,

//                   /// ❤️ Toggle favorite
//                   onFavorite: () {
//                     favorites.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   /// 🛒 Add to cart
//                   onAdd: () {
//                     cart.addToCart(product);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }  

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     /// Fetch products safely
//     Future.microtask(() {
//       // ignore: use_build_context_synchronously
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = context.watch<ProductProvider>().products;
//     final favorites = context.watch<FavoritesProvider>();
//     final cart = context.read<CartProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 context.read<ProductProvider>().searchProducts(value);
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           context.read<ProductProvider>().searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: products.isEmpty
//           ? const Center(
//               child: Text('No products found'),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 /// ✅ Correct favorite check
//                 final isFav = favorites.favoriteProducts.containsKey(product.id);

//                 return ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFav,

//                   /// ❤️ Toggle favorite
//                   onFavorite: () {
//                     favorites.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   /// 🛒 Add to cart
//                   onAdd: () {
//                     cart.addToCart(product);
//                   },
//                     /// ❌ Remove from cart
//                          onRemove: () {
//                         cart.removeFromCartById(product.id); // Implement this method in CartProvider
//                       },
//                 );
//               },
//             ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Fetch products once safely
//     Future.microtask(() {
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover Shoes 👟'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: TextField(
//               controller: _searchController,
//               onChanged: productProvider.searchProducts,
//               decoration: InputDecoration(
//                 hintText: 'Search shoes...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           productProvider.searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),

//       // BODY
//       body: products.isEmpty
//           ? const Center(
//               child: Text(
//                 'No shoes found 👟',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 final isFavorite =
//                     favoritesProvider.favoriteProducts.containsKey(product.id);

//                 return ProductCard(
//                   productId: product.id.toString(),
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFavorite,

//                   // ❤️ Favorite
//                   onFavorite: () {
//                     favoritesProvider.toggleFavorite(
//                       productId: product.id.toString(),
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   // 🛒 Add to Cart
//                   onAdd: () {
//                     cartProvider.addToCart(product);

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Added to cart'),
//                         duration: Duration(milliseconds: 800),
//                       ),
//                     );
//                   },

//                   // ❌ Remove from Cart
//                   onRemove: () {
//                     cartProvider.removeFromCartById(product.id.toString());
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     /// ✅ Fetch products safely after build
//     Future.microtask(() {
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover Shoes 👟'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: TextField(
//               controller: _searchController,
//               onChanged: productProvider.searchProducts,
//               decoration: InputDecoration(
//                 hintText: 'Search shoes...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           productProvider.searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),

//       /// BODY
//       body: products.isEmpty
//           ? const Center(
//               child: Text(
//                 'No shoes found 👟',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey,
//                 ),
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 final isFavorite = favoritesProvider
//                     .favoriteProducts
//                     .containsKey(product.id.toString());

//                 return ProductCard(
//                   productId: product.id.toString(),
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFavorite,

//                   /// ❤️ Favorite
//                   onFavorite: () {
//                     favoritesProvider.toggleFavorite(
//                       productId: product.id.toString(),
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },

//                   /// 🛒 Add to Cart
//                   onAdd: () {
//                     cartProvider.addToCart(product);

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Added to cart'),
//                         duration: Duration(milliseconds: 800),
//                       ),
//                     );
//                   },

//                   /// ❌ Remove from Cart
//                   onRemove: () {
//                     cartProvider.removeFromCartById(
//                       product.id.toString(),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // Fetch products safely after build
//     Future.microtask(() {
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover Men\'s Shoes 👟'),
//         backgroundColor: Colors.pink,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: TextField(
//               controller: _searchController,
//               onChanged: productProvider.searchProducts,
//               decoration: InputDecoration(
//                 hintText: 'Search shoes...',
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           productProvider.searchProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Builder(
//         builder: (_) {
//           // Show loading indicator
//           if (productProvider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // Show error message
//           if (productProvider.error != null) {
//             return Center(
//               child: Text(
//                 productProvider.error!,
//                 style: const TextStyle(fontSize: 16, color: Colors.red),
//               ),
//             );
//           }

//           // Show "No shoes found" if list is empty
//           if (products.isEmpty) {
//             return const Center(
//               child: Text(
//                 'No shoes found 👟',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey,
//                 ),
//               ),
//             );
//           }

//           // Show list of shoes
//           return ListView.builder(
//             padding: const EdgeInsets.all(8),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];

//               final isFavorite = favoritesProvider.favoriteProducts
//                   .containsKey(product.id.toString());

//               return ProductCard(
//                 productId: product.id.toString(),
//                 title: product.name,
//                 image: product.image,
//                 price: product.price,
//                 isFavorite: isFavorite,

//                 /// ❤️ Favorite toggle
//                 onFavorite: () {
//                   favoritesProvider.toggleFavorite(
//                     productId: product.id.toString(),
//                     title: product.name,
//                     price: product.price,
//                     image: product.image,
//                   );
//                 },

//                 /// 🛒 Add to Cart
//                 onAdd: () {
//                   cartProvider.addToCart(product);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Added to cart'),
//                       duration: Duration(milliseconds: 800),
//                     ),
//                   );
//                 },

//                 /// ❌ Remove from Cart
//                 onRemove: () {
//                   cartProvider.removeFromCartById(product.id.toString());
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all'; // Track the active filter

//   @override
//   void initState() {
//     super.initState();
//     // Fetch all types of shoes (Men, Women, Kids) on startup
//     Future.microtask(() {
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110), // Increased height for chips
//           child: Column(
//             children: [
//               /// 🔍 Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                   ),
//                 ),
//               ),

//               /// 🏷️ Category Filter Chips
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 8),
//                     _buildFilterChip("Women Only", 'women', productProvider),
//                     const SizedBox(width: 8),
//                     _buildFilterChip("Men Only", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Builder(
//         builder: (_) {
//           if (productProvider.isLoading) {
//             return const Center(child: CircularProgressIndicator(color: Colors.pink));
//           }

//           if (productProvider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
//                   const SizedBox(height: 16),
//                   Text(productProvider.error!, style: const TextStyle(color: Colors.red)),
//                   TextButton(
//                     onPressed: () => productProvider.fetchProducts(),
//                     child: const Text("Try Again"),
//                   )
//                 ],
//               ),
//             );
//           }

//           if (products.isEmpty) {
//             return const Center(
//               child: Text('No shoes found in this category 👟'),
//             );
//           }

//           /// 👟 Product Grid Display
//           return GridView.builder(
//             padding: const EdgeInsets.all(12),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // 2 items per row
//               childAspectRatio: 0.75, // Adjust based on your ProductCard height
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               final isFavorite = favoritesProvider.favoriteProducts.containsKey(product.id);

//               return ProductCard(
//                 productId: product.id,
//                 title: product.name,
//                 image: product.image,
//                 price: product.price,
//                 isFavorite: isFavorite,
//                 onFavorite: () {
//                   favoritesProvider.toggleFavorite(
//                     productId: product.id,
//                     title: product.name,
//                     price: product.price,
//                     image: product.image,
//                   );
//                 },
//                 onAdd: () {
//                   cartProvider.addToCart(product);
//                   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('${product.name} added to cart'),
//                       duration: const Duration(milliseconds: 1000),
//                       backgroundColor: Colors.pinkAccent,
//                     ),
//                   );
//                 },
//                 onRemove: () {
//                   cartProvider.removeFromCartById(product.id);
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Helper widget to build the filter chips
//   Widget _buildFilterChip(String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';
// // import 'product_details_screen.dart'; // Uncomment when you create this file

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all'; 

//   @override
//   void initState() {
//     super.initState();
//     // Fetch products once when the app starts
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // watch allows the UI to rebuild when notifyListeners() is called in providers
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100], // Light background for better card contrast
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110), 
//           child: Column(
//             children: [
//               /// 🔍 Modern Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                   ),
//                 ),
//               ),

//               /// 🏷️ Category Selection (Filter Chips)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Builder(
//         builder: (context) {
//           if (productProvider.isLoading) {
//             return const Center(child: CircularProgressIndicator(color: Colors.pink));
//           }

//           if (productProvider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.cloud_off, size: 80, color: Colors.grey),
//                   const SizedBox(height: 16),
//                   Text(productProvider.error!, style: const TextStyle(fontSize: 16)),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () => productProvider.fetchProducts(),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                     child: const Text("Refresh", style: TextStyle(color: Colors.white)),
//                   )
//                 ],
//               ),
//             );
//           }

//           if (products.isEmpty) {
//             return const Center(
//               child: Text('No shoes found. Try another search! 👟', 
//                 style: TextStyle(fontSize: 16, color: Colors.grey)),
//             );
//           }

//           /// 👟 Shoe Grid
//           return GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, 
//               childAspectRatio: 0.72, // Optimized for the new ProductCard height
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               // Ensure ID is matched as a String
//               final isFavorite = favoritesProvider.favoriteProducts.containsKey(product.id);

//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to Details (Future Step)
//                   // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)));
//                 },
//                 child: ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFavorite,
//                   onFavorite: () {
//                     favoritesProvider.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },
//                   onAdd: () {
//                     cartProvider.addToCart(product);
//                     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${product.name} added to cart!'),
//                         duration: const Duration(seconds: 1),
//                         behavior: SnackBarBehavior.floating,
//                         backgroundColor: Colors.pinkAccent,
//                       ),
//                     );
//                   },
//                   onRemove: () {
//                     cartProvider.removeFromCartById(product.id);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Helper widget for styling ChoiceChips
//   Widget _buildFilterChip(String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       elevation: isSelected ? 2 : 0,
//       pressElevation: 4,
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shoe_shop/screens/product_detail_screen.dart';

// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';
// import '../widgets/product_card.dart';
// // ignore: duplicate_import
// import 'product_detail_screen.dart'; // Ensure this file exists

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     // Fetch shoes from the API immediately on load
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟', 
//           style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               /// 🔍 Search Bar Logic
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                   ),
//                 ),
//               ),

//               /// 🏷️ Category Filter Logic (Men/Women/All)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Builder(
//         builder: (context) {
//           if (productProvider.isLoading) {
//             return const Center(child: CircularProgressIndicator(color: Colors.pink));
//           }

//           if (productProvider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.cloud_off, size: 80, color: Colors.grey),
//                   const SizedBox(height: 16),
//                   Text(productProvider.error!, style: const TextStyle(fontSize: 16)),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () => productProvider.fetchProducts(),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                     child: const Text("Refresh", style: TextStyle(color: Colors.white)),
//                   )
//                 ],
//               ),
//             );
//           }

//           if (products.isEmpty) {
//             return const Center(
//               child: Text('No shoes found 👟', 
//                 style: TextStyle(fontSize: 16, color: Colors.grey)),
//             );
//           }

//           /// 👟 Shoe Grid with Navigation
//           return GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.72,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               final isFavorite = favoritesProvider.favoriteProducts.containsKey(product.id);

//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to the Details Page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProductDetailsScreen(product: product),
//                     ),
//                   );
//                 },
//                 child: ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFavorite,
//                   onFavorite: () {
//                     favoritesProvider.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },
//                   onAdd: () {
//                     cartProvider.addToCart(product);
//                     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${product.name} added to cart!'),
//                         duration: const Duration(seconds: 1),
//                         behavior: SnackBarBehavior.floating,
//                         backgroundColor: Colors.pinkAccent,
//                       ),
//                     );
//                   },
//                   onRemove: () {
//                     cartProvider.removeFromCartById(product.id);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Chip Widget for filtering
//   Widget _buildFilterChip(String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       elevation: isSelected ? 2 : 0,
//       pressElevation: 4,
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }




















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Providers
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'product_detail_screen.dart';
// import 'favorites_screen.dart'; // Make sure this file exists

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     // Fetch shoes from the API immediately on load
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // watch allows the UI to rebuild when notifyListeners() is called in providers
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟', 
//           style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           // ❤️ Favorite Button
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//               );
//             },
//           ),
//           // 🛒 Cart Button (Bonus: good for UX)
//           IconButton(
//             icon: const Icon(Icons.shopping_bag),
//             onPressed: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
//             },
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               /// 🔍 Modern Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                   ),
//                 ),
//               ),

//               /// 🏷️ Category Selection (Filter Chips)
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Builder(
//         builder: (context) {
//           if (productProvider.isLoading) {
//             return const Center(child: CircularProgressIndicator(color: Colors.pink));
//           }

//           if (productProvider.error != null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.cloud_off, size: 80, color: Colors.grey),
//                   const SizedBox(height: 16),
//                   Text(productProvider.error!, style: const TextStyle(fontSize: 16)),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () => productProvider.fetchProducts(),
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                     child: const Text("Refresh", style: TextStyle(color: Colors.white)),
//                   )
//                 ],
//               ),
//             );
//           }

//           if (products.isEmpty) {
//             return const Center(
//               child: Text('No shoes found. Try another search! 👟', 
//                 style: TextStyle(fontSize: 16, color: Colors.grey)),
//             );
//           }

//           /// 👟 Shoe Grid
//           return GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, 
//               childAspectRatio: 0.72, 
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               final isFavorite = favoritesProvider.favoriteProducts.containsKey(product.id);

//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProductDetailsScreen(product: product),
//                     ),
//                   );
//                 },
//                 child: ProductCard(
//                   productId: product.id,
//                   title: product.name,
//                   image: product.image,
//                   price: product.price,
//                   isFavorite: isFavorite,
//                   onFavorite: () {
//                     favoritesProvider.toggleFavorite(
//                       productId: product.id,
//                       title: product.name,
//                       price: product.price,
//                       image: product.image,
//                     );
//                   },
//                   onAdd: () {
//                     cartProvider.addToCart(product);
//                     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${product.name} added to cart!'),
//                         duration: const Duration(seconds: 1),
//                         behavior: SnackBarBehavior.floating,
//                         backgroundColor: Colors.pinkAccent,
//                       ),
//                     );
//                   },
//                   onRemove: () {
//                     cartProvider.removeFromCartById(product.id);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Helper widget for styling ChoiceChips
//   Widget _buildFilterChip(String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       elevation: isSelected ? 2 : 0,
//       pressElevation: 4,
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Providers
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'product_detail_screen.dart';
// import 'favorites_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//             ),
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               // 🔍 Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ),
//               ),
//               // 🏷️ Category Selection
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: productProvider.isLoading && products.isEmpty
//           ? const Center(child: CircularProgressIndicator(color: Colors.pink))
//           : RefreshIndicator(
//               onRefresh: () => productProvider.fetchProducts(isRefresh: true),
//               child: SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 child: Column(
//                   children: [
//                     // 👟 Shoe Grid
//                     if (products.isEmpty)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 50),
//                         child: Text('No shoes found. Try another search! 👟'),
//                       )
//                     else
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         padding: const EdgeInsets.all(16),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 0.72,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: products.length,
//                         itemBuilder: (context, index) {
//                           final product = products[index];
//                           final isFav = favoritesProvider.favoriteProducts.containsKey(product.id);

//                           return ProductCard(
//                             productId: product.id,
//                             title: product.name,
//                             image: product.image,
//                             price: product.price,
//                             isFavorite: isFav,
//                             onFavorite: () => favoritesProvider.toggleFavorite(
//                               productId: product.id,
//                               title: product.name,
//                               price: product.price,
//                               image: product.image,
//                             ),
//                             onAdd: () {
//                               cartProvider.addToCart(product);
//                               _showSnackBar(context, product.name);
//                             },
//                           );
//                         },
//                       ),

//                     // 🔄 Load More Button
//                     if (products.isNotEmpty && _selectedFilter == 'all')
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         child: productProvider.isFetchingMore
//                             ? const CircularProgressIndicator(color: Colors.pink)
//                             : ElevatedButton(
//                                 onPressed: () => productProvider.fetchProducts(isRefresh: false),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.pink,
//                                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                                 ),
//                                 child: const Text("Load More Shoes", style: TextStyle(color: Colors.white)),
//                               ),
//                       ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   void _showSnackBar(BuildContext context, String name) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$name added to cart!'),
//         duration: const Duration(seconds: 1),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.pinkAccent,
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Providers
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'product_detail_screen.dart';
// import 'favorites_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();
//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Footwear Gallery 👟',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const FavoritesScreen()),
//             ),
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               // 🔍 Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ),
//               ),
//               // 🏷️ Category Selection
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _buildFilterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: productProvider.isLoading && products.isEmpty
//           ? const Center(child: CircularProgressIndicator(color: Colors.pink))
//           : RefreshIndicator(
//               onRefresh: () => productProvider.fetchProducts(isRefresh: true),
//               child: SingleChildScrollView(
//                 // 🚀 BouncingScrollPhysics makes the "Load More" button feel more responsive
//                 physics: const BouncingScrollPhysics(
//                     parent: AlwaysScrollableScrollPhysics()),
//                 child: Column(
//                   children: [
//                     // 👟 Shoe Grid
//                     if (products.isEmpty)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 50),
//                         child: Text('No shoes found. Try another search! 👟'),
//                       )
//                     else
//                       GridView.builder(
//                         shrinkWrap: true, // 👈 Required inside SingleChildScrollView
//                         physics:
//                             const NeverScrollableScrollPhysics(), // 👈 Disable internal scroll
//                         padding: const EdgeInsets.all(16),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 0.72,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: products.length,
//                         itemBuilder: (context, index) {
//                           final product = products[index];
//                           final isFav = favoritesProvider.favoriteProducts
//                               .containsKey(product.id);

//                           return ProductCard(
//                             productId: product.id,
//                             title: product.name,
//                             image: product.image,
//                             price: product.price,
//                             isFavorite: isFav,
//                             onFavorite: () => favoritesProvider.toggleFavorite(
//                               productId: product.id,
//                               title: product.name,
//                               price: product.price,
//                               image: product.image,
//                             ),
//                             onAdd: () {
//                               cartProvider.addToCart(product);
//                               _showSnackBar(context, product.name);
//                             },
//                           );
//                         },
//                       ),

//                     // 🔄 Load More Button
//                     if (products.isNotEmpty && _selectedFilter == 'all')
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 30),
//                         child: productProvider.isFetchingMore
//                             ? const CircularProgressIndicator(color: Colors.pink)
//                             : ElevatedButton(
//                                 onPressed: () {
//                                   debugPrint("Button Clicked: Loading more...");
//                                   productProvider.fetchProducts(
//                                       isRefresh: false);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.pink,
//                                   foregroundColor: Colors.white,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 40, vertical: 15),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   elevation: 5,
//                                 ),
//                                 child: const Text("Load More Shoes",
//                                     style: TextStyle(fontSize: 16)),
//                               ),
//                       ),
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   void _showSnackBar(BuildContext context, String name) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$name added to cart!'),
//         duration: const Duration(seconds: 1),
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.pinkAccent,
//       ),
//     );
//   }

//   Widget _buildFilterChip(
//       String label, String value, ProductProvider provider) {
//     final bool isSelected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.pink : Colors.white,
//         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() => _selectedFilter = value);
//           provider.filterProducts(value);
//         }
//       },
//     );
//   }
// }

































// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// // Providers
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'favorites_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       if (mounted) {
//         context.read<ProductProvider>().fetchProducts();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   // ================= LOGOUT =================
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();
//     final products = productProvider.products;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text(
//           'Footwear Gallery 👟',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           // ❤️ Favorites
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const FavoritesScreen()),
//             ),
//           ),

//           // 🚪 Logout
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               // 🔍 Search
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//               ),

//               // 🏷️ Filters
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding:
//                     const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _filterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _filterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _filterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       body: productProvider.isLoading && products.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(color: Colors.pink),
//             )
//           : RefreshIndicator(
//               onRefresh: () => productProvider.fetchProducts(isRefresh: true),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics(),
//                 ),
//                 child: Column(
//                   children: [
//                     if (products.isEmpty)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 50),
//                         child: Text('No shoes found 👟'),
//                       )
//                     else
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         padding: const EdgeInsets.all(16),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 0.72,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                         ),
//                         itemCount: products.length,
//                         itemBuilder: (context, index) {
//                           final product = products[index];
//                           final isFav = favoritesProvider.favoriteProducts
//                               .containsKey(product.id);

//                           return ProductCard(
//                             productId: product.id,
//                             title: product.name,
//                             image: product.image,
//                             price: product.price,
//                             isFavorite: isFav,
//                             onFavorite: () =>
//                                 favoritesProvider.toggleFavorite(
//                               productId: product.id,
//                               title: product.name,
//                               price: product.price,
//                               image: product.image,
//                             ),
//                             onAdd: () {
//                               cartProvider.addToCart(product);
//                               _snack(context, product.name);
//                             },
//                           );
//                         },
//                       ),

//                     // 🔄 Load more
//                     if (products.isNotEmpty && _selectedFilter == 'all')
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 30),
//                         child: productProvider.isFetchingMore
//                             ? const CircularProgressIndicator(
//                                 color: Colors.pink,
//                               )
//                             : ElevatedButton(
//                                 onPressed: () =>
//                                     productProvider.fetchProducts(),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.pink,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 40, vertical: 15),
//                                 ),
//                                 child: const Text("Load More Shoes"),
//                               ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _filterChip(
//       String label, String value, ProductProvider provider) {
//     final selected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: selected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: selected ? Colors.pink : Colors.white,
//         fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (_) {
//         setState(() => _selectedFilter = value);
//         provider.filterProducts(value);
//       },
//     );
//   }

//   void _snack(BuildContext context, String name) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$name added to cart'),
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.pinkAccent,
//       ),
//     );
//   }
// }





















import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Providers
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';

// Widgets & Screens
import '../widgets/product_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ProductProvider>().fetchProducts();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ================= LOGOUT =================
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final favoritesProvider = context.watch<FavoritesProvider>();
    final cartProvider = context.read<CartProvider>();
    final products = productProvider.products;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Footwear Gallery 👟',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // ❤️ Favorites
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoritesScreen()),
            ),
          ),

          // 🚪 Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            children: [
              // 🔍 Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: productProvider.searchProducts,
                  decoration: InputDecoration(
                    hintText: 'Search sneakers, heels, boots...',
                    prefixIcon: const Icon(Icons.search, color: Colors.pink),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              productProvider.searchProducts('');
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),

              // 🏷️ Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: Row(
                  children: [
                    _filterChip("All Shoes", 'all', productProvider),
                    const SizedBox(width: 10),
                    _filterChip("Women", 'women', productProvider),
                    const SizedBox(width: 10),
                    _filterChip("Men", 'men', productProvider),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: productProvider.isLoading && products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: Colors.pink),
            )
          : RefreshIndicator(
              onRefresh: () => productProvider.fetchProducts(isRefresh: true),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  children: [
                    if (products.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('No shoes found 👟'),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final isFav = favoritesProvider.favoriteProducts.containsKey(product.id);

                          return ProductCard(
                            productId: product.id,
                            title: product.name,
                            image: product.image,
                            price: product.price,
                            isFavorite: isFav,
                            onFavorite: () => favoritesProvider.toggleFavorite(
                              productId: product.id,
                              title: product.name,
                              price: product.price,
                              image: product.image,
                            ),
                            onAdd: () {
                              cartProvider.addToCart(product);
                              _snack(context, product.name);
                            },
                          );
                        },
                      ),

                    // 🔄 Load More Button
                    if (products.isNotEmpty && _selectedFilter == 'all')
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                          onPressed: productProvider.isFetchingMore || !productProvider.hasMore
                              ? null
                              : () => productProvider.fetchProducts(isRefresh: false),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                          child: productProvider.isFetchingMore
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(productProvider.hasMore ? "Load More Shoes" : "No More Shoes"),
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _filterChip(String label, String value, ProductProvider provider) {
    final selected = _selectedFilter == value;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      selectedColor: Colors.white,
      backgroundColor: Colors.pink[300],
      labelStyle: TextStyle(
        color: selected ? Colors.pink : Colors.white,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
      onSelected: (_) {
        setState(() => _selectedFilter = value);
        provider.filterProducts(value);
      },
    );
  }

  void _snack(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name added to cart'),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // Providers
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'favorites_screen.dart';
// import '../models/product.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   // ================= LOGOUT =================
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text(
//           'Footwear Gallery 👟',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           // ❤️ Favorites
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const FavoritesScreen()),
//             ),
//           ),
//           // 🚪 Logout
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(110),
//           child: Column(
//             children: [
//               // 🔍 Search
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: (value) {
//                     // Real-time search filtering
//                     setState(() {}); 
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon: const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               setState(() {});
//                             },
//                           )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//               ),
//               // 🏷️ Filters
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _filterChip("All Shoes", 'all'),
//                     const SizedBox(width: 10),
//                     _filterChip("Women", 'women'),
//                     const SizedBox(width: 10),
//                     _filterChip("Men", 'men'),
//                     const SizedBox(width: 10),
//                     _filterChip("Baseball", 'baseball'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Firestore auto-refreshes with StreamBuilder
//         },
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('products')
//               .orderBy('name')
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator(color: Colors.pink));
//             }
            
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(50),
//                   child: Text('No shoes available 👟\nAdd products in Firestore!'),
//                 ),
//               );
//             }

//             // ✅ Filter & Search Logic
//             final allProducts = snapshot.data!.docs
//                 .map((doc) => Product.fromFirestore(doc))
//                 .where((product) {
//                   // Search filter
//                   final matchesSearch = _searchController.text.isEmpty ||
//                       product.name.toLowerCase().contains(
//                             _searchController.text.toLowerCase());
                  
//                   // Category filter
//                   final matchesCategory = _selectedFilter == 'all' ||
//                       product.category.toLowerCase() == _selectedFilter;
                  
//                   return matchesSearch && matchesCategory;
//                 })
//                 .toList();

//             if (allProducts.isEmpty) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(50),
//                   child: Text('No matching shoes found 👟'),
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               physics: const BouncingScrollPhysics(
//                 parent: AlwaysScrollableScrollPhysics(),
//               ),
//               child: Column(
//                 children: [
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     padding: const EdgeInsets.all(16),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.72,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: allProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = allProducts[index];
//                       final isFav = favoritesProvider.favoriteProducts.containsKey(product.id);

//                       return ProductCard(
//                         productId: product.id,
//                         title: product.name,
//                         image: product.image,
//                         price: product.price,
//                         isFavorite: isFav,
//                         onFavorite: () => favoritesProvider.toggleFavorite(
//                           productId: product.id,
//                           title: product.name,
//                           price: product.price,
//                           image: product.image,
//                         ),
//                         onAdd: () {
//                           cartProvider.addToCart(product);
//                           _snack(context, product.name);
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _filterChip(String label, String value) {
//     final selected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: selected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: selected ? Colors.pink : Colors.white,
//         fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (_) {
//         setState(() => _selectedFilter = value);
//       },
//     );
//   }

//   void _snack(BuildContext context, String name) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$name added to cart ✅'),
//         // duration: const Duration(seconds: 1.5),
//         duration: const Duration(milliseconds: 1500),

//         backgroundColor: Colors.pink[600],
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // Providers
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';
// import '../providers/favorites_provider.dart';

// // Widgets & Screens
// import '../widgets/product_card.dart';
// import 'favorites_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       context.read<ProductProvider>().fetchProducts();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   // 🚪 Logout
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = context.watch<ProductProvider>();
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();
//     final products = productProvider.products;
//     final user = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],

//       // ================= APP BAR =================
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Footwear Gallery 👟',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const FavoritesScreen()),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(150),
//           child: Column(
//             children: [
//               // 👋 Welcome from Firestore
//               if (user != null)
//                 FutureBuilder<DocumentSnapshot>(
//                   future: FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(user.uid)
//                       .get(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData || !snapshot.data!.exists) {
//                       return const SizedBox();
//                     }
//                     final data =
//                         snapshot.data!.data() as Map<String, dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 8),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Welcome, ${data['email']} 👋",
//                           style: const TextStyle(
//                               color: Colors.white70, fontSize: 14),
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//               // 🔍 Search
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: productProvider.searchProducts,
//                   decoration: InputDecoration(
//                     hintText: 'Search sneakers, heels, boots...',
//                     prefixIcon:
//                         const Icon(Icons.search, color: Colors.pink),
//                     suffixIcon: _searchController.text.isNotEmpty
//                         ? IconButton(
//                             icon: const Icon(Icons.clear),
//                             onPressed: () {
//                               _searchController.clear();
//                               productProvider.searchProducts('');
//                             },
//                           )
//                         : null,
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),

//               // 🏷️ Filters
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 padding:
//                     const EdgeInsets.only(left: 16, right: 16, bottom: 12),
//                 child: Row(
//                   children: [
//                     _filterChip("All Shoes", 'all', productProvider),
//                     const SizedBox(width: 10),
//                     _filterChip("Women", 'women', productProvider),
//                     const SizedBox(width: 10),
//                     _filterChip("Men", 'men', productProvider),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // ================= BODY =================
//       body: productProvider.isLoading && products.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(color: Colors.pink),
//             )
//           : RefreshIndicator(
//               onRefresh: () =>
//                   productProvider.fetchProducts(isRefresh: true),
//               child: products.isEmpty
//                   ? const Center(child: Text('No shoes found 👟'))
//                   : GridView.builder(
//                       padding: const EdgeInsets.all(16),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.72,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 16,
//                       ),
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         final product = products[index];
//                         final isFav = favoritesProvider
//                             .favoriteProducts
//                             .containsKey(product.id);

//                         return ProductCard(
//                           productId: product.id,
//                           title: product.name,
//                           image: product.image,
//                           price: product.price,
//                           isFavorite: isFav,
//                           onFavorite: () =>
//                               favoritesProvider.toggleFavorite(
//                             productId: product.id,
//                             title: product.name,
//                             price: product.price,
//                             image: product.image,
//                           ),
//                           onAdd: () {
//                             cartProvider.addToCart(product);
//                             _snack(context, product.name);
//                           },
//                         );
//                       },
//                     ),
//             ),
//     );
//   }

//   // ================= HELPERS =================
//   Widget _filterChip(
//       String label, String value, ProductProvider provider) {
//     final selected = _selectedFilter == value;
//     return ChoiceChip(
//       label: Text(label),
//       selected: selected,
//       selectedColor: Colors.white,
//       backgroundColor: Colors.pink[300],
//       labelStyle: TextStyle(
//         color: selected ? Colors.pink : Colors.white,
//         fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       ),
//       onSelected: (_) {
//         setState(() => _selectedFilter = value);
//         provider.filterProducts(value);
//       },
//     );
//   }

//   void _snack(BuildContext context, String name) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$name added to cart'),
//         duration: const Duration(seconds: 1),
//         backgroundColor: Colors.pinkAccent,
//       ),
//     );
//   }
// }

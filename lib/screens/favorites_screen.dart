// import 'package:flutter/material.dart' show BuildContext, Center, Scaffold, StatelessWidget, Text, TextStyle, Widget;

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Favorites',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/favorites_provider.dart';
// import '../providers/cart_provider.dart';
// import '../widgets/product_card.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final favorites = context.watch<FavoritesProvider>();
//     final cart = context.read<CartProvider>();

//     final favoriteProducts = favorites.favoriteProducts.values.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorites'),
//         backgroundColor: Colors.pink,
//       ),
//       body: favoriteProducts.isEmpty
//           ? const Center(
//               child: Text(
//                 'No favorites yet',
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: favoriteProducts.length,
//               itemBuilder: (_, index) {
//                 final product = favoriteProducts[index];
//                 final isFav = true; // already favorite

//                 return ProductCard(
//                   productId: product['id'],
//                   title: product['title'],
//                   image: product['image'],
//                   price: product['price'],
//                   isFavorite: isFav,
//                   onFavorite: () {
//                     debugPrint('Favorite clicked: ${product['id']}');
//                     favorites.toggleFavorite(
//                       productId: product['id'],
//                       title: product['title'],
//                       price: product['price'],
//                       image: product['image'],
//                     );
//                   },
//                   onAdd: () {
//                     cart.addToCartFromFavorites(product);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/favorites_provider.dart';
// import '../providers/cart_provider.dart';
// import '../widgets/product_card.dart';
// import 'product_detail_screen.dart';
// import '../models/product.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // watch listens for changes so the list updates when an item is un-favorited
//     final favoritesProvider = context.watch<FavoritesProvider>();
//     final cartProvider = context.read<CartProvider>();

//     // Converting the values of our favorites map into a list
//     final favoriteProducts = favoritesProvider.favoriteProducts.values.toList();

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('My Wishlist ❤️', 
//           style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: favoriteProducts.isEmpty
//           ? _buildEmptyState()
//           : GridView.builder(
//               padding: const EdgeInsets.all(16),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.72, // Matches the HomeScreen ratio
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: favoriteProducts.length,
//               itemBuilder: (context, index) {
//                 final raw = favoriteProducts[index];
//                 // Convert map to Product if needed, otherwise assume it's already a Product
//                 final product = raw is Map<String, dynamic>
//                     ? Product(
//                         id: raw['id'],
//                         name: raw['name'],
//                         image: raw['image'],
//                         price: raw['price'], description: '', category: '',
//                       )
//                     : raw as Product;

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailsScreen(product: product),
//                       ),
//                     );
//                   },
//                   child: ProductCard(
//                     productId: product.id,
//                     title: product.name,
//                     image: product.image,
//                     price: product.price,
//                     isFavorite: true, // They are in this list, so they are favorites
//                     onFavorite: () {
//                       favoritesProvider.toggleFavorite(
//                         productId: product.id,
//                         title: product.name,
//                         price: product.price,
//                         image: product.image,
//                       );
//                     },
//                     onAdd: () {
//                       cartProvider.addToCart(product);
//                       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('${product.name} added to cart!'),
//                           duration: const Duration(seconds: 1),
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: Colors.pinkAccent,
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }

//   /// Visual state shown when no favorites exist
//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
//           const SizedBox(height: 16),
//           const Text(
//             'No favorites yet',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Start liking shoes to see them here! 👟',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import 'package:shoe_shop/models/product.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We use watch to ensure the UI rebuilds if an item is removed
    final favoritesProvider = context.watch<FavoritesProvider>();
    final cartProvider = context.read<CartProvider>();

    // Convert the values in the favorites map to a list of Product objects
    final favoriteProducts = favoritesProvider.favoriteProducts.values.toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Wishlist ❤️', 
          style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: favoriteProducts.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72, 
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final raw = favoriteProducts[index];
                // If the stored favorite is a Map, convert it to a Product instance.
                final product = raw is Map<String, dynamic>
                    ? Product(
                        id: raw['id'],
                        name: raw['name'] ?? raw['title'] ?? '',
                        image: raw['image'],
                        price: raw['price'],
                        description: raw['description'] ?? '',
                        category: raw['category'] ?? '',
                      )
                    : raw as Product;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    // Accessing properties directly from the object to avoid Null errors
                    productId: product.id,
                    title: product.name,
                    image: product.image,
                    price: product.price,
                    isFavorite: true, 
                    onFavorite: () {
                      favoritesProvider.toggleFavorite(
                        productId: product.id,
                        title: product.name,
                        price: product.price,
                        image: product.image,
                      );
                    },
                    onAdd: () {
                      cartProvider.addToCart(product);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart!'),
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text('Your wishlist is empty!', 
            style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}
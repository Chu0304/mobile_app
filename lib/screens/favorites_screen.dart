
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
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'favorite_button.dart';
// do ur task here

class ProductCard extends StatelessWidget {
  final String productId;
  final String title;
  final String image;
  final double price;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;

  const ProductCard({
    super.key,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.onFavorite,
    required this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0), // Removed margin to fit better in GridView
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 🖼️ Product Image with Hero Animation and Caching
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Hero(
                tag: productId, // Important: Matches tag in ProductDetailsScreen
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // 🌀 Loading Placeholder
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  // ⚠️ Error Placeholder
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),

          // 📝 Product Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.pink, 
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),

          // 🔘 Action Buttons: Favorite + Add + Remove
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavoriteButton(isFavorite: isFavorite, onTap: onFavorite),
                Row(
                  children: [
                    // Add Button
                    _buildIconButton(
                      icon: Icons.add_shopping_cart,
                      color: Colors.pink,
                      onTap: onAdd,
                    ),
                    if (onRemove != null) ...[
                      const SizedBox(width: 4),
                      // Remove Button
                      _buildIconButton(
                        icon: Icons.remove_shopping_cart,
                        color: Colors.red,
                        onTap: onRemove!,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper to create consistent small action buttons
  Widget _buildIconButton({
    required IconData icon, 
    required Color color, 
    required VoidCallback onTap
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

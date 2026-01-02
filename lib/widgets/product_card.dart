// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shoe_shop/models/product.dart';

// //import 'package:shoe_shop/models/product_model.dart';
// import '../constants/app_colors.dart';
// import '../providers/product_provider.dart';
// import '../providers/cart_provider.dart';

// class ProductCard extends StatelessWidget {
//   final ProductModel product;

//   const ProductCard({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = context.read<CartProvider>();
//     final favoriteProvider = context.watch<FavoriteProvider>();

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           // 🖼 Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),
//             child: Image.network(
//               product.image,
//               height: 140,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) =>
//                   const Icon(Icons.image_not_supported),
//             ),
//           ),

//           // 📦 Product Info
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 // ❤️ Favorite + Name
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         product.name,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         favoriteProvider.isFavorite(product)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         color: AppColors.primary,
//                         size: 20,
//                       ),
//                       onPressed: () {
//                         favoriteProvider.toggle(product);
//                       },
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 6),

//                 // 💰 Price
//                 Text(
//                   '\$${product.price.toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 // 🛒 Add to Cart Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primary,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                     ),
//                     onPressed: () {
//                       cartProvider.add(product);

//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Added to cart'),
//                           duration: Duration(milliseconds: 800),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Add to Cart',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../widgets/favorite_button.dart';

// class ProductCard extends StatelessWidget {
//   final String productId;
//   final String title;
//   final String image;
//   final double price;
//   final bool isFavorite;
//   final VoidCallback onFavorite;
//   final VoidCallback onAdd;

//   const ProductCard({
//     super.key,
//     required this.productId,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.isFavorite,
//     required this.onFavorite,
//     required this.onAdd,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 3,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.network(
//               image,
//               height: 160,
//               fit: BoxFit.cover,
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Product Title
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),

//           const SizedBox(height: 4),

//           // Product Price
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               '\$${price.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Buttons: Favorite + Add to Cart
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Animated Favorite Button
//                 FavoriteButton(
//                   isFavorite: isFavorite,
//                   onTap: onFavorite,
//                 ),

//                 // Add to Cart Button
//                 ElevatedButton(
//                   onPressed: onAdd,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   ),
//                   child: const Icon(Icons.shopping_cart, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 12),
//         ],
//       ),
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// import 'favorite_button.dart';

// class ProductCard extends StatelessWidget {
//   final String productId;
//   final String title;
//   final String image;
//   final double price;
//   final bool isFavorite;
//   final VoidCallback onFavorite;
//   final VoidCallback onAdd;

//   const ProductCard({
//     super.key,
//     required this.productId,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.isFavorite,
//     required this.onFavorite,
//     required this.onAdd,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: SizedBox(
//               height: 300,
//               width: 100,
//                // smaller height for compact layout
//               child: Image.network(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Product Name
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Text(
//               title,
//               style: const TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),

//           // Product Price
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               '\$${price.toStringAsFixed(2)}',
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ),

//           // Buttons: Favorite + Add to Cart
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 FavoriteButton(isFavorite: isFavorite, onTap: onFavorite),
//                 ElevatedButton(
//                   onPressed: onAdd,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 8),
//                   ),
//                   child: const Icon(Icons.shopping_cart, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'favorite_button.dart';

// class ProductCard extends StatelessWidget {
//   final String productId;
//   final String title;
//   final String image;
//   final double price;
//   final bool isFavorite;
//   final VoidCallback onFavorite;
//   final VoidCallback onAdd;
//   final VoidCallback? onRemove; // Optional remove callback

//   const ProductCard({
//     super.key,
//     required this.productId,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.isFavorite,
//     required this.onFavorite,
//     required this.onAdd,
//     this.onRemove, // Add this parameter
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: SizedBox(
//               height: 300,
//               width: 100,
//               child: Image.network(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Product Name
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Text(
//               title,
//               style: const TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),

//           // Product Price
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               '\$${price.toStringAsFixed(2)}',
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ),

//           // Buttons: Favorite + Add to Cart + Remove from Cart
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 FavoriteButton(isFavorite: isFavorite, onTap: onFavorite),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: onAdd,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 8),
//                       ),
//                       child:
//                           const Icon(Icons.add_shopping_cart, color: Colors.white),
//                     ),
//                     if (onRemove != null) ...[
//                       const SizedBox(width: 8),
//                       ElevatedButton(
//                         onPressed: onRemove,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                         ),
//                         child: const Icon(Icons.remove_shopping_cart,
//                             color: Colors.white),
//                       ),
//                     ]
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'favorite_button.dart';

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









// import 'package:flutter/material.dart';
// import '../widgets/favorite_button.dart';

// class ProductCard extends StatelessWidget {
//   final String productId;
//   final String title;
//   final String image;
//   final double price;
//   final bool isFavorite;
//   final VoidCallback onFavorite;
//   final VoidCallback onAdd;

//   const ProductCard({
//     super.key,
//     required this.productId,
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.isFavorite,
//     required this.onFavorite,
//     required this.onAdd,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.network(
//               image,
//               height: 160,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Text(
//               title,
//               style: const TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text('\$${price.toStringAsFixed(2)}',
//                 style: const TextStyle(color: Colors.grey)),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 FavoriteButton(isFavorite: isFavorite, onTap: onFavorite),
//                 ElevatedButton(
//                   onPressed: onAdd,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 8),
//                   ),
//                   child: const Icon(Icons.shopping_cart, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
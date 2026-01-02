// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';

// class ProductDetailsScreen extends StatelessWidget {
//   final Product product;

//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // 1. Content Area
//           CustomScrollView(
//             slivers: [
//               // High-quality Hero Image Header
//               SliverAppBar(
//                 expandedHeight: 400,
//                 pinned: true,
//                 backgroundColor: Colors.white,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Hero(
//                     tag: product.id, // Animation syncs with Home Screen
//                     child: CachedNetworkImage(
//                       imageUrl: product.image,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => Container(color: Colors.grey[200]),
//                       errorWidget: (context, url, error) => const Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//               ),

//               // Product Info Section
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               product.name,
//                               style: const TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             '\$${product.price.toStringAsFixed(2)}',
//                             style: const TextStyle(
//                               fontSize: 22,
//                               color: Colors.pink,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         "Description",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         product.description,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[700],
//                           height: 1.5,
//                         ),
//                       ),
//                       const SizedBox(height: 100), // Space for bottom button
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // 2. Back Button
//           Positioned(
//             top: 40,
//             left: 20,
//             child: CircleAvatar(
//               backgroundColor: Colors.white.withOpacity(0.9),
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ),

//           // 3. Floating Add to Cart Button
//           Positioned(
//             bottom: 30,
//             left: 20,
//             right: 20,
//             child: SizedBox(
//               height: 60,
//               child: ElevatedButton(
//                 onPressed: () {
//                   context.read<CartProvider>().addToCart(product);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Added to bag!')),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text(
//                   "ADD TO CART",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';

// class ProductDetailsScreen extends StatelessWidget {
//   final Product product;

//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // ✨ Hero Image with Proper SliverAppBar
//           SliverAppBar(
//             expandedHeight: 420,
//             pinned: true,
//             floating: false,
//             snap: false,
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.favorite_border, color: Colors.pink),
//                 onPressed: () {}, // Add to wishlist
//               ),
//               const SizedBox(width: 16),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: Hero(
//                 tag: product.id,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: product.image,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey[100],
//                         child: const Center(
//                           child: CircularProgressIndicator(color: Colors.pink),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey[200],
//                         child: const Icon(Icons.image_not_supported, size: 80),
//                       ),
//                     ),
//                     // Gradient overlay for text readability
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.3),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ✨ Product Info Section
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name & Price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           product.name,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.grey[900],
//                             height: 1.2,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.pink[50],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           '\$${product.price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.pink[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // ⭐ Rating (Real app feature)
//                   Row(
//                     children: [
//                       ...List.generate(5, (index) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                         size: 20,
//                       )),
//                       const SizedBox(width: 8),
//                       Text(
//                         '4.8 (127)',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // 📦 Size Selection (Real shoe app)
//                   const Text(
//                     'Size',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: const [
//                         _SizeChip(label: 'US 7'),
//                         SizedBox(width: 12),
//                         _SizeChip(label: 'US 8', isSelected: true),
//                         SizedBox(width: 12),
//                         _SizeChip(label: 'US 9'),
//                         SizedBox(width: 12),
//                         _SizeChip(label: 'US 10'),
//                         SizedBox(width: 12),
//                         _SizeChip(label: 'US 11'),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 📝 Description
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     product.description.isEmpty 
//                         ? 'Premium Nike baseball cleats with superior grip, lightweight design, and breathable mesh upper for maximum performance on the field.'
//                         : product.description,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[700],
//                       height: 1.6,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 🛒 Add to Cart Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 60,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         context.read<CartProvider>().addToCart(product);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: const Text('✅ Added to bag!'),
//                             backgroundColor: Colors.pink[600],
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink[600],
//                         foregroundColor: Colors.white,
//                         elevation: 0,
//                         shadowColor: Colors.pink[300],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: const Text(
//                         'ADD TO BAG',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ✨ Size Chip Widget
// class _SizeChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;

//   const _SizeChip({required this.label, this.isSelected = false});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {}, // Add size selection logic
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink[600] : Colors.grey[100],
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(
//             color: isSelected ? Colors.pink[600]! : Colors.grey[300]!,
//             width: 1.5,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: isSelected ? Colors.white : Colors.grey[800],
//           ),
//         ),
//       ),
//     );
//   }
// }




























// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Product product;
//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   int selectedSizeIndex = 1; // US 8 selected by default

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // ✨ Hero Image with Proper SliverAppBar
//           SliverAppBar(
//             expandedHeight: 420,
//             pinned: true,
//             floating: false,
//             snap: false,
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.favorite_border, color: Colors.pink),
//                 onPressed: () {}, // Add to wishlist
//               ),
//               const SizedBox(width: 16),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: Hero(
//                 tag: widget.product.id,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: widget.product.image,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey[100],
//                         child: const Center(
//                           child: CircularProgressIndicator(color: Colors.pink),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey[200],
//                         child: const Icon(Icons.image_not_supported, size: 80),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.3),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ✨ Product Info Section
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name & Price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.product.name,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.grey[900],
//                             height: 1.2,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.pink[50],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           '\$${widget.product.price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.pink[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // ⭐ Rating
//                   Row(
//                     children: [
//                       ...List.generate(5, (index) => Icon(
//                         index < 4 ? Icons.star : Icons.star_border,
//                         color: Colors.amber,
//                         size: 20,
//                       )),
//                       const SizedBox(width: 8),
//                       Text(
//                         '4.8 (127)',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // 📦 Size Selection (Now Interactive!)
//                   const Text(
//                     'Size',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(5, (index) {
//                         final sizes = ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'];
//                         return Row(
//                           children: [
//                             _SizeChip(
//                               label: sizes[index],
//                               isSelected: selectedSizeIndex == index,
//                               onTap: () => setState(() => selectedSizeIndex = index),
//                             ),
//                             if (index < 4) const SizedBox(width: 12),
//                           ],
//                         );
//                       }),
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 📝 Description (Firestore data - NO FALLBACK!)
//                   const Text(
//                     'Description',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     widget.product.description, // ✅ Pure Firestore data!
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[700],
//                       height: 1.6,
//                       letterSpacing: 0.3,
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 🛒 Add to Cart Button (with size)
//                   SizedBox(
//                     width: double.infinity,
//                     height: 60,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Add size to cart logic
//                         final selectedSize = ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'][selectedSizeIndex];
//                         context.read<CartProvider>().addToCart(widget.product);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('✅ Added ${widget.product.name} (Size $selectedSize) to bag!'),
//                             backgroundColor: Colors.pink[600],
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink[600],
//                         foregroundColor: Colors.white,
//                         elevation: 0,
//                         shadowColor: Colors.pink[300],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: const Text(
//                         'ADD TO BAG',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ✨ Interactive Size Chip
// class _SizeChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _SizeChip({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink[600] : Colors.grey[100],
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(
//             color: isSelected ? Colors.pink[600]! : Colors.grey[300]!,
//             width: 1.5,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: isSelected ? Colors.white : Colors.grey[800],
//           ),
//         ),
//       ),
//     );
//   }
// }




























// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Product product;
//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   int selectedSizeIndex = 1; // US 8 selected
//   int selectedColorIndex = 0; // White selected
//   int selectedQuantity = 1;

//   final List<String> sizes = ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'];
//   final List<Map<String, String>> colors = [
//     {'name': 'White', 'color': '#FFFFFF'},
//     {'name': 'Black', 'color': '#000000'},
//     {'name': 'Green', 'color': '#00FF00'},
//     {'name': 'Pink', 'color': '#FF69B4'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // ✨ Hero Image SliverAppBar
//           SliverAppBar(
//             expandedHeight: 420,
//             pinned: true,
//             floating: false,
//             snap: false,
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.share, color: Colors.grey),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(Icons.favorite_border, color: Colors.pink),
//                 onPressed: () {},
//               ),
//               const SizedBox(width: 16),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: Hero(
//                 tag: widget.product.id,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: widget.product.image,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey[100],
//                         child: const Center(
//                           child: CircularProgressIndicator(color: Colors.pink),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey[200],
//                         child: const Icon(Icons.image_not_supported, size: 80),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.4),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ✨ Premium Product Info
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 👕 Product Name & Price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.product.name,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.grey[900],
//                             height: 1.2,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.pink[50],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           '\$${widget.product.price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.pink[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // ⭐ Rating & Reviews
//                   Row(
//                     children: [
//                       ...List.generate(5, (index) => Icon(
//                         index < 4 ? Icons.star : Icons.star_border,
//                         color: Colors.amber,
//                         size: 20,
//                       )),
//                       const SizedBox(width: 8),
//                       Text(
//                         '4.8 (127 reviews)',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // 🎨 Color Selection
//                   const Text(
//                     'Color',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: colors.length,
//                       itemBuilder: (context, index) {
//                         final color = colors[index];
//                         return Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () => setState(() => selectedColorIndex = index),
//                               child: Container(
//                                 width: 48,
//                                 height: 48,
//                                 margin: const EdgeInsets.only(right: 12),
//                                 decoration: BoxDecoration(
//                                   color: Color(int.parse(color['color']!.replaceAll('#', '0xFF'))),
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: selectedColorIndex == index 
//                                         ? Colors.pink 
//                                         : Colors.transparent,
//                                     width: 3,
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.1),
//                                       blurRadius: 8,
//                                       offset: const Offset(0, 4),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             if (index < colors.length - 1) const SizedBox(width: 8),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // 📏 Size Selection
//                   const Text(
//                     'Size',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: sizes.length,
//                       itemBuilder: (context, index) {
//                         return Row(
//                           children: [
//                             _SizeChip(
//                               label: sizes[index],
//                               isSelected: selectedSizeIndex == index,
//                               onTap: () => setState(() => selectedSizeIndex = index),
//                             ),
//                             if (index < sizes.length - 1) const SizedBox(width: 12),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // 🔢 Quantity Selector
//                   const Text(
//                     'Quantity',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[50],
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.grey[200]!),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: selectedQuantity > 1
//                               ? () => setState(() => selectedQuantity--)
//                               : null,
//                           icon: const Icon(Icons.remove, size: 20),
//                         ),
//                         Text(
//                           '$selectedQuantity',
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () => setState(() => selectedQuantity++),
//                           icon: const Icon(Icons.add, size: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 🛒 Premium Add to Cart Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 65,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         final selectedSize = sizes[selectedSizeIndex];
//                         final selectedColor = colors[selectedColorIndex]['name']!;
//                         context.read<CartProvider>().addToCart(widget.product);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               '✅ Added ${widget.product.name}\nSize: $selectedSize | Color: $selectedColor | Qty: $selectedQuantity',
//                             ),
//                             backgroundColor: Colors.pink[600],
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink[600],
//                         foregroundColor: Colors.white,
//                         elevation: 8,
//                         shadowColor: Colors.pink[400],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.shopping_bag, size: 24),
//                           const SizedBox(width: 12),
//                           const Text(
//                             'ADD TO BAG',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // ✨ Free Shipping Badge
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.green[50],
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.green[200]!),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.local_shipping, color: Colors.green[700], size: 24),
//                         const SizedBox(width: 12),
//                         Text(
//                           'Free shipping on orders over \$50',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.green[800],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ✨ Size Chip Widget
// class _SizeChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _SizeChip({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink[600] : Colors.grey[100],
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(
//             color: isSelected ? Colors.pink[600]! : Colors.grey[300]!,
//             width: 1.5,
//           ),
//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: Colors.pink.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   )
//                 ]
//               : null,
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: isSelected ? Colors.white : Colors.grey[800],
//           ),
//         ),
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   final Product product;
//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   int selectedSizeIndex = 1; // US 8 selected
//   int selectedColorIndex = 0; // White selected
//   int selectedQuantity = 1;

//   final List<String> sizes = ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'];
//   final List<Map<String, String>> colors = [
//     {'name': 'White', 'color': '#FFFFFF'},
//     {'name': 'Black', 'color': '#000000'},
//     {'name': 'Green', 'color': '#00FF00'},
//     {'name': 'Pink', 'color': '#FF69B4'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // ✨ Hero Image SliverAppBar
//           SliverAppBar(
//             expandedHeight: 420,
//             pinned: true,
//             floating: false,
//             snap: false,
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.share, color: Colors.grey),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(Icons.favorite_border, color: Colors.pink),
//                 onPressed: () {},
//               ),
//               const SizedBox(width: 16),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: Hero(
//                 tag: widget.product.id,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: widget.product.image,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                       placeholder: (context, url) => Container(
//                         color: Colors.grey[100],
//                         child: const Center(
//                           child: CircularProgressIndicator(color: Colors.pink),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: Colors.grey[200],
//                         child: const Icon(Icons.image_not_supported, size: 80),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.4),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // ✨ Premium Product Info
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 👕 Product Name & Price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.product.name,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.grey[900],
//                             height: 1.2,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.pink[50],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           '\$${widget.product.price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.pink[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),

//                   // ⭐ Rating & Reviews
//                   Row(
//                     children: [
//                       ...List.generate(5, (index) => Icon(
//                         index < 4 ? Icons.star : Icons.star_border,
//                         color: Colors.amber,
//                         size: 20,
//                       )),
//                       const SizedBox(width: 8),
//                       Text(
//                         '4.8 (127 reviews)',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // 🎨 Color Selection
//                   const Text(
//                     'Color',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: colors.length,
//                       itemBuilder: (context, index) {
//                         final color = colors[index];
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 12),
//                           child: GestureDetector(
//                             onTap: () => setState(() => selectedColorIndex = index),
//                             child: Container(
//                               width: 48,
//                               height: 48,
//                               decoration: BoxDecoration(
//                                 color: Color(int.parse(color['color']!.replaceAll('#', '0xFF'))),
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: selectedColorIndex == index 
//                                       ? Colors.pink 
//                                       : Colors.transparent,
//                                   width: 3,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 4),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // 📏 Size Selection
//                   const Text(
//                     'Size',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 48,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: sizes.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 12),
//                           child: _SizeChip(
//                             label: sizes[index],
//                             isSelected: selectedSizeIndex == index,
//                             onTap: () => setState(() => selectedSizeIndex = index),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // 🔢 Quantity Selector
//                   const Text(
//                     'Quantity',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[50],
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.grey[200]!),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: selectedQuantity > 1
//                               ? () => setState(() => selectedQuantity--)
//                               : null,
//                           icon: const Icon(Icons.remove, size: 20),
//                         ),
//                         Text(
//                           '$selectedQuantity',
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () => setState(() => selectedQuantity++),
//                           icon: const Icon(Icons.add, size: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 32),

//                   // 🛒 Premium Add to Cart Button - ✅ FIXED!
//                   SizedBox(
//                     width: double.infinity,
//                     height: 65,
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final selectedSize = sizes[selectedSizeIndex];
//                         final selectedColor = colors[selectedColorIndex]['name']!;
                        
//                         // ✅ CORRECT: Pass size/color/quantity to CartProvider
//                         await context.read<CartProvider>().addToCart(
//                           widget.product,
//                           quantity: selectedQuantity,
//                           size: selectedSize,
//                           color: selectedColor,
//                         );
                        
//                         // ✅ Enhanced success message
//                         if (mounted) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 '✅ Added ${widget.product.name}\nSize: $selectedSize | Color: $selectedColor | Qty: $selectedQuantity',
//                               ),
//                               backgroundColor: Colors.pink[600],
//                               behavior: SnackBarBehavior.floating,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               duration: const Duration(seconds: 3),
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink[600],
//                         foregroundColor: Colors.white,
//                         elevation: 8,
//                         shadowColor: Colors.pink[400],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.shopping_bag, size: 24),
//                           const SizedBox(width: 12),
//                           const Text(
//                             'ADD TO BAG',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // ✨ Free Shipping Badge
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.green[50],
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.green[200]!),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.local_shipping, color: Colors.green[700], size: 24),
//                         const SizedBox(width: 12),
//                         const Text(
//                           "Free shipping on orders over \$50",  // ✅ Fixed escaping
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             //color: Colors.green[800],
//                             color: Colors.green , // Fixed color property

//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ✨ Size Chip Widget
// class _SizeChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _SizeChip({
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink[600] : Colors.grey[100],
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(
//             color: isSelected ? Colors.pink[600]! : Colors.grey[300]!,
//             width: 1.5,
//           ),
//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: Colors.pink.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   )
//                 ]
//               : null,
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: isSelected ? Colors.white : Colors.grey[800],
//           ),
//         ),
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart'; // Add to pubspec.yaml
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart'; // Add this import

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSizeIndex = 1;
  int selectedColorIndex = 0;
  int selectedQuantity = 1;
  bool _isFavorite = false; // Track favorite state

  final List<String> sizes = ['US 7', 'US 8', 'US 9', 'US 10', 'US 11'];
  final List<Map<String, String>> colors = [
    {'name': 'White', 'color': '#FFFFFF'},
    {'name': 'Black', 'color': '#000000'},
    {'name': 'Green', 'color': '#00FF00'},
    {'name': 'Pink', 'color': '#FF69B4'},
  ];

  @override
  void initState() {
    super.initState();
    // Check if product is already favorite
    final favoritesProvider = context.read<FavoritesProvider>();
    _isFavorite = favoritesProvider.isFavorite(widget.product.id);
  }

  // ✅ SHARE FUNCTIONALITY
  void _shareProduct() {
    Share.share(
      'Check out these amazing ${widget.product.name}!\n'
      'Price: \$${widget.product.price}\n'
      '${widget.product.image}',
      subject: 'Amazing ${widget.product.name} on Footwear Gallery 👟',
    );
  }

  // ✅ FAVORITE FUNCTIONALITY
  void _toggleFavorite() {
    final favoritesProvider = context.read<FavoritesProvider>();
    
    if (_isFavorite) {
      favoritesProvider.removeFavorite(widget.product.id);
    } else {
      favoritesProvider.addFavorite(
        productId: widget.product.id,
        title: widget.product.name,
        price: widget.product.price,
        image: widget.product.image,
      );
    }
    
    setState(() {
      _isFavorite = !_isFavorite;
    });

    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFavorite ? 'Added to favorites ❤️' : 'Removed from favorites 💔'),
        backgroundColor: _isFavorite ? Colors.pink : Colors.grey,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 420,
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              // ✅ FUNCTIONAL SHARE BUTTON
              IconButton(
                icon: const Icon(Icons.share, color: Colors.grey),
                onPressed: _shareProduct, // ✅ Now works!
                tooltip: 'Share Product',
              ),
              // ✅ FUNCTIONAL FAVORITE BUTTON
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.pink,
                ),
                onPressed: _toggleFavorite, // ✅ Now works!
                tooltip: 'Add to Favorites',
              ),
              const SizedBox(width: 16),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.product.id,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[100],
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.pink),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported, size: 80),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                            height: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.pink[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: [
                      ...List.generate(5, (index) => Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      )),
                      const SizedBox(width: 8),
                      Text(
                        '4.8 (127 reviews)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Color Selection
                  const Text('Color', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 48,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        final color = colors[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () => setState(() => selectedColorIndex = index),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Color(int.parse(color['color']!.replaceAll('#', '0xFF'))),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColorIndex == index ? Colors.pink : Colors.transparent,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Size Selection
                  const Text('Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 48,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _SizeChip(
                            label: sizes[index],
                            isSelected: selectedSizeIndex == index,
                            onTap: () => setState(() => selectedSizeIndex = index),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Quantity Selector
                  const Text('Quantity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: selectedQuantity > 1 ? () => setState(() => selectedQuantity--) : null,
                          icon: const Icon(Icons.remove, size: 20),
                        ),
                        Text('$selectedQuantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: () => setState(() => selectedQuantity++),
                          icon: const Icon(Icons.add, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () async {
                        final selectedSize = sizes[selectedSizeIndex];
                        final selectedColor = colors[selectedColorIndex]['name']!;
                        await context.read<CartProvider>().addToCart(
                          widget.product,
                          quantity: selectedQuantity,
                          size: selectedSize,
                          color: selectedColor,
                        );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('✅ Added ${widget.product.name}\nSize: $selectedSize | Color: $selectedColor | Qty: $selectedQuantity'),
                              backgroundColor: Colors.pink[600],
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[600],
                        foregroundColor: Colors.white,
                        elevation: 8,
                        shadowColor: Colors.pink[400],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag, size: 24),
                          SizedBox(width: 12),
                          Text('ADD TO BAG', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Free Shipping
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.green[700]!, size: 24),
                        const SizedBox(width: 12),
                        const Text(
                          "Free shipping on orders over \$50",
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Size Chip (unchanged)
class _SizeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SizeChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink[600] : Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: isSelected ? Colors.pink[600]! : Colors.grey[300]!, width: 1.5),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.pink.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isSelected ? Colors.white : Colors.grey[800]),
        ),
      ),
    );
  }
}

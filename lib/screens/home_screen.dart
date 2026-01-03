
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













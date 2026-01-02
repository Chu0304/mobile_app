import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/product_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> shoes = [
    {
      'image': 'https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=400',
      'title': 'Nike Air Max 90',
      'price': '\$129.99',
      'description': 'Premium comfort with iconic design',
    },
    {
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      'title': 'Adidas Ultraboost',
      'price': '\$189.99',
      'description': 'Ultimate running performance',
    },
    {
      'image': 'https://images.unsplash.com/photo-1605346188173-47c293ca2e99?w=400',
      'title': 'Puma RS-X',
      'price': '\$99.99',
      'description': 'Bold style, maximum comfort',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf5f2),
      body: Stack(
        children: [
          // Shoes Carousel
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: shoes.length,
            itemBuilder: (context, index) {
              final shoe = shoes[index];
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Shoe Image
                    Hero(
                      tag: 'shoe_$index',
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            shoe['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey[200],
                              // child: const Icon(Icons.sneakers, size: 100, color: Colors.grey),
                              child: const Icon(Icons.shopping_bag, size: 100, color: Colors.grey),  // Shopping bag

                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Shoe Details
                    Text(
                      shoe['title']!,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shoe['price']!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      shoe['description']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),

          // Bottom Indicators & Buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(shoes.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.pink : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Skip Button
                    SizedBox(
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () => _goToLogin(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.pink),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontSize: 16, color: Colors.pink),
                        ),
                      ),
                    ),

                    // Next/Login Button
                    SizedBox(
                      height: 55,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: _currentPage < shoes.length - 1
                            ? () => _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                )
                            : () => _goToLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _currentPage < shoes.length - 1 ? 'Next' : 'Get Started',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

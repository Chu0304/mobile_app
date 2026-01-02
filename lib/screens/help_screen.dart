// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpScreen extends StatelessWidget {
//   const HelpScreen({super.key});

//   // Function to open email client
//   Future<void> _contactSupport() async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: 'support@shoeapp.com',
//       query: 'subject=Support Request&body=Describe your issue here...',
//     );
//     if (await canLaunchUrl(emailUri)) {
//       await launchUrl(emailUri);
//     } else {
//       debugPrint('Could not launch email client');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Help & Support'),
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Text(
//             'Frequently Asked Questions',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),

//           // FAQ example
//           ExpansionTile(
//             title: const Text('How do I place an order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'To place an order, go to the product page, select your size, and click "Add to Cart". Then proceed to checkout.',
//                 ),
//               )
//             ],
//           ),
//           ExpansionTile(
//             title: const Text('How do I track my order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'After placing an order, go to "Orders" from your profile to see the status of your shipments.',
//                 ),
//               )
//             ],
//           ),
//           ExpansionTile(
//             title: const Text('How do I return a product?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'To return a product, contact support via the button below and follow the instructions provided.',
//                 ),
//               )
//             ],
//           ),

//           const SizedBox(height: 24),
//           ElevatedButton.icon(
//             onPressed: _contactSupport,
//             icon: const Icon(Icons.email),
//             label: const Text('Contact Support'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.pink,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               textStyle: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpScreen extends StatelessWidget {
//   const HelpScreen({super.key});

//   // Function to open email client
//   Future<void> _contactSupport() async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: 'support@shoeapp.com',
//       query: 'subject=Support Request&body=Describe your issue here...',
//     );

//     if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
//       debugPrint('Could not launch email client');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Help & Support'),
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Text(
//             'Frequently Asked Questions',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),

//           ExpansionTile(
//             title: const Text('How do I place an order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'To place an order, go to the product page, select your size, and click "Add to Cart". Then proceed to checkout.',
//                 ),
//               )
//             ],
//           ),
//           ExpansionTile(
//             title: const Text('How do I track my order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'After placing an order, go to "Orders" from your profile to see the status of your shipments.',
//                 ),
//               )
//             ],
//           ),
//           ExpansionTile(
//             title: const Text('How do I return a product?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'To return a product, contact support via the button below and follow the instructions provided.',
//                 ),
//               )
//             ],
//           ),

//           const SizedBox(height: 24),
//           ElevatedButton.icon(
//             onPressed: () => _contactSupportWithContext(context),
//             icon: const Icon(Icons.email),
//             label: const Text('Contact Support'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.pink,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               textStyle: const TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper to pass BuildContext
//   void _contactSupportWithContext(BuildContext context) {
//     _contactSupportWithSnack(context);
//   }

//   Future<void> _contactSupportWithSnack(BuildContext context) async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: 'support@shoeapp.com',
//       query: 'subject=Support Request&body=Describe your issue here...',
//     );

//     if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Could not launch email client')),
//       );
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpScreen extends StatelessWidget {
//   const HelpScreen({super.key});

//   // ✅ SINGLE WORKING FUNCTION
//   Future<void> _contactSupport(BuildContext context) async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: 'support@shoeapp.com',
//       query: 'subject=Shoe App Support&body=Describe your issue here...',
//     );

//     try {
//       final bool launched = await launchUrl(
//         emailUri, 
//         mode: LaunchMode.externalApplication,
//       );
      
//       if (!launched) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('No email app found'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Help & Support'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Header
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Icon(Icons.help_outline, size: 60, color: Colors.pink),
//                   const SizedBox(height: 12),
//                   const Text(
//                     'Need Help?',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Find answers or contact support',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),

//           // FAQs
//           const Text(
//             'Frequently Asked Questions',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),

//           ExpansionTile(
//             leading: Icon(Icons.shopping_cart, color: Colors.pink),
//             title: const Text('How do I place an order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   '1. Browse products\n2. Tap size & color\n3. Add to Cart\n4. Checkout → Done!',
//                   style: TextStyle(height: 1.5),
//                 ),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.track_changes, color: Colors.pink),
//             title: const Text('How do I track my order?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   'Go to Profile → Orders to see real-time tracking status.',
//                   style: TextStyle(height: 1.5),
//                 ),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.assignment_return, color: Colors.pink),
//             title: const Text('How do I return?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   'Contact support below. 30-day free returns!',
//                   style: TextStyle(height: 1.5),
//                 ),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             leading: Icon(Icons.payment, color: Colors.pink),
//             title: const Text('Payment issues?'),
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   'Stripe secure payments. Contact support for refunds.',
//                   style: TextStyle(height: 1.5),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 32),

//           // ✅ CONTACT SUPPORT BUTTON - NOW WORKS!
//           Container(
//             width: double.infinity,
//             height: 60,
//             child: ElevatedButton.icon(
//               onPressed: () => _contactSupport(context),  // ✅ FIXED
//               icon: const Icon(Icons.email_outlined, size: 24),
//               label: const Text(
//                 'Contact Support',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.pink,
//                 foregroundColor: Colors.white,
//                 elevation: 8,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 16),
          
//           // Additional options
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   const Text(
//                     'Other ways to get help:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildContactOption(
//                         context,
//                         icon: Icons.phone,
//                         label: 'Call',
//                         onTap: () => launchUrl(Uri.parse('tel:+1234567890')),
//                       ),
//                       _buildContactOption(
//                         context,
//                         icon: Icons.chat,
//                         label: 'Chat',
//                         onTap: () => launchUrl(Uri.parse('sms:+1234567890')),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper widget
//   Widget _buildContactOption(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.pink[50],
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: Colors.pink, size: 28),
//           ),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart'; // Add to pubspec.yaml

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.help_outline, size: 60, color: Colors.pink),
                  const SizedBox(height: 12),
                  const Text(
                    'Need Help?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Contact us anytime',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ✅ REAL WORKING CONTACT BUTTONS (Like Nike App)
          _buildBigContactButton(
            context,
            icon: Icons.email_outlined,
            label: 'Email Support',
            color: Colors.pink,
            onTap: () => _launchEmail(context),
          ),
          const SizedBox(height: 12),
          _buildBigContactButton(
            context,
            icon: Icons.phone,
            label: 'Call Support',
            color: Colors.green,
            onTap: () => _launchPhone(),
          ),
          const SizedBox(height: 12),
          _buildBigContactButton(
            context,
            icon: Icons.chat,
            label: 'WhatsApp',
            color: Colors.green[600]!,
            onTap: () => _launchWhatsApp(context),
          ),
          const SizedBox(height: 12),
          _buildBigContactButton(
            context,
            icon: Icons.track_changes,
            label: 'Track Order',
            color: Colors.blue,
            onTap: () => _launchTracking(context),
          ),

          const SizedBox(height: 32),

          // FAQs (Keep as is - working fine)
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildFAQ(Icons.shopping_cart, 'How do I place an order?', 
            '1. Browse → 2. Add to Cart → 3. Checkout'),
          _buildFAQ(Icons.track_changes, 'Track my order?', 
            'Profile → Orders → Live tracking'),
          _buildFAQ(Icons.assignment_return, 'How to return?', 
            '30-day returns. Contact support'),
          _buildFAQ(Icons.payment, 'Payment issues?', 
            'Stripe secure. Email for refunds'),
        ],
      ),
    );
  }

  // ✅ REAL WORKING FUNCTIONS
  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@shoeapp.com',
      query: 'subject=Shoe App Help&body=Hi, I need help with...',
    );
    
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        _showSnackBar(context, 'Install email app');
      }
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri.parse('tel:+1234567890'); // YOUR NUMBER
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _launchWhatsApp(BuildContext context) async {
    final String phone = '+1234567890'; // YOUR WHATSAPP NUMBER
    final Uri whatsappUri = Uri.parse('https://wa.me/$phone?text=Hi%20ShoeApp%20Support');
    
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        _showSnackBar(context, 'Install WhatsApp');
      }
    }
  }

  Future<void> _launchTracking(BuildContext context) async {
    // Navigate to Orders screen or launch tracking URL
    Navigator.pop(context); // Go back to profile/orders
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Go to Profile → Orders')),
    );
  }

  Widget _buildBigContactButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 70,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 28),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }

  Widget _buildFAQ(IconData icon, String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(answer, style: const TextStyle(height: 1.5)),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.orange),
    );
  }
}






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

//   /// 👟 Fetch ONLY men's shoes from FakeStore
//   Future<void> fetchProducts() async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       // ✅ Fetch men's clothing category
//       final url =
//           Uri.parse("https://fakestoreapi.com/products/category/men's clothing");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);
//         final fetchedProducts = data.map((e) => Product.fromJson(e)).toList();

//         // 👟 Filter only products with "shoe-like" names
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
//           .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpScreen extends StatelessWidget {
//   const HelpScreen({super.key});

//   // Launch email
//   Future<void> _launchEmail() async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: 'support@shoeapp.com',
//       query: 'subject=Support Request&body=Describe your issue here...',
//     );

//     if (await canLaunchUrl(emailUri)) {
//       await launchUrl(emailUri);
//     } else {
//       debugPrint('Could not launch email client');
//     }
//   }

//   // Launch phone dialer
//   Future<void> _launchPhone() async {
//     final Uri phoneUri = Uri(
//       scheme: 'tel',
//       path: '+1234567890',
//     );

//     if (await canLaunchUrl(phoneUri)) {
//       await launchUrl(phoneUri);
//     } else {
//       debugPrint('Could not launch phone dialer');
//     }
//   }

//   // Launch website
//   Future<void> _launchWebsite() async {
//     final Uri websiteUri = Uri.parse('https://www.shoeapp.com');

//     if (await canLaunchUrl(websiteUri)) {
//       await launchUrl(websiteUri, mode: LaunchMode.externalApplication);
//     } else {
//       debugPrint('Could not launch website');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Help & Support'),
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Text(
//             'Need Help? Contact us:',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),

//           // Email
//           ListTile(
//             leading: const Icon(Icons.email, color: Colors.pink),
//             title: const Text('Email Support'),
//             subtitle: const Text('support@shoeapp.com'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _launchEmail,
//           ),
//           const Divider(),

//           // Phone
//           ListTile(
//             leading: const Icon(Icons.phone, color: Colors.pink),
//             title: const Text('Call Support'),
//             subtitle: const Text('+1234567890'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _launchPhone,
//           ),
//           const Divider(),

//           // Website
//           ListTile(
//             leading: const Icon(Icons.web, color: Colors.pink),
//             title: const Text('Visit Website'),
//             subtitle: const Text('www.shoeapp.com'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _launchWebsite,
//           ),
//           const Divider(),

//           const SizedBox(height: 20),
//           const Text(
//             'FAQ and Help Articles will be added here soon.',
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }


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







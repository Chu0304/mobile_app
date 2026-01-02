// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'Profile',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

// import '../providers/auth_provider.dart' as app_auth;

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = context.watch<app_auth.AuthProvider>();
//     final User? user = authProvider.user;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         backgroundColor: Colors.pink,
//         centerTitle: true,
//       ),
//       body: user == null
//           ? const Center(
//               child: Text(
//                 'No user logged in',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 children: [
//                   /// 👤 Avatar
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.pink.shade100,
//                     backgroundImage:
//                         user.photoURL != null ? NetworkImage(user.photoURL!) : null,
//                     child: user.photoURL == null
//                         ? const Icon(
//                             Icons.person,
//                             size: 50,
//                             color: Colors.white,
//                           )
//                         : null,
//                   ),

//                   const SizedBox(height: 16),

//                   /// 📧 Email
//                   Text(
//                     user.email ?? 'No email',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 8),

//                   /// 🆔 UID
//                   Text(
//                     'UID: ${user.uid}',
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),

//                   const SizedBox(height: 32),

//                   /// 🚪 Logout
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: const Icon(Icons.logout),
//                       label: const Text('Logout'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: () async {
//                         await authProvider.logout();

//                         if (!context.mounted) return;

//                         Navigator.of(context).pushNamedAndRemoveUntil(
//                           '/login',
//                           (route) => false,
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'orders_screen.dart';
import 'settings_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: user == null
          ? const Center(
              child: Text(
                'No user logged in',
                style: TextStyle(fontSize: 16),
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 24),

                /// 👤 Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pink.shade100,
                  backgroundImage: user.photoURL != null
                      ? NetworkImage(user.photoURL!)
                      : null,
                  child: user.photoURL == null
                      ? const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        )
                      : null,
                ),

                const SizedBox(height: 16),

                /// 📧 Email
                Text(
                  user.email ?? 'No email',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                /// 🆔 UID
                Text(
                  'UID: ${user.uid}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                /// 📋 Menu Items
                Expanded(
                  child: ListView(
                    children: [
                      ProfileMenuTile(
                        icon: Icons.settings,
                        title: 'Settings',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SettingsScreen(),
                            ),
                          );
                        },
                      ),
                      ProfileMenuTile(
                        icon: Icons.shopping_bag,
                        title: 'Orders',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrdersScreen(),
                            ),
                          );
                        },
                      ),
                      ProfileMenuTile(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HelpScreen(),
                            ),
                          );
                        },
                      ),
                      const Divider(),

                      /// 🚪 Logout
                      ProfileMenuTile(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () async {
                          await authProvider.logout();
                          if (!context.mounted) return;
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

/// Reusable menu tile
class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.pink),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

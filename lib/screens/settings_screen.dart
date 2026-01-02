// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _pushNotifications = true;
//   bool _emailNotifications = true;

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Change password using Firebase Auth
//   Future<void> _changePassword() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     final controller = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Change Password'),
//         content: TextField(
//           controller: controller,
//           obscureText: true,
//           decoration: const InputDecoration(
//             labelText: 'New Password',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               try {
//                 await user.updatePassword(controller.text.trim());
//                 Navigator.pop(context);
//                 if (!mounted) return;
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Password updated successfully!'),
//                   ),
//                 );
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Failed to update password: $e')),
//                 );
//               }
//             },
//             child: const Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Edit profile placeholder
//   void _editProfile() {
//     // Replace with actual EditProfileScreen navigation
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Edit Profile tapped')),
//     );
//   }

//   /// Show About App dialog
//   void _aboutApp() {
//     showAboutDialog(
//       context: context,
//       applicationName: 'Shoe App',
//       applicationVersion: '1.0.0',
//       applicationIcon:
//           const Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
//       children: const [
//         Text('This is a sample Shoe App built with Flutter and Firebase.'),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Edit Profile
//           ListTile(
//             leading: const Icon(Icons.person, color: Colors.pink),
//             title: const Text('Edit Profile'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _editProfile,
//           ),
//           const Divider(),

//           // Change Password
//           ListTile(
//             leading: const Icon(Icons.lock, color: Colors.pink),
//             title: const Text('Change Password'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _changePassword,
//           ),
//           const Divider(),

//           // Push Notifications
//           SwitchListTile(
//             value: _pushNotifications,
//             onChanged: (val) {
//               setState(() => _pushNotifications = val);
//               // Save to Firestore or SharedPreferences if needed
//             },
//             title: const Text('Push Notifications'),
//             secondary: const Icon(Icons.notifications, color: Colors.pink),
//           ),
//           const Divider(),

//           // Email Notifications
//           SwitchListTile(
//             value: _emailNotifications,
//             onChanged: (val) {
//               setState(() => _emailNotifications = val);
//               // Save to Firestore or SharedPreferences if needed
//             },
//             title: const Text('Email Notifications'),
//             secondary: const Icon(Icons.email, color: Colors.pink),
//           ),
//           const Divider(),

//           // About App
//           ListTile(
//             leading: const Icon(Icons.info_outline, color: Colors.pink),
//             title: const Text('About App'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _aboutApp,
//           ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'edit_profile_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _pushNotifications = true;
//   bool _emailNotifications = true;

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// Change password
//   Future<void> _changePassword() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     final controller = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Change Password'),
//         content: TextField(
//           controller: controller,
//           obscureText: true,
//           decoration: const InputDecoration(labelText: 'New Password'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               try {
//                 await user.updatePassword(controller.text.trim());
//                 Navigator.pop(context);
//                 if (!mounted) return;
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Password updated successfully!')),
//                 );
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Failed to update password: $e')),
//                 );
//               }
//             },
//             child: const Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }

//   /// About App
//   void _aboutApp() {
//     showAboutDialog(
//       context: context,
//       applicationName: 'Shoe App',
//       applicationVersion: '1.0.0',
//       applicationIcon: const Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
//       children: const [
//         Text('This is a sample Shoe App built with Flutter and Firebase.'),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Edit Profile
//           ListTile(
//             leading: const Icon(Icons.person, color: Colors.pink),
//             title: const Text('Edit Profile'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const EditProfileScreen()),
//               );
//             },
//           ),
//           const Divider(),

//           // Change Password
//           ListTile(
//             leading: const Icon(Icons.lock, color: Colors.pink),
//             title: const Text('Change Password'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _changePassword,
//           ),
//           const Divider(),

//           // Push Notifications
//           SwitchListTile(
//             value: _pushNotifications,
//             onChanged: (val) => setState(() => _pushNotifications = val),
//             title: const Text('Push Notifications'),
//             secondary: const Icon(Icons.notifications, color: Colors.pink),
//           ),
//           const Divider(),

//           // Email Notifications
//           SwitchListTile(
//             value: _emailNotifications,
//             onChanged: (val) => setState(() => _emailNotifications = val),
//             title: const Text('Email Notifications'),
//             secondary: const Icon(Icons.email, color: Colors.pink),
//           ),
//           const Divider(),

//           // About App
//           ListTile(
//             leading: const Icon(Icons.info_outline, color: Colors.pink),
//             title: const Text('About App'),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: _aboutApp,
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';
// import 'edit_profile_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _pushNotifications = true;
//   bool _emailNotifications = true;
//   bool _darkMode = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// 🔥 Logout User
//   Future<void> _logout() async {
//     final auth = Provider.of<AuthProvider>(context, listen: false);
//     await auth.logout();
//     if (mounted) {
//       Navigator.pushReplacementNamed(context, '/login');
//     }
//   }

//   /// Delete Account (Destructive)
//   Future<void> _deleteAccount() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
//         content: const Text(
//           'This action cannot be undone. All your data will be permanently deleted.',
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             onPressed: () async {
//               Navigator.pop(context);
//               try {
//                 await user.delete();
//                 if (mounted) {
//                   Navigator.pushReplacementNamed(context, '/login');
//                 }
//               } catch (e) {
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to delete: $e')),
//                   );
//                 }
//               }
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // 👤 Profile Section
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               leading: const CircleAvatar(
//                 radius: 25,
//                 backgroundColor: Colors.pink,
//                 child: Icon(Icons.person, color: Colors.white, size: 28),
//               ),
//               title: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: const Text('Update name & photo'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen()));
//               },
//             ),
//           ),

//           // 🔐 Password Section
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               leading: const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () async {
//                 final controller = TextEditingController();
//                 await showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text('New Password'),
//                     content: TextField(
//                       controller: controller,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter new password (6+ chars)',
//                         border: OutlineInputBorder(),
//                       ),
//                       onSubmitted: (_) => Navigator.pop(context),
//                     ),
//                     actions: [
//                       TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                         onPressed: controller.text.length < 6
//                             ? null
//                             : () async {
//                                 Navigator.pop(context);
//                                 final user = _auth.currentUser;
//                                 if (user != null) {
//                                   try {
//                                     await user.updatePassword(controller.text.trim());
//                                     if (mounted) {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(
//                                           content: Text('Password updated! 🔒'),
//                                           backgroundColor: Colors.green,
//                                         ),
//                                       );
//                                     }
//                                   } catch (e) {
//                                     if (mounted) {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(content: Text('Error: $e')),
//                                       );
//                                     }
//                                   }
//                                 }
//                               },
//                         child: const Text('Update', style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // 🔔 Notifications Section
//           const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 12),
//           SwitchListTile(
//             value: _pushNotifications,
//             onChanged: (val) => setState(() => _pushNotifications = val),
//             title: const Text('Push Notifications'),
//             secondary: const Icon(Icons.notifications, color: Colors.pink),
//             activeColor: Colors.pink,
//           ),
//           SwitchListTile(
//             value: _emailNotifications,
//             onChanged: (val) => setState(() => _emailNotifications = val),
//             title: const Text('Email Notifications'),
//             secondary: const Icon(Icons.email, color: Colors.pink),
//             activeColor: Colors.pink,
//           ),

//           const SizedBox(height: 24),
//           const Divider(),

//           // 🌙 Appearance
//           SwitchListTile(
//             value: _darkMode,
//             onChanged: (val) => setState(() => _darkMode = val),
//             title: const Text('Dark Mode'),
//             secondary: const Icon(Icons.dark_mode, color: Colors.pink),
//             activeColor: Colors.pink,
//           ),

//           const Divider(),

//           // ℹ️ About
//           ListTile(
//             leading: const Icon(Icons.info_outline, color: Colors.pink),
//             title: const Text('About App', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: const Text('Version 1.0.0'),
//             onTap: () => showAboutDialog(
//               context: context,
//               applicationName: 'Shoe App',
//               applicationVersion: '1.0.0',
//               applicationIcon: const Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
//               children: const [
//                 Text('Premium shoe store app with Firebase integration.'),
//               ],
//             ),
//           ),

//           const Divider(),

//           // 🚪 Logout Section
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.orange),
//             title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
//             onTap: _logout,
//           ),

//           // 💥 Delete Account (Bottom - Destructive)
//           ListTile(
//             leading: const Icon(Icons.delete_forever, color: Colors.red),
//             title: const Text('Delete Account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
//             onTap: _deleteAccount,
//           ),
//         ],
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _darkMode = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 🔥 Logout User - FIXED ✅ Direct Firebase
  Future<void> _logout() async {
    try {
      await _auth.signOut();  // ✅ Direct Firebase - No Provider needed
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged out successfully! 👋'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: $e')),
        );
      }
    }
  }

  /// Delete Account (Destructive)
  Future<void> _deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
        content: const Text(
          'This action cannot be undone. All your data will be permanently deleted.',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(context);
              try {
                await user.delete();
                if (mounted) {
                  Navigator.pushReplacementNamed(context, '/login');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account deleted permanently.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete: $e')),
                  );
                }
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 👤 Profile Section
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.pink,
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              title: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Update name & photo'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen()));
              },
            ),
          ),

          // 🔐 Password Section
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.pink),
              title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final controller = TextEditingController();
                await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('New Password'),
                    content: TextField(
                      controller: controller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Enter new password (6+ chars)',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => Navigator.pop(context),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                        onPressed: controller.text.length < 6
                            ? null
                            : () async {
                                Navigator.pop(context);
                                final user = _auth.currentUser;
                                if (user != null) {
                                  try {
                                    await user.updatePassword(controller.text.trim());
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Password updated! 🔒'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Error: $e')),
                                      );
                                    }
                                  }
                                }
                              },
                        child: const Text('Update', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // 🔔 Notifications Section
          const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            value: _pushNotifications,
            onChanged: (val) => setState(() => _pushNotifications = val),
            title: const Text('Push Notifications'),
            secondary: const Icon(Icons.notifications, color: Colors.pink),
            activeColor: Colors.pink,
          ),
          SwitchListTile(
            value: _emailNotifications,
            onChanged: (val) => setState(() => _emailNotifications = val),
            title: const Text('Email Notifications'),
            secondary: const Icon(Icons.email, color: Colors.pink),
            activeColor: Colors.pink,
          ),

          const SizedBox(height: 24),
          const Divider(),

          // 🌙 Appearance
          SwitchListTile(
            value: _darkMode,
            onChanged: (val) => setState(() => _darkMode = val),
            title: const Text('Dark Mode'),
            secondary: const Icon(Icons.dark_mode, color: Colors.pink),
            activeColor: Colors.pink,
          ),

          const Divider(),

          // ℹ️ About
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.pink),
            title: const Text('About App', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Version 1.0.0'),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'Shoe App',
              applicationVersion: '1.0.0',
              applicationIcon: const Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
              children: const [
                Text('Premium shoe store app with Firebase integration.'),
              ],
            ),
          ),

          const Divider(),

          // 🚪 Logout Section
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.orange),
            title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
            onTap: _logout,  // ✅ Now works perfectly
          ),

          // 💥 Delete Account (Bottom - Destructive)
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Delete Account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
            onTap: _deleteAccount,
          ),
        ],
      ),
    );
  }
}

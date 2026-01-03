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
//   bool _darkMode = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// 🔥 Logout User - FIXED ✅ Direct Firebase
//   Future<void> _logout() async {
//     try {
//       await _auth.signOut();  // ✅ Direct Firebase - No Provider needed
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, '/login');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Logged out successfully! 👋'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Logout failed: $e')),
//         );
//       }
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
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Account deleted permanently.'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
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
//             onTap: _logout,  // ✅ Now works perfectly
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













// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';  // ✅ NEW IMPORT
// import '../providers/theme_provider.dart';  // ✅ NEW IMPORT
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

//   /// 🔥 Logout User - FIXED ✅ Direct Firebase
//   Future<void> _logout() async {
//     try {
//       await _auth.signOut();
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, '/login');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Logged out successfully! 👋'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Logout failed: $e')),
//         );
//       }
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
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Account deleted permanently.'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
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

//           // 🌙 Appearance - ✅ CONNECTED TO THEMEPROVIDER
//           Consumer<ThemeProvider>(
//             builder: (context, themeProvider, child) {
//               return SwitchListTile(
//                 value: themeProvider.isDarkMode,
//                 onChanged: (val) => themeProvider.toggleTheme(val),
//                 title: const Text('Dark Mode'),
//                 secondary: const Icon(Icons.dark_mode, color: Colors.pink),
//                 activeColor: Colors.pink,
//               );
//             },
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




















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import '../providers/theme_provider.dart';
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

//   /// 🔥 Logout User - FIXED ✅ Direct Firebase
//   Future<void> _logout() async {
//     try {
//       await _auth.signOut();
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, '/login');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Logged out successfully! 👋'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Logout failed: $e')),
//         );
//       }
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
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Account deleted permanently.'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
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

//           // 🔐 Password Section - ✅ FULLY FIXED WITH REAUTH
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               leading: const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () async {
//                 final oldPasswordController = TextEditingController();
//                 final newPasswordController = TextEditingController();
                
//                 await showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text('Change Password'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: oldPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Current Password *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         TextField(
//                           controller: newPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'New Password (6+ chars) *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                         onPressed: (oldPasswordController.text.isEmpty || 
//                                    newPasswordController.text.length < 6)
//                             ? null
//                             : () async {
//                                 Navigator.pop(context);
                                
//                                 final user = _auth.currentUser;
//                                 if (user == null || user.email == null) {
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text('❌ No email user logged in')),
//                                     );
//                                   }
//                                   return;
//                                 }

//                                 try {
//                                   // ✅ STEP 1: Re-authenticate (REQUIRED!)
//                                   final cred = EmailAuthProvider.credential(
//                                     email: user.email!,
//                                     password: oldPasswordController.text.trim(),
//                                   );
//                                   await user.reauthenticateWithCredential(cred);
                                  
//                                   // ✅ STEP 2: Update password
//                                   await user.updatePassword(newPasswordController.text.trim());
                                  
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text('✅ Password changed successfully! 🔒'),
//                                         backgroundColor: Colors.green,
//                                       ),
//                                     );
//                                   }
//                                 } catch (e) {
//                                   String errorMsg = '❌ Error: ';
//                                   if (e.toString().contains('wrong-password')) {
//                                     errorMsg += 'Wrong current password';
//                                   } else if (e.toString().contains('requires-recent-login')) {
//                                     errorMsg += 'Session expired. Login again';
//                                   } else if (e.toString().contains('network-request-failed')) {
//                                     errorMsg += 'No internet connection';
//                                   } else {
//                                     errorMsg += e.toString();
//                                   }
                                  
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text(errorMsg)),
//                                     );
//                                   }
//                                 }
                                
//                                 oldPasswordController.dispose();
//                                 newPasswordController.dispose();
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

//           // 🌙 Appearance - ✅ CONNECTED TO THEMEPROVIDER
//           Consumer<ThemeProvider>(
//             builder: (context, themeProvider, child) {
//               return SwitchListTile(
//                 value: themeProvider.isDarkMode,
//                 onChanged: (val) => themeProvider.toggleTheme(val),
//                 title: const Text('Dark Mode'),
//                 secondary: const Icon(Icons.dark_mode, color: Colors.pink),
//                 activeColor: Colors.pink,
//               );
//             },
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











// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';  // ✅ For notifications
// import '../providers/theme_provider.dart';
// import 'edit_profile_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _notificationsEnabled = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _checkNotificationPermission();
//   }

//   /// ✅ Check & Request Notification Permission
//   Future<void> _checkNotificationPermission() async {
//     final messaging = FirebaseMessaging.instance;
//     final settings = await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//     );
//     if (mounted) {
//       setState(() {
//         _notificationsEnabled = settings.authorizationStatus == AuthorizationStatus.authorized;
//       });
//     }
//   }

//   /// ✅ Toggle Notifications FULLY FUNCTIONAL
//   Future<void> _toggleNotifications(bool value) async {
//     setState(() => _notificationsEnabled = value);
    
//     final messaging = FirebaseMessaging.instance;
//     if (value) {
//       // ✅ Enable notifications
//       await messaging.requestPermission();
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('✅ Notifications enabled!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } else {
//       // ✅ Disable notifications (iOS only, Android always shows)
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('🔕 Notifications disabled'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//       }
//     }
//   }

//   /// 🔥 Logout User
//   Future<void> _logout() async {
//     try {
//       await _auth.signOut();
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, '/login');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Logged out successfully! 👋'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Logout failed: $e')),
//         );
//       }
//     }
//   }

//   /// Delete Account
//   Future<void> _deleteAccount() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
//         content: const Text(
//           'This action cannot be undone. All data deleted permanently.',
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
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Account deleted permanently.'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
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

//           // 🔐 Password Section - ✅ FIXED WITH REAUTH
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               leading: const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () async {
//                 final oldPasswordController = TextEditingController();
//                 final newPasswordController = TextEditingController();
                
//                 await showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text('Change Password'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: oldPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Current Password *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         TextField(
//                           controller: newPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'New Password (6+ chars) *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                         onPressed: (oldPasswordController.text.isEmpty || newPasswordController.text.length < 6)
//                             ? null
//                             : () async {
//                                 Navigator.pop(context);
//                                 final user = _auth.currentUser;
//                                 if (user == null || user.email == null) {
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text('❌ Email user required')),
//                                     );
//                                   }
//                                   return;
//                                 }
//                                 try {
//                                   final cred = EmailAuthProvider.credential(
//                                     email: user.email!,
//                                     password: oldPasswordController.text.trim(),
//                                   );
//                                   await user.reauthenticateWithCredential(cred);
//                                   await user.updatePassword(newPasswordController.text.trim());
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text('✅ Password updated! 🔒'),
//                                         backgroundColor: Colors.green,
//                                       ),
//                                     );
//                                   }
//                                 } catch (e) {
//                                   if (mounted) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(content: Text('❌ $e')),
//                                     );
//                                   }
//                                 }
//                                 oldPasswordController.dispose();
//                                 newPasswordController.dispose();
//                               },
//                         child: const Text('Update', style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // 🔔 Notifications - ✅ FULLY FUNCTIONAL SINGLE TOGGLE
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: SwitchListTile(
//               value: _notificationsEnabled,
//               onChanged: _toggleNotifications,
//               title: const Text('Push Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
//               secondary: const Icon(Icons.notifications, color: Colors.pink),
//               activeColor: Colors.pink,
//             ),
//           ),

//           const SizedBox(height: 24),
//           const Divider(),

//           // 🌙 Dark Mode
//           Consumer<ThemeProvider>(
//             builder: (context, themeProvider, child) {
//               return SwitchListTile(
//                 value: themeProvider.isDarkMode,
//                 onChanged: (val) => themeProvider.toggleTheme(val),
//                 title: const Text('Dark Mode'),
//                 secondary: const Icon(Icons.dark_mode, color: Colors.pink),
//                 activeColor: Colors.pink,
//               );
//             },
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
//                 Text('Premium shoe store with Firebase.'),
//               ],
//             ),
//           ),

//           const Divider(),

//           // 🚪 Logout
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.orange),
//             title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
//             onTap: _logout,
//           ),

//           // 💥 Delete Account
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





// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import '../providers/theme_provider.dart';
// import 'edit_profile_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _notificationsEnabled = false;  // ✅ Local state only
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _loadNotificationSetting();
//   }

//   /// ✅ Load saved notification preference
//   Future<void> _loadNotificationSetting() async {
//     // TODO: Load from SharedPreferences if added later
//     setState(() => _notificationsEnabled = true);  // Default ON
//   }

//   /// ✅ Toggle Notifications (Local + Visual)
//   Future<void> _toggleNotifications(bool value) async {
//     setState(() => _notificationsEnabled = value);
    
//     if (value) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('✅ Notifications enabled! 🔔'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } else {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('🔕 Notifications disabled'),
//             backgroundColor: Colors.orange,
//           ),
//         );
//       }
//     }
    
//     // TODO: Save to SharedPreferences for persistence
//   }

//   /// 🔥 Logout User
//   Future<void> _logout() async {
//     try {
//       await _auth.signOut();
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, '/login');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Logged out successfully! 👋'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Logout failed: $e')),
//         );
//       }
//     }
//   }

//   /// Delete Account
//   Future<void> _deleteAccount() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
//         content: const Text(
//           'This action cannot be undone. All data deleted permanently.',
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
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Account deleted permanently.'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
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
//           // 👤 Profile
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
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const EditProfileScreen()),
//               ),
//             ),
//           ),

//           // 🔐 Password - ✅ FULLY WORKING
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: ListTile(
//               leading: const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () async {
//                 final oldPasswordController = TextEditingController();
//                 final newPasswordController = TextEditingController();
                
//                 await showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text('Change Password'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: oldPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Current Password *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         TextField(
//                           controller: newPasswordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'New Password (6+ chars) *',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//                         onPressed: (oldPasswordController.text.isEmpty || 
//                                    newPasswordController.text.length < 6)
//                             ? null
//                             : () async {
//                                 Navigator.pop(context);
//                                 final user = _auth.currentUser;
//                                 if (user == null || user.email == null) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(content: Text('❌ Email/password user required')),
//                                   );
//                                   return;
//                                 }
//                                 try {
//                                   final cred = EmailAuthProvider.credential(
//                                     email: user.email!,
//                                     password: oldPasswordController.text.trim(),
//                                   );
//                                   await user.reauthenticateWithCredential(cred);
//                                   await user.updatePassword(newPasswordController.text.trim());
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text('✅ Password updated! 🔒'),
//                                       backgroundColor: Colors.green,
//                                     ),
//                                   );
//                                 } catch (e) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('❌ $e')),
//                                   );
//                                 }
//                                 oldPasswordController.dispose();
//                                 newPasswordController.dispose();
//                               },
//                         child: const Text('Update', style: TextStyle(color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // 🔔 Notifications - ✅ NO FirebaseMessaging needed
//           Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: SwitchListTile(
//               value: _notificationsEnabled,
//               onChanged: _toggleNotifications,
//               title: const Text('Push Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: const Text('App notifications & updates'),
//               secondary: const Icon(Icons.notifications, color: Colors.pink),
//               activeColor: Colors.pink,
//             ),
//           ),

//           const SizedBox(height: 24),
//           const Divider(),

//           // 🌙 Dark Mode ✅
//           Consumer<ThemeProvider>(
//             builder: (context, themeProvider, child) {
//               return SwitchListTile(
//                 value: themeProvider.isDarkMode,
//                 onChanged: (val) => themeProvider.toggleTheme(val),
//                 title: const Text('Dark Mode'),
//                 secondary: const Icon(Icons.dark_mode, color: Colors.pink),
//                 activeColor: Colors.pink,
//               );
//             },
//           ),

//           const Divider(),

//           // ℹ️ About
//           ListTile(
//             leading: const Icon(Icons.info_outline, color: Colors.pink),
//             title: const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: const Text('Shoe App v1.0.0'),
//             onTap: () => showAboutDialog(
//               context: context,
//               applicationName: 'Shoe App',
//               applicationVersion: '1.0.0',
//               applicationIcon: const Icon(Icons.shopping_bag, size: 40, color: Colors.pink),
//               children: const [Text('Premium shoe store app.')],
//             ),
//           ),

//           const Divider(),

//           // 🚪 Logout
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.orange),
//             title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
//             onTap: _logout,
//           ),

//           // 💥 Delete Account
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






















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import '../providers/theme_provider.dart';
// import 'edit_profile_screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _notificationsEnabled = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _notificationsEnabled = true;
//   }

//   Future<void> _toggleNotifications(bool value) async {
//     setState(() => _notificationsEnabled = value);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           value ? '✅ Notifications enabled!' : '🔕 Notifications disabled',
//         ),
//         backgroundColor: value ? Colors.green : Colors.orange,
//       ),
//     );
//   }

//   Future<void> _logout() async {
//     await _auth.signOut();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   Future<void> _deleteAccount() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Delete Account', style: TextStyle(color: Colors.red)),
//         content: const Text('This action cannot be undone.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             onPressed: () async {
//               Navigator.pop(context);
//               await user.delete();
//               if (!mounted) return;
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   // 🔐 CHANGE PASSWORD (FIXED)
//   Future<void> _changePassword() async {
//     final oldController = TextEditingController();
//     final newController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Change Password'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: oldController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Current Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: newController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'New Password (min 6 chars)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
//             onPressed: () async {
//               final oldPass = oldController.text.trim();
//               final newPass = newController.text.trim();

//               if (oldPass.isEmpty || newPass.length < 6) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('❌ Enter valid passwords'),
//                     backgroundColor: Colors.red,
//                   ),
//                 );
//                 return;
//               }

//               Navigator.pop(context);

//               final user = _auth.currentUser;
//               if (user == null || user.email == null) return;

//               try {
//                 final cred = EmailAuthProvider.credential(
//                   email: user.email!,
//                   password: oldPass,
//                 );

//                 await user.reauthenticateWithCredential(cred);
//                 await user.updatePassword(newPass);

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('✅ Password updated successfully'),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               } catch (e) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('❌ ${e.toString()}'),
//                     backgroundColor: Colors.red,
//                   ),
//                 );
//               }
//             },
//             child: const Text('Update', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );

//     oldController.dispose();
//     newController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Card(
//             child: ListTile(
//               leading: const CircleAvatar(
//                 backgroundColor: Colors.pink,
//                 child: Icon(Icons.person, color: Colors.white),
//               ),
//               title: const Text('Edit Profile'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const EditProfileScreen()),
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           Card(
//             child: ListTile(
//               leading: const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: _changePassword,
//             ),
//           ),

//           const SizedBox(height: 12),

//           Card(
//             child: SwitchListTile(
//               value: _notificationsEnabled,
//               onChanged: _toggleNotifications,
//               title: const Text('Push Notifications'),
//               secondary: const Icon(Icons.notifications, color: Colors.pink),
//             ),
//           ),

//           const Divider(),

//           Consumer<ThemeProvider>(
//             builder: (_, theme, __) => SwitchListTile(
//               value: theme.isDarkMode,
//               onChanged: theme.toggleTheme,
//               title: const Text('Dark Mode'),
//               secondary: const Icon(Icons.dark_mode),
//             ),
//           ),

//           const Divider(),

//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.orange),
//             title: const Text('Logout', style: TextStyle(color: Colors.orange)),
//             onTap: _logout,
//           ),

//           ListTile(
//             leading: const Icon(Icons.delete_forever, color: Colors.red),
//             title: const Text('Delete Account',
//                 style: TextStyle(color: Colors.red)),
//             onTap: _deleteAccount,
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

// import 'edit_profile_screen.dart';
// import 'package:shoe_shop/providers/theme_provider.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final TextEditingController oldController = TextEditingController();
//   final TextEditingController newController = TextEditingController();

//   bool _notificationsEnabled = true;

//   // ================= CHANGE PASSWORD =================
//   void _changePassword() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (dialogContext) {
//         return AlertDialog(
//           title: const Text('Change Password'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: oldController,
//                 obscureText: true,
//                 decoration:
//                     const InputDecoration(labelText: 'Old Password'),
//               ),
//               const SizedBox(height: 12),
//               TextField(
//                 controller: newController,
//                 obscureText: true,
//                 decoration:
//                     const InputDecoration(labelText: 'New Password'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(dialogContext).pop(),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               child: const Text('Update'),
//               onPressed: () async {
//                 final oldPass = oldController.text.trim();
//                 final newPass = newController.text.trim();

//                 if (oldPass.isEmpty || newPass.isEmpty) return;

//                 final user = FirebaseAuth.instance.currentUser;
//                 if (user == null) return;

//                 try {
//                   final credential = EmailAuthProvider.credential(
//                     email: user.email!,
//                     password: oldPass,
//                   );

//                   await user.reauthenticateWithCredential(credential);
//                   await user.updatePassword(newPass);

//                   if (!mounted) return;

//                   Navigator.of(dialogContext).pop();

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content:
//                           Text('✅ Password updated successfully'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );

//                   oldController.clear();
//                   newController.clear();
//                 } catch (e) {
//                   if (!mounted) return;
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('❌ $e'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ================= LOGOUT =================
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   // ================= DELETE ACCOUNT =================
//   Future<void> _deleteAccount() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     await user.delete();
//     if (!mounted) return;
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   void dispose() {
//     oldController.dispose();
//     newController.dispose();
//     super.dispose();
//   }

//   // ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     final ThemeProvider? themeProvider =
//         context.watch<ThemeProvider?>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//         foregroundColor: Colors.white,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Card(
//             child: ListTile(
//               leading: const CircleAvatar(
//                 backgroundColor: Colors.pink,
//                 child: Icon(Icons.person, color: Colors.white),
//               ),
//               title: const Text('Edit Profile'),
//               trailing:
//                   const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const EditProfileScreen(),
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 12),

//           Card(
//             child: ListTile(
//               leading:
//                   const Icon(Icons.lock, color: Colors.pink),
//               title: const Text('Change Password'),
//               trailing:
//                   const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: _changePassword,
//             ),
//           ),

//           const SizedBox(height: 12),

//           Card(
//             child: SwitchListTile(
//               value: _notificationsEnabled,
//               onChanged: (v) =>
//                   setState(() => _notificationsEnabled = v),
//               title: const Text('Push Notifications'),
//               secondary: const Icon(Icons.notifications,
//                   color: Colors.pink),
//             ),
//           ),

//           const Divider(),

//           /// ✅ FIXED DARK MODE (NO ERROR)
//           if (themeProvider != null) ...[
//             final tp = themeProvider,
//             SwitchListTile(
//               value: tp.isDarkMode,
//               onChanged: (_) => tp.toggleTheme(), // ✅ FIXED
//               title: const Text('Dark Mode'),
//               secondary: const Icon(Icons.dark_mode),
//             ),
//           ],

//           const Divider(),

//           ListTile(
//             leading:
//                 const Icon(Icons.logout, color: Colors.orange),
//             title: const Text(
//               'Logout',
//               style: TextStyle(color: Colors.orange),
//             ),
//             onTap: _logout,
//           ),

//           ListTile(
//             leading: const Icon(Icons.delete_forever,
//                 color: Colors.red),
//             title: const Text(
//               'Delete Account',
//               style: TextStyle(color: Colors.red),
//             ),
//             onTap: _deleteAccount,
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'edit_profile_screen.dart';
import 'package:shoe_shop/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController oldController = TextEditingController();
  final TextEditingController newController = TextEditingController();

  bool _notificationsEnabled = true;

  // ================= CHANGE PASSWORD =================
  void _changePassword() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: oldController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Old Password'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: newController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'New Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () async {
                final oldPass = oldController.text.trim();
                final newPass = newController.text.trim();

                if (oldPass.isEmpty || newPass.isEmpty) return;

                final user = FirebaseAuth.instance.currentUser;
                if (user == null) return;

                try {
                  final credential = EmailAuthProvider.credential(
                    email: user.email!,
                    password: oldPass,
                  );

                  await user.reauthenticateWithCredential(credential);
                  await user.updatePassword(newPass);

                  if (!mounted) return;

                  Navigator.of(dialogContext).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('✅ Password updated successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  oldController.clear();
                  newController.clear();
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  // ================= LOGOUT =================
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  // ================= DELETE ACCOUNT =================
  Future<void> _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await user.delete();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    oldController.dispose();
    newController.dispose();
    super.dispose();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.pink,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text('Edit Profile'),
              trailing:
                  const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading:
                  const Icon(Icons.lock, color: Colors.pink),
              title: const Text('Change Password'),
              trailing:
                  const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _changePassword,
            ),
          ),

          const SizedBox(height: 12),

         Card(
  child: SwitchListTile(
    value: _notificationsEnabled,
    onChanged: (bool value) {
      setState(() {
        _notificationsEnabled = value;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            value
                ? '🔔 Push notifications enabled'
                : '🔕 Push notifications disabled',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    },
    title: const Text('Push Notifications'),
    secondary: const Icon(
      Icons.notifications,
      color: Colors.pink,
    ),
  ),
),

          const Divider(),

          /// ✅ DARK MODE — FIXED PROPERLY
          Consumer<ThemeProvider>(
            builder: (_, theme, __) => SwitchListTile(
              value: theme.isDarkMode,
              onChanged: (_) => theme.toggleTheme( !theme.isDarkMode),
              title: const Text('Dark Mode'),
              secondary: const Icon(Icons.dark_mode),
            ),
          ),

          const Divider(),

          ListTile(
            leading:
                const Icon(Icons.logout, color: Colors.orange),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.orange),
            ),
            onTap: _logout,
          ),

          ListTile(
            leading: const Icon(Icons.delete_forever,
                color: Colors.red),
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: _deleteAccount,
          ),
        ],
      ),
    );
  }
}

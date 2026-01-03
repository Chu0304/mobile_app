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

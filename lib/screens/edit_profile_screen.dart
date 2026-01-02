// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _auth = FirebaseAuth.instance;
//   final _nameController = TextEditingController();
//   final _photoController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     final user = _auth.currentUser;
//     _nameController.text = user?.displayName ?? '';
//     _photoController.text = user?.photoURL ?? '';
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _photoController.dispose();
//     super.dispose();
//   }

//   Future<void> _updateProfile() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     try {
//       await user.updateDisplayName(_nameController.text.trim());
//       await user.updatePhotoURL(_photoController.text.trim());
//       await user.reload(); // Reload user to apply changes

//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Profile updated successfully!')),
//       );
//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to update profile: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         backgroundColor: Colors.pink,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Display Name',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _photoController,
//               decoration: const InputDecoration(
//                 labelText: 'Photo URL',
//                 prefixIcon: Icon(Icons.image),
//               ),
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pink,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shoe_shop/providers/auth_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _profileImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        _nameController.text = data['name'] ?? '';
        _phoneController.text = data['phone'] ?? '';
      } else {
        _nameController.text = user.displayName ?? '';
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _updateProfile() async {
    final user = _auth.currentUser;
    if (user == null || _nameController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);

    try {
      // Update Firestore
      await _firestore.collection('users').doc(user.uid).set({
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // Update Firebase Auth
      await user.updateDisplayName(_nameController.text.trim());
      await user.reload();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully! ✅'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Update failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _isLoading ? null : _updateProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Image
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null,
                child: _profileImage == null
                    ? const Icon(Icons.person, size: 60, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tap image to change photo',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Name Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: const Icon(Icons.person, color: Colors.pink),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
            const SizedBox(height: 16),

            // Phone Field
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone, color: Colors.pink),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),

            const SizedBox(height: 40),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text('Saving...'),
                        ],
                      )
                    : const Text(
                        'SAVE CHANGES',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}




// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _auth = FirebaseAuth.instance;
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _photoController = TextEditingController();
//   bool _loading = false;

//   @override
//   void initState() {
//     super.initState();
//     final user = _auth.currentUser;
//     _nameController.text = user?.displayName ?? '';
//     _emailController.text = user?.email ?? '';
//     _photoController.text = user?.photoURL ?? '';
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _photoController.dispose();
//     super.dispose();
//   }

//   Future<void> _updateProfile() async {
//     final user = _auth.currentUser;
//     if (user == null) return;

//     setState(() => _loading = true);

//     try {
//       // Update display name
//       await user.updateDisplayName(_nameController.text.trim());

//       // Update photo URL
//       await user.updatePhotoURL(_photoController.text.trim());

//       // Update email if changed
//       if (_emailController.text.trim() != user.email) {
//         await user.updateEmail(_emailController.text.trim());
//       }

//       await user.reload(); // Refresh user data

//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Profile updated successfully!')),
//       );
//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       String message = 'Failed to update profile';
//       if (e.code == 'requires-recent-login') {
//         message = 'Please re-login to update your email.';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = _auth.currentUser;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         backgroundColor: Colors.pink,
//       ),
//       body: _loading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // Profile photo preview
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: _photoController.text.isNotEmpty
//                         ? NetworkImage(_photoController.text)
//                         : null,
//                     child: _photoController.text.isEmpty
//                         ? const Icon(Icons.person, size: 50)
//                         : null,
//                   ),
//                   const SizedBox(height: 16),

//                   // Display Name
//                   TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Display Name',
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Email
//                   TextField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Photo URL
//                   TextField(
//                     controller: _photoController,
//                     decoration: const InputDecoration(
//                       labelText: 'Photo URL',
//                       prefixIcon: Icon(Icons.image),
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                   const SizedBox(height: 32),

//                   // Save button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _updateProfile,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       child: const Text(
//                         'Save Changes',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

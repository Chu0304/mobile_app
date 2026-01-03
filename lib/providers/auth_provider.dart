import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;

  /// ✅ Current logged-in user (USED BY PROFILE & CART)
  User? get user => _user;

  AuthProvider() {
    // 🔄 Auto-update UI when auth state changes
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  /// 🔐 Login - COMPLETE WEB-SAFE ERROR HANDLING
  Future<String?> login(String email, String password) async {
    try {
      // ✅ WEB-SPECIFIC VALIDATION (Prevents 400 errors)
      if (!email.contains('@') || password.length < 6) {
        return 'Invalid email or password format';
      }
      
      final result = await _auth.signInWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim(),
      );
      
      if (result.user == null) {
        return 'Login failed - no user found';
      }
      
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return _getLoginError(e.code);
    } catch (e) {
      return 'Network error - check connection';
    }
  }

  /// 🆕 Complete Signup with Name + Firestore Profile
  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // ✅ Client validation
      if (name.trim().isEmpty || email.trim().isEmpty || password.length < 6) {
        return 'Please fill all fields correctly';
      }

      // Create Firebase Auth user
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim(),
      );

      // ✅ Save complete user profile to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name.trim(),
        'email': email.trim().toLowerCase(),
        'createdAt': FieldValue.serverTimestamp(),
        'ordersCount': 0,
        'phone': '',
      }, SetOptions(merge: true));

      _user = userCredential.user;
      notifyListeners();
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return _getSignupError(e.code);
    } catch (e) {
      return 'Signup failed. Please try again.';
    }
  }

  /// 🚪 Logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('Logout error: $e');
    } finally {
      _user = null;
      notifyListeners();
    }
  }

  /// ✅ Login Error Messages
  String _getLoginError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-disabled':
        return 'Account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'invalid-credential':
        return 'Invalid email or password';
      default:
        return 'Login failed (${code})';
    }
  }

  /// ✅ Signup Error Messages
  String _getSignupError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email already registered';
      case 'weak-password':
        return 'Password must be 6+ characters';
      case 'invalid-email':
        return 'Invalid email format';
      default:
        return 'Signup failed (${code})';
    }
  }
}



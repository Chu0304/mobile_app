// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final _auth = FirebaseAuth.instance;

//   User? get user => _auth.currentUser;

//   Future<void> login(String email, String password) async {
//     await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     notifyListeners();
//   }

//   Future<void> logout() async {
//     await _auth.signOut();
//     notifyListeners();
//   }
// }



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Current user
//   User? get user => _auth.currentUser;

//   // Login method
//   Future<void> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Login failed';
//     }
//   }

//   // Signup method
//   Future<void> signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Signup failed';
//     }
//   }

//   // Logout method
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//       notifyListeners();
//     } catch (e) {
//       throw 'Logout failed';
//     }
//   }

//   Future<void> loginWithGoogle() async {}
// }







// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   /// ✅ Current logged-in user (USED BY PROFILE)
//   User? get user => _auth.currentUser;

//   AuthProvider() {
//     // 🔄 Auto-update UI when auth state changes
//     _auth.authStateChanges().listen((_) {
//       notifyListeners();
//     });
//   }

//   /// 🔐 Login
//   Future<void> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Login failed';
//     }
//   }

//   /// 🆕 Signup
//   Future<void> signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Signup failed';
//     }
//   }

//   /// 🚪 Logout
//   Future<void> logout() async {
//     await _auth.signOut();
//   }

//   /// 🌐 Google login (safe placeholder)
//   Future<void> loginWithGoogle() async {
//     throw UnimplementedError('Google Sign-In not implemented yet');
//   }
// }














// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? _user;

//   /// ✅ Current logged-in user (USED BY PROFILE & CART)
//   User? get user => _user;

//   AuthProvider() {
//     // 🔄 Auto-update UI when auth state changes
//     _auth.authStateChanges().listen((user) {
//       _user = user;
//       notifyListeners();
//     });
//   }

//   /// 🔐 Login
//   Future<String?> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password,
//       );
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return e.message ?? 'Login failed';
//     }
//   }

//   /// 🆕 Complete Signup with Name + Firestore Profile
//   Future<String?> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       // Create Firebase Auth user
//       final userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email.trim(),
//         password: password,
//       );

//       // ✅ Save complete user profile to Firestore
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'name': name.trim(),
//         'email': email.trim(),
//         'createdAt': FieldValue.serverTimestamp(),
//         'ordersCount': 0,
//       });

//       _user = userCredential.user;
//       notifyListeners();
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return _getErrorMessage(e.code);
//     }
//   }

//   /// 🚪 Logout
//   Future<void> logout() async {
//     await _auth.signOut();
//     _user = null;
//     notifyListeners();
//   }

//   String _getErrorMessage(String code) {
//     switch (code) {
//       case 'email-already-in-use':
//         return 'Email already registered';
//       case 'weak-password':
//         return 'Password must be 6+ characters';
//       case 'invalid-email':
//         return 'Invalid email format';
//       case 'user-not-found':
//         return 'User not found';
//       case 'wrong-password':
//         return 'Wrong password';
//       default:
//         return 'Authentication failed: ${code}';
//     }
//   }
// }





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? _user;

//   /// ✅ Current logged-in user (USED BY PROFILE & CART)
//   User? get user => _user;

//   AuthProvider() {
//     // 🔄 Auto-update UI when auth state changes
//     _auth.authStateChanges().listen((user) {
//       _user = user;
//       notifyListeners();
//     });
//   }

//   /// 🔐 Login - FIXED ✅ Complete error handling
//   Future<String?> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email.trim().toLowerCase(),  // ✅ Normalize email
//         password: password.trim(),
//       );
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return _getLoginError(e.code);  // ✅ Specific messages
//     } catch (e) {
//       return 'Login failed: ${e.toString()}';
//     }
//   }

//   /// 🆕 Complete Signup with Name + Firestore Profile
//   Future<String?> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       if (name.trim().isEmpty || email.trim().isEmpty || password.isEmpty) {
//         return 'All fields are required';
//       }

//       // Create Firebase Auth user
//       final userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email.trim().toLowerCase(),  // ✅ Normalize
//         password: password.trim(),
//       );

//       // ✅ Save complete user profile to Firestore
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'name': name.trim(),
//         'email': email.trim().toLowerCase(),
//         'createdAt': FieldValue.serverTimestamp(),
//         'ordersCount': 0,
//         'phone': '',
//       }, SetOptions(merge: true));

//       _user = userCredential.user;
//       notifyListeners();
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return _getErrorMessage(e.code);
//     } catch (e) {
//       return 'Signup failed: ${e.toString()}';
//     }
//   }

//   /// 🚪 Logout
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       debugPrint('Logout error: $e');
//     } finally {
//       _user = null;
//       notifyListeners();
//     }
//   }

//   /// ✅ Login-specific error messages
//   String _getLoginError(String code) {
//     switch (code) {
//       case 'user-not-found':
//         return 'No account found with this email';
//       case 'wrong-password':
//         return 'Incorrect password';
//       case 'invalid-email':
//         return 'Invalid email format';
//       case 'user-disabled':
//         return 'Account has been disabled';
//       case 'too-many-requests':
//         return 'Too many failed attempts. Try again in 1 minute';
//       default:
//         return e.message ?? 'Login failed';
//     }
//   }

//   /// ✅ Signup-specific error messages
//   String _getErrorMessage(String code) {
//     switch (code) {
//       case 'email-already-in-use':
//         return 'Email already registered';
//       case 'weak-password':
//         return 'Password must be 6+ characters';
//       case 'invalid-email':
//         return 'Invalid email format';
//       default:
//         return 'Signup failed: ${code}';
//     }
//   }
// }






// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? _user;

//   /// ✅ Current logged-in user (USED BY PROFILE & CART)
//   User? get user => _user;

//   AuthProvider() {
//     // 🔄 Auto-update UI when auth state changes
//     _auth.authStateChanges().listen((user) {
//       _user = user;
//       notifyListeners();
//     });
//   }

//   /// 🔐 Login - COMPLETE ERROR HANDLING
//   Future<String?> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email.trim().toLowerCase(),
//         password: password.trim(),
//       );
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return _getLoginError(e.code);  // ✅ Use error code mapping
//     } catch (e) {
//       return 'Login failed. Please try again.';
//     }
//   }

//   /// 🆕 Complete Signup with Name + Firestore Profile
//   Future<String?> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       // ✅ Client validation
//       if (name.trim().isEmpty || email.trim().isEmpty || password.length < 6) {
//         return 'Please fill all fields correctly';
//       }

//       // Create Firebase Auth user
//       final userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email.trim().toLowerCase(),
//         password: password.trim(),
//       );

//       // ✅ Save complete user profile to Firestore
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'name': name.trim(),
//         'email': email.trim().toLowerCase(),
//         'createdAt': FieldValue.serverTimestamp(),
//         'ordersCount': 0,
//         'phone': '',
//       }, SetOptions(merge: true));

//       _user = userCredential.user;
//       notifyListeners();
//       return null; // Success
//     } on FirebaseAuthException catch (e) {
//       return _getSignupError(e.code);
//     } catch (e) {
//       return 'Signup failed. Please try again.';
//     }
//   }

//   /// 🚪 Logout
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       debugPrint('Logout error: $e');
//     } finally {
//       _user = null;
//       notifyListeners();
//     }
//   }

//   /// ✅ Login Error Messages
//   String _getLoginError(String code) {
//     switch (code) {
//       case 'user-not-found':
//         return 'No account found with this email';
//       case 'wrong-password':
//         return 'Incorrect password';
//       case 'invalid-email':
//         return 'Invalid email format';
//       case 'user-disabled':
//         return 'Account has been disabled';
//       case 'too-many-requests':
//         return 'Too many attempts. Try again later';
//       default:
//         return 'Login failed (${code})';
//     }
//   }

//   /// ✅ Signup Error Messages
//   String _getSignupError(String code) {
//     switch (code) {
//       case 'email-already-in-use':
//         return 'Email already registered';
//       case 'weak-password':
//         return 'Password must be 6+ characters';
//       case 'invalid-email':
//         return 'Invalid email format';
//       default:
//         return 'Signup failed (${code})';
//     }
//   }
// }






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



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   /// ✅ Current logged-in user
//   User? get user => _auth.currentUser;

//   AuthProvider() {
//     // 🔄 Listen to auth state changes and update UI
//     _auth.authStateChanges().listen((_) {
//       notifyListeners();
//     });
//   }

//   /// 🔐 Email/password login
//   Future<void> login(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Login failed';
//     }
//   }

//   /// 🆕 Email/password signup
//   Future<void> signUp(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       throw e.message ?? 'Signup failed';
//     }
//   }

//   /// 🚪 Logout
//   Future<void> logout() async {
//     try {
//       // Sign out from Firebase
//       await _auth.signOut();
//       // Sign out from Google if signed in
//       if (await _googleSignIn.isSignedIn()) {
//         await _googleSignIn.signOut();
//       }
//     } catch (e) {
//       throw 'Logout failed: $e';
//     }
//   }

//   /// 🌐 Google Sign-In
//   Future<void> loginWithGoogle() async {
//     try {
//       // Start Google Sign-In
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         throw 'Google sign-in canceled';
//       }

//       // Obtain Google auth details
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       // Create Firebase credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in with Firebase
//       await _auth.signInWithCredential(credential);

//       notifyListeners();
//     } catch (e) {
//       throw 'Google sign-in failed: $e';
//     }
//   }
// }

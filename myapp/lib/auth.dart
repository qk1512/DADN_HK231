import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Error: $e");
      return null; // Handle login failure or return an error message if needed
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Error: $e");
      return null; // Handle registration failure or return an error message if needed
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get the currently signed-in user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Send a password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Error: $e");
      // Handle the error or return an error message if needed
    }
  }
}

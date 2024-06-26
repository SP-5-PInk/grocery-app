import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationService {
    final FirebaseAuth _firebaseAuth;
    AuthenticationService(this._firebaseAuth);

    Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

    Future<String> signIn({required String email, required String password}) async {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
          return "Signed In";
      } on FirebaseAuthException catch (e) {
              // Handle sign-in errors
      print("Sign-in error: ${e.message}");
        return e.message.toString();
      }
    }

    Future<void> signOut() async {
      await _firebaseAuth.signOut();
    }
}
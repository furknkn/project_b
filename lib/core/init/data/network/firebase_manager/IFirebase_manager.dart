import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseManager {
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> resetPassword(String email);
  Future<void> signOut();
}

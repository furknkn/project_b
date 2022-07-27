import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project_b/core/constants/_constants_exports.dart';
import 'package:project_b/core/init/data/network/firebase_manager/IFirebase_manager.dart';

class FirebaseManager implements IFirebaseManager {
  static final FirebaseManager _instance = FirebaseManager._init();
  factory FirebaseManager() {
    return _instance;
  }
  static FirebaseManager get instance => _instance;
  FirebaseManager._init();
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");

  @override
  Future<User?> getCurrentUser() async {
    return await firebaseAuth.getRedirectResult().then((value) => value.user);
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ApplicationConstants.userId = user!.uid;
        user = value.user;
        return value.user;
      });
    } catch (e) {}
    return null;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        user = value.user;
        ApplicationConstants.userId = user!.uid;
        dbRef
            .child(user!.uid)
            .set({"email": email, "name": password}).then((value) => true);
        return value.user;
      });
    } catch (e) {}
    return null;
  }

  @override
  Future<void> resetPassword(String email) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

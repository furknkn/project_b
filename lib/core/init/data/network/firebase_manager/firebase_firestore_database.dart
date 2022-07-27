import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project_b/core/init/data/network/firebase_manager/firebase_user_manager.dart';

import '../../../../_core_exports.dart';
import 'Ifirebase_firestore_database_service_managment.dart';

class FireStoreDatabaseManager implements IFireStoreManager {
  static final FireStoreDatabaseManager _instance =
      FireStoreDatabaseManager._init();
  factory FireStoreDatabaseManager() {
    return _instance;
  }
  final FirebaseManager _firebaseManager = FirebaseManager.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance
      .reference()
      .child("Users")
      .child(ApplicationConstants.userId);
  static FireStoreDatabaseManager get instance => _instance;

  FireStoreDatabaseManager._init();
  @override
  Future<bool> addFavorite(Map<String, Object> data) async {
    try {
      String? _userId = ApplicationConstants.userId;
      if (_userId.isEmpty) return false;
      await dbRef
          .child("favoriteFilm")
          .child(data["imdbID"].toString())
          .update(data);

      return true;
      // ignore: empty_catches
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteFavorite(String filmId) async {
    try {
      String? _userId = ApplicationConstants.userId;
      if (_userId.isEmpty) return false;
      await dbRef.child("favoriteFilm").child(filmId).remove();

      return true;
      // ignore: empty_catches
    } catch (e) {}
    return false;
  }

  @override
  Future<DataSnapshot?> getFavorite() async {
    try {
      String? _userId = ApplicationConstants.userId;
      if (_userId.isEmpty) return null;
      return await dbRef.child("favoriteFilm").get();

      // ignore: empty_catches
    } catch (e) {}
    return null;
  }
}

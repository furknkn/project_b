import 'package:firebase_database/firebase_database.dart';

abstract class IFireStoreManager {
  Future<bool> addFavorite(Map<String, Object> filmId);
  Future<bool> deleteFavorite(String filmId);
  Future<DataSnapshot?> getFavorite();
}

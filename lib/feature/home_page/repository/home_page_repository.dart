import 'dart:convert';

import 'package:project_b/core/init/_init_exports.dart';
import 'package:project_b/core/shared_models/film.dart';
import 'package:project_b/feature/home_page/model/SearchResponseModel.dart';
import 'package:project_b/feature/home_page/model/search.dart';

import '../../../core/init/data/network/firebase_manager/firebase_firestore_database.dart';

class HomePageRepository {
  Future<List<Film>> fetchFilmList({required String title}) async {
    SearchResponseModel _searchResponseModel = SearchResponseModel(lFilm: []);
    _searchResponseModel = await BaseService.instance
        .post("s=" + title, model: _searchResponseModel, param: null);
    return _searchResponseModel.lFilm!;
  }

  Future<List<Film>> getFirebaseFilmList() async {
    List<Film> _listFavoriteFilm = [];
    Map<Object?, Object?>? data;
    var dataSnapshot = (await FireStoreDatabaseManager.instance.getFavorite());

    data = dataSnapshot?.value as Map<Object?, Object?>?;
    data?.forEach((key, value) {
      var json = jsonEncode(value);
      _listFavoriteFilm.add(Film().fromModel(json));
    });
    return _listFavoriteFilm;
  }

  void addLocaleSearc(Search search, String value) {
    if (search.listSearch.length == 10) {
      search.listSearch.remove(search.listSearch[0]);
    }
    search.listSearch.add(value);
    HiveManager.instance.addBox(key: "search", object: search);
    search =
        HiveManager.instance.getBox(key: "search") ?? Search(listSearch: []);
  }
}

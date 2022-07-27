import 'dart:convert';

import 'package:project_b/core/_core_exports.dart';
import 'package:project_b/core/constants/enums/sort_enum.dart';
import 'package:project_b/core/constants/enums/type_enum.dart';
import 'package:project_b/core/shared_models/film.dart';
import 'package:project_b/feature/home_page/model/search.dart';
import 'package:project_b/feature/home_page/repository/home_page_repository.dart';
import 'package:project_b/generated/locale_keys.g.dart';
import '../../../core/init/data/network/firebase_manager/firebase_firestore_database.dart';
import '../model/SearchResponseModel.dart';

class HomePageViewModel with ChangeNotifier {
  bool isLoad = false;
  int radioGroupVal = 0;
  final TextEditingController txtSearchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController txtFilterController = TextEditingController();
  final SearchResponseModel searchResponseModel =
      SearchResponseModel(lFilm: []);
  List<Film> listFilmFilter = [];
  List<Film> listFavoriteFilm = [];
  Search search =
      HiveManager.instance.getBox(key: "search") ?? Search(listSearch: []);

  void changeIsLoad() {
    isLoad = !isLoad;
    notifyListeners();
  }

  void changeRadio(int val) {
    radioGroupVal = val;
    notifyListeners();
  }

  void filterYear() {
    listFilmFilter = searchResponseModel.lFilm!
        .where((element) => element.year == txtFilterController.text)
        .toList();
  }

  void filterTitle() {
    listFilmFilter = searchResponseModel.lFilm!
        .where((element) => element.title!
            .toUpperCase()
            .contains(txtFilterController.text.toUpperCase()))
        .toList();
  }

  void filterType(TypeEnum typeEnum) {
    switch (typeEnum) {
      case TypeEnum.MOVIE:
        listFilmFilter = searchResponseModel.lFilm!
            .where((element) => element.type == "movie")
            .toList();
        break;
      case TypeEnum.SERIES:
        listFilmFilter = searchResponseModel.lFilm!
            .where((element) => element.type == "series")
            .toList();
        break;
      case TypeEnum.EPISODE:
        listFilmFilter = searchResponseModel.lFilm!
            .where((element) => element.type == "episode")
            .toList();
        break;
      default:
    }
  }

  void filter(int? val) {
    switch (val ?? radioGroupVal) {
      case 0:
        filterTitle();
        break;
      case 1:
        filterYear();
        break;
      case 2:
        filterType(TypeEnum.MOVIE);
        break;
      case 3:
        filterType(TypeEnum.EPISODE);
        break;
      case 4:
        filterType(TypeEnum.SERIES);
        break;
      default:
    }
    notifyListeners();
  }

  void sort(SortEnum sortEnum) {
    switch (sortEnum) {
      case SortEnum.AZ:
        listFilmFilter.sort(
          (a, b) => a.title!.toUpperCase().compareTo(b.title!.toUpperCase()),
        );
        break;
      case SortEnum.ZA:
        listFilmFilter.sort(
          (a, b) => b.title!.toUpperCase().compareTo(a.title!.toUpperCase()),
        );
        break;
      case SortEnum.YEAR:
        listFilmFilter.sort(
          (a, b) => a.year!.toUpperCase().compareTo(b.year!.toUpperCase()),
        );
        break;
      default:
    }
    notifyListeners();
  }

  Future<void> getFavoriteList() async {
    changeIsLoad();
    listFavoriteFilm = await HomePageRepository().getFirebaseFilmList();
    changeIsLoad();
  }

  void localSearchAdd() {}

  Future<void> fetchFilmList() async {
    localSearchAdd();
    changeIsLoad();
    searchResponseModel.lFilm = await HomePageRepository()
        .fetchFilmList(title: txtSearchController.text);
    listFilmFilter = searchResponseModel.lFilm!;
    if (searchResponseModel.lFilm!.isEmpty) {
      changeIsLoad();
    } else {
      for (var searcheList in listFilmFilter) {
        for (var favoriteFilm in listFavoriteFilm) {
          if (searcheList.imdbID == favoriteFilm.imdbID) {
            searcheList.star = true;
          }
        }
      }
      txtSearchController.clear();
      changeIsLoad();

      NavigationService.instance
          .navigateToPage(path: NavigationConstants.SEARCH_PAGE);
    }
  }

  Future<void> addFavorite(Film film) async {
    film.star = true;
    if (await FireStoreDatabaseManager.instance.addFavorite(film.toMap())) {
    } else {
      film.star = false;
      ErrorSnackBar().showMessageSnackBar(LocaleKeys.emptyWarning.locale);
    }
    getFavoriteList();
    notifyListeners();
  }

  Future<void> removeFavorite(Film film) async {
    if (await FireStoreDatabaseManager.instance.deleteFavorite(film.imdbID!)) {
      film.star = false;
    } else {
      ErrorSnackBar().showMessageSnackBar(LocaleKeys.emptyWarning.locale);
    }
    getFavoriteList();
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:project_b/core/_core_exports.dart';
import 'package:project_b/core/shared_models/film.dart';

class SearchResponseModel extends BaseModel {
  List<Film>? lFilm;
  String? totalResults;
  String? response;

  SearchResponseModel({this.lFilm, this.totalResults, this.response});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }
  @override
  fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      lFilm = <Film>[];
      json['Search'].forEach((v) {
        lFilm!.add(Film.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];

    return this;
  }

  @override
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return jsonEncode(data);
  }
}

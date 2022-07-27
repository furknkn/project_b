import 'dart:convert';

import 'package:project_b/core/_core_exports.dart';

class Film extends BaseModel implements Comparable {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;
  late bool star;

  Film(
      {this.title,
      this.year,
      this.imdbID,
      this.type,
      this.poster,
      this.star = false});

  Film.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }
  @override
  fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json["Type"];
    poster = json["Poster"];
    star = false;

    return this;
  }

  fromModel(String json) {
    var _json = jsonDecode(json);
    title = _json['Title'];
    year = _json['Year'];
    imdbID = _json['imdbID'];
    type = _json["Type"];
    poster = _json["Poster"];
    star = _json["star"];

    return this;
  }

  @override
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Poster'] = poster;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    return jsonEncode(data);
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = <String, Object>{};
    data['Title'] = title!;
    data['Year'] = year!;
    data['Poster'] = poster!;
    data['imdbID'] = imdbID!;
    data['Type'] = type!;
    data['star'] = star;
    return data;
  }

  @override
  int compareTo(other) {
    return type!.compareTo(other.name);
  }
}

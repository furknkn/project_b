import 'dart:convert';

import 'package:project_b/core/_core_exports.dart';

import 'Rating.dart';

class FilmDetail extends BaseModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Rating>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dVD;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  FilmDetail(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.ratings,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.dVD,
      this.boxOffice,
      this.production,
      this.website,
      this.response});

  FilmDetail.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }
  @override
  fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    rated = json['rated'];
    released = json['released'];
    runtime = json['runtime'];
    genre = json['genre'];
    director = json['director'];
    writer = json['writer'];
    actors = json['actors'];
    plot = json['plot'];
    language = json['language'];
    country = json['country'];
    awards = json["awards"];
    country = json['poster'];
    ratings = json["ratings"];
    metascore = json['metascore'];
    imdbRating = json["imdbRating"];
    imdbVotes = json["imdbVotes"];
    imdbID = json['imdbID'];
    type = json["type"];
    dVD = json['dVD'];
    boxOffice = json["boxOffice"];
    production = json['production'];
    website = json["website"];
    website = json['website'];
    response = json["response"];

    return this;
  }

  @override
  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Country'] = country;
    data['Awards'] = awards;
    data['Poster'] = poster;
    if (ratings != null) {
      data['Ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['Metascore'] = metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['DVD'] = dVD;
    data['BoxOffice'] = boxOffice;
    data['Production'] = production;
    data['Website'] = website;
    data['Response'] = response;
    return jsonEncode(data);
  }
}

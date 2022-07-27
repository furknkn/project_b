import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../_core_exports.dart';

class BaseService {
  static BaseService? _instance;
  static BaseService get instance {
    _instance ??= BaseService._init();
    return _instance!;
  }

  BaseService._init();

  Future<dynamic> get<T extends BaseModel>(String path,
      {required BaseModel model}) async {
    try {
      var url = Uri.parse("${ApplicationConstants.BASE_URL}$path");
      final response = await http.get(url, headers: {});
      var body = jsonDecode(response.body);
      switch (response.statusCode) {
        case HttpStatus.ok:
          {
            if (body["Error"] != null) {
              ErrorSnackBar().showMessageSnackBar(body["Error"].toString());
              return model;
            }
            return jsonBodyParse(model, body);
          }
        case 400:
          return ErrorSnackBar().showMessageSnackBar(body["errors"].toString());
        default:
          return ErrorSnackBar()
              .showMessageSnackBar(response.statusCode.toString());
      }
    } catch (e) {
      ErrorSnackBar().showMessageSnackBar(e.toString());
    }
  }

  Future<dynamic> post<T extends BaseModel>(String path,
      {required BaseModel model, required BaseModel? param}) async {
    try {
      var url = Uri.parse("${ApplicationConstants.BASE_URL}$path");
      final response = await http.post(url,
          body: param?.toJson(), headers: {"Accept": "application/json"});
      var body = jsonDecode(response.body);
      switch (response.statusCode) {
        case HttpStatus.ok:
          {
            if (body["Error"] != null) {
              ErrorSnackBar().showMessageSnackBar(body["Error"].toString());
              return model;
            }
            return jsonBodyParse(model, body);
          }
        case 400:
          return ErrorSnackBar().showMessageSnackBar(body["Error"].toString());
        default:
          return ErrorSnackBar()
              .showMessageSnackBar(response.statusCode.toString());
      }
    } catch (e) {
      ErrorSnackBar().showMessageSnackBar(e.toString());
    }
  }
}

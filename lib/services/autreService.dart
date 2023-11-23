import 'package:dio/dio.dart' as Dio;

import 'package:etransit/data/Annonce.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:flutter/material.dart';

class AutreService extends ChangeNotifier {
  List<dynamic> _vile = [];
  List<dynamic> get viles => _vile;

  List<dynamic> _quartier = [];
  List<dynamic> get quartier => _quartier;

  Future<List<dynamic>> getVile() async {
    Dio.Response response = await dio().get(
      "/aeroport/all",
    );

    if (response.statusCode == 200) {
      final parsed = response.data["data"];

      _vile = parsed;

      notifyListeners();
      return parsed;
    } else {
      print(response.statusCode);
      throw Exception(
          'Impossible de charger les données ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getQuartier() async {
    Dio.Response response = await dio().get(
      "/quartier/all",
    );

    if (response.statusCode == 200) {
      final parsed = response.data["data"];

      _quartier = parsed;

      notifyListeners();
      return _quartier;
    } else {
      print(response.statusCode);
      throw Exception(
          'Impossible de charger les données ${response.statusCode}');
    }
  }
}

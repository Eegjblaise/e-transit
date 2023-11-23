import 'package:dio/dio.dart' as Dio;

import 'package:etransit/data/Annonce.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:flutter/material.dart';

class AnnoncesService extends ChangeNotifier {
  List<Annonce> _annonce = [];
  List<Annonce> get annonces => _annonce;
  Future<List<Annonce>> getAnnonce() async {
    Dio.Response response = await dio().get(
      "/annonce/all/",
    );

    if (response.statusCode == 200) {
      final parsed = response.data["data"];

      try {
        _annonce =
            parsed.map<Annonce>((json) => Annonce.fromJson(json)).toList();
      } catch (e) {
        print(e);
      }

      notifyListeners();
      return parsed.map<Annonce>((json) => Annonce.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      throw Exception(
          'Impossible de charger les données ${response.statusCode}');
    }
  }

  Future addAnnonce(annonce) async {
    Dio.Response response = await dio().post("/annonce/add", data: annonce);

    if (response.statusCode == 200) {
      final parsed = response.data;

      notifyListeners();
      return parsed;
    } else {
      print(response.statusCode);
      throw Exception(
          'Impossible de charger les données ${response.statusCode}');
    }
  }
}

dynamic annone = {
  "jour": "7 Décembre 2023",
  "ViledepId": 4,
  "VilearivId": 6,
  "PaysArivId": 2,
  "PaysdepId": 3,
  "nbKilo": "120",
  "prixKilo": "14",
  "detailKilo": 1,
  "photo": "hjjjj",
  "verifier": 0,
  "payId": 1,
  "userId": 1,
  "jourReser": [
    {"nom": "lundi", "etat": false},
    {"nom": "Mardie", "etat": false},
    {"nom": "Mercredi", "etat": false}
  ],
  "listArticle": [
    {"nom": "Electro-menager", "prix": "10", "etat": false},
    {"nom": "Vêtements/Chaussures", "prix": "10", "etat": false},
    {"nom": "Evelope", "prix": "7", "etat": false}
  ]
};

import 'package:etransit/data/User.dart';

class Annonce {
  int? id;
  String? jour;
  Map? Viledep;
  Map? Vileariv;
  String? nbKilo;
  int? detailKilo;
  int? verifier;
  String? prixKilo;
  User user;
  Map? Paysdep;
  Map? PaysAriv;

  Annonce(
      {required this.id,
      required this.jour,
      required this.Viledep,
      required this.Vileariv,
      required this.nbKilo,
      required this.verifier,
      required this.detailKilo,
      required this.user,
      required this.PaysAriv,
      required this.prixKilo,
      required this.Paysdep});
  dynamic toJson() => {
        "id": 1,
        "jour": "9 Décembre 2023",
        "vileDep": null,
        "vileAriv": null,
        "nbKilo": "120",
        "prixKilo": "14",
        "detailKilo": 0,
        "photo": "hjjjj",
        "verifier": 0,
        "PaysdepId": 2,
        "PaysArivId": 1,
        "ViledepId": 6,
        "VilearivId": 2,
        "userId": 1,
        "user": {
          "id": 1,
          "nom": "test",
          "email": "kamga@gmail.com",
          "tel": 612903496,
          "photo": "upload/user/1699005267221.png",
          "carteRect": "",
          "carteVers": "",
          "password": "",
          "createdAt": "2023-11-03T09:54:27.000Z",
          "updatedAt": "2023-11-03T09:54:27.000Z"
        },
        "Paysdep": {
          "id": 2,
          "titre": "Cameroun",
          "image": "upload/pays/1699004477669.png",
          "createdAt": "2023-11-03T09:41:17.000Z",
          "updatedAt": "2023-11-03T09:41:17.000Z"
        },
        "PaysAriv": {
          "id": 1,
          "titre": "France",
          "image": "upload/pays/1699004177846.png",
          "createdAt": "2023-11-03T09:36:17.000Z",
          "updatedAt": "2023-11-03T09:36:17.000Z"
        },
        "Viledep": {
          "id": 6,
          "pays": null,
          "titre": "Yaoundé-Nsimalen",
          "createdAt": "2023-11-03T09:53:46.000Z",
          "updatedAt": "2023-11-03T09:53:46.000Z",
          "payId": 2
        },
        "Vileariv": {
          "id": 2,
          "pays": null,
          "titre": "Paris-Charles de Gaulle",
          "createdAt": "2023-11-03T09:47:26.000Z",
          "updatedAt": "2023-11-03T09:47:26.000Z",
          "payId": 1
        }
      };
  factory Annonce.fromJson(Map<String, dynamic> json) => Annonce(
      PaysAriv: json["PaysAriv"],
      Paysdep: json["Paysdep"],
      id: json["id"],
      jour: json["jour"],
      Viledep: json["Viledep"],
      Vileariv: json["Vileariv"],
      nbKilo: json['nbKilo'],
      verifier: json["verifier"],
      detailKilo: json["detailKilo"],
      prixKilo: json["prixKilo"],
      user: User.fromJson(json["user"]));
}

import 'package:etransit/services/DioClient.dart';

class User {
  int? id;
  String? nom;
  String? email;
  String? tel;
  String? photo;
  String? carteRect;
  String? carteVers;
  String? password;
  String? createdAt;
  String? passeport;
  User(
      {required this.id,
      required this.nom,
      required this.email,
      required this.tel,
      required this.password,
      this.carteRect,
      this.carteVers,
      this.createdAt,
      this.passeport,
      required this.photo});
  dynamic toJson() => {
        "passeport": passeport,
        "id": id,
        "nom": nom,
        "email": email,
        "tel": tel,
        "password": password,
        "carteRect": carteRect,
        "carteVers": carteVers,
        "photo": photo
      };
  factory User.fromJson(Map<String, dynamic> json) => User(
      passeport: json["passeport"],
      id: json["id"],
      nom: json["nom"],
      email: json["email"],
      tel: json["tel"],
      password: json["password"],
      carteRect: json["carteRect"],
      carteVers: json["carteVers"],
      createdAt: json["createdAt"],
      photo: json["photo"]);
}

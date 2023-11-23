import 'package:dio/dio.dart' as Dio;
import 'package:etransit/data/User.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  Future<SharedPreferences> sharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref;
  }

  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isOpen = false;
  bool _istel = false;
  User? get currentUser => _currentUser;
  int? _tabindex = 0;
  int? get tabindex => _tabindex;
  String? solde;
  void setIndex(int index) {
    _tabindex = index;
    notifyListeners();
  }

  bool get authenticate {
    //logout();
    sharedPreferences().then((value) {
      if (json.decode("${value.getString("user")}")['data'] != null) {
        // print(value.getString("user"));
        _currentUser = User.fromJson(
            json.decode("${value.getString("user")}")['data'] ?? {});
        this._isLoggedIn = User.fromJson(
                    json.decode("${value.getString("user")}")['data'] ?? {}) ==
                null
            ? false
            : true;

        notifyListeners();
      }
    });

    return this._isLoggedIn;
  }

  bool get isOpen {
    sharedPreferences().then((value) {
      if (json.decode("${value.getBool("open")}") != null) {
        this._isOpen = json.decode("${value.getBool("open")}");
        //print(_isOpen);
        notifyListeners();
      }
    });
    return this._isOpen;
  }

  bool get tel {
    sharedPreferences().then((value) {
      if (json.decode("${value.getString("tel")}") != null) {
        this._istel =
            json.decode("${value.getString("tel")}") != null ? true : false;
        //print(_isOpen);
        notifyListeners();
      }
    });
    return this._istel;
  }

  Future login(Map credentials) async {
    print(this._isLoggedIn);
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio().post("/user/login", data: credentials);
    // print(response.toString());
    print(response.data["data"]);
    if (json.decode(response.toString())['data'] != null) {
      User user = User.fromJson(json.decode(response.toString()));
      await pref.setString("user", response.toString());

      this._isLoggedIn = true;

      notifyListeners();
    }

    print(json.decode(response.toString()));

    notifyListeners();
    return json.decode(response.toString())['Message'];
  }

  Future sendRaport(Map credentials) async {
    Dio.Response response =
        await dio().post("Collecteur/SendRequestSupport", data: credentials);
    return json.decode(response.toString());
  }

  Future loginWithBiometric(Map credentials) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Dio.Response response = await dio()
        .post("Authentication/AuthenticateWithFingerPrint", data: credentials);
    print(response.toString());
    if (json.decode(response.toString())['Message'] == "Success") {
      User user = User.fromJson(json.decode(response.toString())['Info']);
      bool a = authenticate;
      await pref.setString("user", response.toString());
      // await pref.setBool("open", true);

      notifyListeners();
    }

    print(json.decode(response.toString()));
    this._isLoggedIn = true;

    notifyListeners();
    return json.decode(response.toString())['Message'];
  }

/*
 User? userFrombd(User user) {
    return user.data == null ? null : User(data: user.data);
  }
  static Stream<User>  utilisateur {
    return auth.login(credentials).then(userFrombd);
  } */
  Future register(
    User data,
  ) async {
    Dio.FormData user = Dio.FormData.fromMap({
      "nom": data.nom,
      "email": data.email,
      "tel": data.tel,
      "password": data.password,
      "carteRect": await Dio.MultipartFile.fromFile(data.carteRect!),
      "carteVers": await Dio.MultipartFile.fromFile(data.carteVers!),
      "photo": await Dio.MultipartFile.fromFile(data.photo!)
    });

    Dio.Response response = await dio().post("/user/register", data: user);

    print(json.decode(response.toString())["Message"]);

    print(response);

    return json.decode(response.toString())["Message"];
  }

  Future resendCodeValidation(Map data) async {
    Dio.Response response =
        await dio().post("Authentication/SendRegistrationCode", data: data);
    print(response.toString());
    print(json.decode(response.toString())["Message"]);

    return json.decode(response.toString())["Message"];
  }

  Future askResetPass(Map data) async {
    Dio.Response response =
        await dio().post("Authentication/AskResetPass", data: data);
    print(response.toString());
    // print(json.decode(response.toString())["Message"]);

    return response.data;
  }

  Future ResetPass(Map data) async {
    Dio.Response response =
        await dio().post("Authentication/ResetPass", data: data);
    print(response.toString());
    // print(json.decode(response.toString())["Message"]);

    return json.decode(response.toString())["message"];
  }

  Future validation(Map data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Dio.Response response =
        await dio().post("Authentication/verifiedAccount", data: data);
    print("test" + response.toString());

    notifyListeners();

    return json.decode(response.toString())["message"];
  }

  List<User> decodeFruit(responseBody) {
    final parsed = json.decode(responseBody)['response'];
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  Future<void> logout() async {
    this._isLoggedIn = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("user");

    notifyListeners();
  }
  /*
  Swift Compiler Error (Xcode): No such module 'PPRiskMagnes'
/Users/willdewin/developement/mydirectcash/ios/Pods/Braintree
/Sources/PayPalDataCollector/Public/PayPalDataCollector/PPDat
aCollector.swift:0:7
  */
}

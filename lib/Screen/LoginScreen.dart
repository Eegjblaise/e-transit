import 'package:etransit/Screen/InscriptionScreen.dart';
import 'package:etransit/Screen/root.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/Loader.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ftoast/ftoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscuretext = false;
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Container(
            color: appBgColor,
            height: height,
            width: width,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Image.asset("assets/logo.png"),
                Text("Connexion",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inknutAntiqua(
                        fontSize: 20,
                        color: primary,
                        textStyle: Theme.of(context).textTheme.bodyMedium)),
                SizedBox(
                  height: 16,
                ),
                CustomTextBox(
                    hint: "Email",
                    controller: email,
                    prefix: Icon(Icons.mail, color: darker),
                    suffix: Icon(Icons.close, color: darker)),
                SizedBox(
                  height: 16,
                ),
                CustomTextBox(
                    hint: "Mot de passe",
                    obscuretex: obscuretext,
                    controller: pass,
                    prefix: Icon(Icons.lock, color: darker),
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscuretext = !obscuretext;
                        });
                      },
                      child: obscuretext
                          ? Icon(Icons.visibility, color: darker)
                          : Icon(Icons.visibility_off, color: darker),
                    )),
                Text("Mot de passe oublié ?",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inknutAntiqua(
                        fontSize: 12,
                        color: primary,
                        textStyle: Theme.of(context).textTheme.bodyMedium)),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    dynamic credentials = {
                      "email": email.text,
                      "password": pass.text
                    };
                    setState(() {
                      isLoading = true;
                    });
                    context
                        .read<AuthService>()
                        .login(credentials)
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RootApp(),
                          ));
                    }).catchError((onError) {
                      FToast.toast(
                        context,
                        msg: "${onError}",
                        subMsg: "",
                        corner: 20.0,
                        duration: 2000,
                        padding: const EdgeInsets.all(20),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary,
                    ),
                    child: Text("Se connecter",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.inknutAntiqua(
                            height: 1.5,
                            fontSize: 14,
                            color: appBgColor,
                            textStyle: Theme.of(context).textTheme.labelLarge)),
                  ),
                ),
                Text("vous n'avez pas de compte ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inknutAntiqua(
                        fontSize: 12,
                        color: darker,
                        textStyle: Theme.of(context).textTheme.bodyMedium)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InscriptionScreen(),
                        ));
                  },
                  child: Text(" S'inscrire ?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 16,
                          color: primary,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                )
              ],
            ),
          ),
        ),
        if (isLoading) Loader()
      ],
    ));
  }
}

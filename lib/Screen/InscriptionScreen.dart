import 'package:etransit/Screen/InscriptionScreen.dart';
import 'package:etransit/Screen/InscritptionScreen1.dart';
import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/data/User.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  bool obscuretext = false;
  User user = User(
      id: 1,
      nom: "",
      email: "",
      tel: "",
      password: "",
      carteRect: "",
      carteVers: "",
      createdAt: "",
      photo: "");
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: appBgColor,
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Image.asset("assets/logo.png"),
            Text("Inscription",
                textAlign: TextAlign.center,
                style: GoogleFonts.inknutAntiqua(
                    fontSize: 20,
                    color: primary,
                    textStyle: Theme.of(context).textTheme.bodyMedium)),
            Text("Veuillez rensigner vos identifiants de connexion",
                textAlign: TextAlign.center,
                style: GoogleFonts.inknutAntiqua(
                    fontSize: 12,
                    color: darker,
                    textStyle: Theme.of(context).textTheme.bodyMedium)),
            SizedBox(
              height: 16,
            ),
            CustomTextBox(
                controller: email,
                hint: "Email",
                prefix: Icon(Icons.mail, color: darker),
                suffix: Icon(Icons.close, color: darker)),
            SizedBox(
              height: 16,
            ),
            CustomTextBox(
                hint: "Mot de passe",
                controller: pass,
                obscuretex: obscuretext,
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
            SizedBox(
              height: 25,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: GoogleFonts.inknutAntiqua(
                        fontSize: 12,
                        color: darker,
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                    text: "En vous inscrivant  vous acceptez",
                    children: [
                      TextSpan(
                        style: GoogleFonts.inknutAntiqua(
                            fontSize: 14,
                            height: 1,
                            color: primary,
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                        text: " les conditions générales d’utilisation",
                      )
                    ])),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                user.password = pass.text;
                user.email = email.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InscriptionScreen1(user: user),
                    ));
              },
              child: Container(
                height: 40,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primary,
                ),
                child: Text("Envoyé",
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
            Text("vous avez deja un compte ?",
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
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text(" Se connecter ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inknutAntiqua(
                      fontSize: 16,
                      color: primary,
                      textStyle: Theme.of(context).textTheme.bodyMedium)),
            )
          ],
        ),
      ),
    ));
  }
}

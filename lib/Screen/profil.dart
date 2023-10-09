import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.only(left: 16, right: 16, top: 100),
            children: [
              Image.asset("assets/connexion.png"),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                child: Text(
                    "Vous devez etre connecté pour pouvoir acceder a cette page.",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: GoogleFonts.inknutAntiqua(
                        height: 1.5,
                        fontSize: 14,
                        textStyle: Theme.of(context).textTheme.labelLarge)),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 130,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
                      child: Text("Se connecter",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: GoogleFonts.inknutAntiqua(
                              height: 1.5,
                              fontSize: 14,
                              color: appBgColor,
                              textStyle:
                                  Theme.of(context).textTheme.labelLarge)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: green,
                    ),
                    child: Text("S'inscrire",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.inknutAntiqua(
                            height: 1.5,
                            fontSize: 14,
                            color: appBgColor,
                            textStyle: Theme.of(context).textTheme.labelLarge)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Version: 1.0.0",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: darker.withOpacity(.5),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ))
      ],
    ));
  }
}

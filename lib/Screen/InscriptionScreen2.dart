import 'package:etransit/Screen/InscriptionCarte.dart';
import 'package:etransit/Screen/InscriptionPasseport.dart';
import 'package:etransit/data/User.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InscriptionScreen2 extends StatefulWidget {
  User? user;
  InscriptionScreen2({super.key, required this.user});

  @override
  State<InscriptionScreen2> createState() => _InscriptionScreen2State();
}

class _InscriptionScreen2State extends State<InscriptionScreen2> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appBgColor,
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(16),
                height: height,
                width: width,
                child: Column(children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: textBoxColor,
                                child: Icon(Icons.arrow_back_ios,
                                    color: cardColor, size: 17),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 10,
                      child: Container(
                          child: ListView(children: [
                        Image.asset("assets/logo.png", height: 100),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Vérifiez votre identité",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inknutAntiqua(
                                fontSize: 17,
                                color: darker,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium)),
                        Text(
                            "Nous comprenons à quel point il est important pour vous de savoir que vos informations sont en sécurité lorsque vous utilisez notre service de transfert de colis. Votre confiance est notre priorité absolue, et nous tenons à vous rassurer que vos données sont entre de bonnes mains.",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inknutAntiqua(
                                fontSize: 13,
                                color: Colors.black38,
                                height: 1.5,
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge)),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InscriptionCarte(user: widget.user),
                                ));
                          },
                          child: Container(
                            child: Row(children: [
                              Image.asset("assets/Frame 2038 (1).png",
                                  height: 100),
                              Text("Carte d'indentité",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 14,
                                      color: darker,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge))
                            ]),
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                                color: textBoxColor,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InscriptionPasseport(user: widget.user),
                                ));
                          },
                          child: Container(
                            child: Row(children: [
                              Image.asset("assets/Frame 2038.png", height: 100),
                              Text("Passeport",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 14,
                                      color: darker,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge))
                            ]),
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                                color: textBoxColor,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ])))
                ]))));
  }
}

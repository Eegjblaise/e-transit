import 'package:etransit/Screen/CreationAnnonce3.dart';
import 'package:etransit/Screen/RechercheQuartier.dart';
import 'package:etransit/services/AnnoncesService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreationAnnonce2 extends StatefulWidget {
  dynamic annonces;
  CreationAnnonce2({super.key, required this.annonces});

  @override
  State<CreationAnnonce2> createState() => _CreationAnnonce2State();
}

class _CreationAnnonce2State extends State<CreationAnnonce2> {
  List quartier = [];
  void getDep(dynamic vile) {
    quartier.add(vile);
  }

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
                    child: Stack(children: [
                      SafeArea(
                          child: Container(
                              padding: EdgeInsets.all(16),
                              height: height,
                              width: width,
                              child: ListView(children: [
                                Text("Informations sur le colis",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 17,
                                        color: darker,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                                Text("Où voulez-vous récupérer le colis ?",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: Colors.black38,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RechercheQuartier(onTap: getDep),
                                        ));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.only(left: 16, bottom: 3),
                                    height: 44,
                                    width: width,
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_pin, color: darker),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text("Ajouter un lieu",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.inknutAntiqua(
                                                fontSize: 13,
                                                color: Colors.black38,
                                                height: 1.5,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge)),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: textBoxColor,
                                      border: Border.all(color: textBoxColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text("Lieux de récupération sélectionnés",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: cardColor,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),

                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                    children: List.generate(
                                        quartier.length,
                                        (index) => Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 16),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  bottom: 3,
                                                  left: 16,
                                                  right: 16),
                                              height: 44,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "${quartier[index]["titre"]}",
                                                      textAlign: TextAlign
                                                          .start,
                                                      style: GoogleFonts
                                                          .inknutAntiqua(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black38,
                                                              height: 1.5,
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displayLarge)),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        quartier
                                                            .removeAt(index);
                                                      });
                                                    },
                                                    child: Icon(Icons.delete,
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: textBoxColor,
                                                border: Border.all(
                                                    color: textBoxColor),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            )))
//Customised add any character using which you want to seprate
                              ]))),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            widget.annonces["listquartier"] = quartier;
                            print(widget.annonces["listquartier"]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreationAnnonce3(
                                          annonce: widget.annonces,
                                        )));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            height: 40,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("Reserver",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.manrope(
                                    fontSize: 17,
                                    color: textBoxColor,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge)),
                          ),
                        ),
                      )
                    ]),
                  )
                ]))));
  }
}

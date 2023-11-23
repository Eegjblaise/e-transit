import 'package:etransit/Screen/CreationAnnonce4.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chip_list/chip_list.dart';

class CreationAnnonce3 extends StatefulWidget {
  dynamic annonce;
  CreationAnnonce3({super.key, required this.annonce});

  @override
  State<CreationAnnonce3> createState() => _CreationAnnonce3State();
}

class _CreationAnnonce3State extends State<CreationAnnonce3> {
  final List<String> _dogeNames = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];
  List<String> day = [];
  int _currentIndex = 0;
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
                                ChipList(
                                  listOfChipNames: _dogeNames,
                                  activeBgColorList: [
                                    Theme.of(context).primaryColor
                                  ],
                                  inactiveBgColorList: [Colors.white],
                                  activeTextColorList: [Colors.white],
                                  inactiveTextColorList: [
                                    Theme.of(context).primaryColor
                                  ],
                                  listOfChipIndicesCurrentlySeclected: [
                                    _currentIndex
                                  ],
                                  extraOnToggle: (val) {
                                    _currentIndex = val;
                                    setState(() {
                                      day.add(_dogeNames[_currentIndex]);
                                    });
                                  },
                                ),

                                ChipList(
                                  listOfChipNames: day,
                                  activeBgColorList: [cardColor],
                                  inactiveBgColorList: [Colors.white],
                                  activeTextColorList: [Colors.white],
                                  inactiveTextColorList: [
                                    Theme.of(context).primaryColor
                                  ],
                                  listOfChipIndicesCurrentlySeclected: [
                                    _currentIndex
                                  ],
                                  extraOnToggle: (val) {
                                    setState(() {
                                      day.removeAt(val);
                                    });
                                  },
                                ),
//Customised add any character using which you want to seprate
                              ]))),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            widget.annonce["jourReser"] = day
                                .map((e) => {"nom": e, "etat": false})
                                .toList();
                            print(widget.annonce["jourReser"]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CreationAnnonce4(annonce: widget.annonce),
                                ));
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

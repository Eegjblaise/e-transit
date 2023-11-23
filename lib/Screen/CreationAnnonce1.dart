import 'package:etransit/Screen/CreationAnnonce2.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:chip_list/chip_list.dart';

class CreationAnnonce1 extends StatefulWidget {
  dynamic annonce;
  CreationAnnonce1({super.key, required this.annonce});

  @override
  State<CreationAnnonce1> createState() => _CreationAnnonce1State();
}

class _CreationAnnonce1State extends State<CreationAnnonce1> {
  TextEditingController search = TextEditingController();
  List<String> article = [];
  final List<String> _dogeNames = [
    'Beagle',
    'Labrador',
    'Retriever',
  ];
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
                                Text(
                                    "Quelles catégories d’articles voulez-vous transporter?",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: Colors.black38,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),

                                ChipTags(
                                  list: article,
                                  createTagOnSubmit: true,
                                  chipColor: Colors.black,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.search, color: darker),
                                      hintText: "Ajoutez un article"),
                                ),
                                if (article.isNotEmpty)
                                  Divider(
                                    color: cardColor,
                                  ),
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
                                      article.add(_dogeNames[_currentIndex]);
                                    });
                                  },
                                ),
                                //Customised add any character using which you want to seprate
                              ]))),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            widget.annonce["listArticle"] = article
                                .map(
                                  (e) =>
                                      {"nom": e, "prix": "10", "etat": false},
                                )
                                .toList();
                            print(widget.annonce["jourReser"]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreationAnnonce2(
                                      annonces: widget.annonce),
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

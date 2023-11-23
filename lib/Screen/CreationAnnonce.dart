import 'package:etransit/Screen/CreationAnnonce1.dart';
import 'package:etransit/Screen/RechercheVile.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';

class CreationAnnonce extends StatefulWidget {
  const CreationAnnonce({super.key});

  @override
  State<CreationAnnonce> createState() => _CreationAnnonceState();
}

class _CreationAnnonceState extends State<CreationAnnonce> {
  TextEditingController viledep = TextEditingController();
  TextEditingController Datedep = TextEditingController();
  TextEditingController vileArrive = TextEditingController();
  TextEditingController dateArrive = TextEditingController();

  FocusNode focusvel1 = FocusNode();
  FocusNode focusvel2 = FocusNode();

  dynamic annonces = {
    "jour": "7 Décembre 2023",
    "jourArriv": "",
    "ViledepId": 4,
    "VilearivId": 6,
    "PaysArivId": 2,
    "PaysdepId": 3,
    "nbKilo": "1",
    "prixKilo": "14",
    "detailKilo": 1,
    "photo": "hjjjj",
    "verifier": 0,
    "payId": 1,
    "userId": "",
    "jourReser": [
      {"nom": "lundi", "etat": false},
      {"nom": "Mardie", "etat": false},
      {"nom": "Mercredi", "etat": false}
    ],
    "listquartier": "",
    "listArticle": [
      {"nom": "Electro-menager", "prix": "10", "etat": false},
      {"nom": "Vêtements/Chaussures", "prix": "10", "etat": false},
      {"nom": "Evelope", "prix": "7", "etat": false}
    ]
  };

  void getDep(dynamic vile) {
    viledep.text = vile["titre"].toString();
    annonces["ViledepId"] = vile["id"].toString();
    annonces["PaysdepId"] = vile["pay"]["id"].toString();
  }

  void getarriv(dynamic vile) {
    vileArrive.text = vile["titre"].toString();
    annonces["VilearivId"] = vile["id"].toString();
    annonces["PaysArivId"] = vile["pay"]["id"].toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthService>().authenticate;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final auth = context.watch<AuthService>();

    return Scaffold(
      backgroundColor: appBgColor,
      body: Stack(children: [
        SafeArea(
            child: Container(
                padding: EdgeInsets.all(16),
                height: height,
                width: width,
                child: ListView(children: [
                  Text("Informations sur le voyage",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 17,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  Text("Renseignez nous sur vos différentes destinations.",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 13,
                          color: Colors.black38,
                          height: 1.5,
                          textStyle: Theme.of(context).textTheme.displayLarge)),
                  Text("D'où allez vous? ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  CustomTextBox(
                    controller: viledep,
                    onClic: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RechercheVile(onTap: getDep),
                          ));
                    },
                    hint: "Vile de départ",
                    prefix: Icon(Icons.arrow_outward_outlined, color: darker),
                  ),
                  Text("Départ",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  CustomTextBox(
                      controller: Datedep,
                      hint: "EX:19 Décembre 2023",
                      prefix:
                          Icon(Icons.calendar_today_outlined, color: darker),
                      suffix: Icon(Icons.close, color: darker)),
                  Text("Où allez vous?",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  CustomTextBox(
                    onClic: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RechercheVile(onTap: getarriv),
                          ));
                    },
                    controller: vileArrive,
                    hint: "Vile d arrivée",
                    prefix: Icon(Icons.arrow_downward_outlined, color: darker),
                  ),
                  Text("Arrivée",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 14,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  CustomTextBox(
                      controller: dateArrive,
                      hint: "EX:19 Décembre 2023",
                      prefix:
                          Icon(Icons.calendar_today_outlined, color: darker),
                      suffix: Icon(Icons.close, color: darker)),
                ]))),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              annonces["jour"] = Datedep.text;
              annonces["jourArriv"] = vileArrive.text;
              // annonces["userId"] = auth.currentUser!.id;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreationAnnonce1(annonce: annonces),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              height: 40,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: cardColor, borderRadius: BorderRadius.circular(30)),
              child: Text("Reserver",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                      fontSize: 17,
                      color: textBoxColor,
                      textStyle: Theme.of(context).textTheme.labelLarge)),
            ),
          ),
        )
      ]),
    );
  }
}

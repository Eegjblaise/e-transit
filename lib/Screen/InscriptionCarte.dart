import 'dart:io';

import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/data/User.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/Loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ftoast/ftoast.dart';

class InscriptionCarte extends StatefulWidget {
  User? user;
  InscriptionCarte({super.key, required this.user});

  @override
  State<InscriptionCarte> createState() => _InscriptionCarteState();
}

class _InscriptionCarteState extends State<InscriptionCarte> {
  String rect = "";
  String vers = "";
  bool isloading = false;

  Future<void> _selectrectFromGallery() async {
    final picker = ImagePicker();
    print("object");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // L'image a été sélectionnée avec succès.
      // Vous pouvez utiliser pickedFile.path pour accéder au chemin de l'image.
      // Par exemple, vous pouvez l'afficher dans un widget Image.
      setState(() {
        rect = pickedFile.path;
      });
    } else {
      // L'utilisateur a annulé la sélection de l'image.
    }
  }

  Future<void> _selectversFromGallery() async {
    final picker = ImagePicker();
    print("object");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // L'image a été sélectionnée avec succès.
      // Vous pouvez utiliser pickedFile.path pour accéder au chemin de l'image.
      // Par exemple, vous pouvez l'afficher dans un widget Image.
      setState(() {
        vers = pickedFile.path;
      });
    } else {
      // L'utilisateur a annulé la sélection de l'image.
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appBgColor,
        body: Stack(
          children: [
            SafeArea(
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
                              Text("Recto Carte d'indentité",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 17,
                                      color: darker,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)),
                              DottedBorder(
                                  borderType: BorderType.RRect,
                                  child: InkWell(
                                    onTap: () => _selectrectFromGallery(),
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      alignment: Alignment.bottomCenter,
                                      height: 150,
                                      child: Container(
                                        width: width,
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Text("Verification",
                                                textAlign: TextAlign.start,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        fontSize: 17,
                                                        color: darker,
                                                        height: 1.2,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium)),
                                            Text(
                                                "Appuyer ici  pour televerser un fichier",
                                                textAlign: TextAlign.start,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        fontSize: 12,
                                                        height: 1,
                                                        color: darker,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge))
                                          ],
                                        ),
                                      ),
                                      width: width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(rect))),
                                        color:
                                            Color.fromRGBO(217, 217, 217, .25),
                                      ),
                                    ),
                                  )),
                              Text(" Verso Carte d'indentité",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 17,
                                      color: darker,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)),
                              DottedBorder(
                                  borderType: BorderType.RRect,
                                  child: InkWell(
                                    onTap: () => _selectversFromGallery(),
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      alignment: Alignment.bottomCenter,
                                      height: 150,
                                      child: Container(
                                        width: width,
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Text("Verification",
                                                textAlign: TextAlign.start,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        fontSize: 17,
                                                        color: darker,
                                                        height: 1.2,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium)),
                                            Text(
                                                "Appuyer ici  pour televerser un fichier",
                                                textAlign: TextAlign.start,
                                                style:
                                                    GoogleFonts.inknutAntiqua(
                                                        fontSize: 12,
                                                        height: 1,
                                                        color: darker,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelLarge))
                                          ],
                                        ),
                                      ),
                                      width: width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(vers))),
                                        color:
                                            Color.fromRGBO(217, 217, 217, .25),
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 32),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    widget.user!.carteRect = rect;
                                    widget.user!.carteVers = vers;
                                    print(widget.user!.toJson());
                                    setState(() {
                                      isloading = true;
                                    });
                                    context
                                        .read<AuthService>()
                                        .register(widget.user!)
                                        .then((value) {
                                      setState(() {
                                        isloading = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
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
                                        isloading = false;
                                      });
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("Terminer",
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
                          ))
                    ]))),
            if (isloading) Loader()
          ],
        ));
  }
}

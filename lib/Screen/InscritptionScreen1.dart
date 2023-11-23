import 'dart:io';

import 'package:etransit/Screen/InscriptionScreen2.dart';
import 'package:etransit/data/User.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class InscriptionScreen1 extends StatefulWidget {
  User? user;
  InscriptionScreen1({super.key, required this.user});

  @override
  State<InscriptionScreen1> createState() => _InscriptionScreen1State();
}

class _InscriptionScreen1State extends State<InscriptionScreen1> {
  String image = "";
  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // L'image a été prise avec succès.
      // Vous pouvez utiliser pickedFile.path pour accéder au chemin de l'image.
      // Par exemple, vous pouvez l'afficher dans un widget Image.
      setState(() {
        image = pickedFile.path;
      });
    } else {
      // L'utilisateur a annulé la prise de la photo.
    }
  }

  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    print("object");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // L'image a été sélectionnée avec succès.
      // Vous pouvez utiliser pickedFile.path pour accéder au chemin de l'image.
      // Par exemple, vous pouvez l'afficher dans un widget Image.
      setState(() {
        image = pickedFile.path;
        print(image);
      });
    } else {
      // L'utilisateur a annulé la sélection de l'image.
    }
  }

  TextEditingController nom = TextEditingController();
  TextEditingController tel = TextEditingController();

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
                    child: ListView(padding: EdgeInsets.all(20), children: [
                  Image.asset("assets/logo.png", height: 100),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Mon profil",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 17,
                          color: darker,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.white,
                            child: InkWell(
                              onTap: _selectImageFromGallery,
                              child: CircleAvatar(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: _takePhoto,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 12.0,
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 15.0,
                                        color: Color(0xFF404040),
                                      ),
                                    ),
                                  ),
                                ),
                                radius: 38.0,
                                backgroundImage: FileImage(File(image)),
                              ),
                            )),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextBox(
                      hint: "Nom",
                      prefix: Icon(Icons.person, color: darker),
                      suffix: Icon(Icons.close, color: darker)),
                  SizedBox(
                    height: 16,
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Numero de telephone',
                    ),
                    initialCountryCode: 'CM',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        widget.user!.photo = image;
                        widget.user!.nom = nom.text;
                        widget.user!.tel = tel.text;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InscriptionScreen2(user: widget.user),
                            ));
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("Suivant",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                                fontSize: 17,
                                color: textBoxColor,
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge)),
                      ),
                    ),
                  )
                ])))
          ]),
        )));
  }
}

/*
import 'package:etransit/Screen/DetailColis.dart';
import 'package:etransit/data/Annonce.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/DioClient.dart';

class Colis extends StatelessWidget {
  final Annonce? annonce;
  const Colis({super.key, required
  this.annonce});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailColis(annonce: annonce,);
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 16),
        height: 204,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${annonce!.user!["name"]}",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        color: secondaryFont,
                        textStyle: Theme.of(context).textTheme.labelLarge)),
                annonce!.user!["imageuser"] == null
                    ? CircleAvatar(
                    radius: 25,
                    backgroundColor: cardColor,
                    backgroundImage:
                    AssetImage("assets/téléchargement.png"))
                    : CircleAvatar(
                  radius: 25,
                  backgroundColor: cardColor,
                  backgroundImage: NetworkImage(baseurl +
                      annonce!.user!["imageuser"].toString()),
                ),     ],
            ),
            Container(
              width: width * .65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${annonce!.dateDep}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          fontSize: 20,
                          color: textBoxColor,
                          textStyle: Theme.of(context).textTheme.bodyLarge)),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    height: 33,
                    width: 86,
                    decoration: BoxDecoration(
                        color: textBoxColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: primary,
                          size: 20,
                        ),
                        Text("Colis",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                                fontSize: 14,
                                color: green,
                                textStyle:
                                Theme.of(context).textTheme.labelMedium))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text("${annonce!.nombreKilo}",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: primary,
                    textStyle: Theme.of(context).textTheme.labelLarge)),

            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    baseurl + annonce!.paysDepart!["image"],
                    height: 20,
                    width: 20,
                  ),
                  Image.network(
                    baseurl + annonce!.paysArrive!["image"],
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            ),
            Image.asset("assets/progress.png", width: width, fit: BoxFit.contain),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("${annonce!.paysDepart!["name"]}-${annonce!.villeDepart}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          fontSize: 10,
                          color: secondaryFont,
                          textStyle: Theme.of(context).textTheme.labelLarge)),),
                  Expanded(child:  Text("${annonce!.paysArrive!["name"]}-${annonce!.villeArrive}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          fontSize: 10,
                          color: textBoxColor,
                          textStyle: Theme.of(context).textTheme.bodyLarge)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
import 'package:etransit/Screen/DetailAnnonce.dart';
import 'package:etransit/data/Annonce.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Billet extends StatelessWidget {
  final Annonce? annonce;
  Billet({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailAnnonce(
                annonce: annonce!,
              );
            },
          ));
        },
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          height: 204,
          width: width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              )
            ],
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
                  Text("${annonce!.user.nom}",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                          fontSize: 18,
                          color: secondaryFont,
                          textStyle: Theme.of(context).textTheme.labelLarge)),
                  annonce!.user.photo == null
                      ? CircleAvatar(
                          radius: 25,
                          backgroundColor: cardColor,
                          backgroundImage:
                              AssetImage("assets/téléchargement.png"))
                      : CircleAvatar(
                          radius: 25,
                          backgroundColor: cardColor,
                          backgroundImage:
                              NetworkImage(baseurl + annonce!.user.photo!),
                        ),
                ],
              ),
              Container(
                width: width * .80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${annonce!.jour}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.manrope(
                            fontSize: 18,
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
                          Text("Billet",
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
              Text("${annonce!.nbKilo}",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: primary,
                      textStyle: Theme.of(context).textTheme.labelLarge)),
              Text("${annonce!.prixKilo}  \$/ kg",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: textBoxColor,
                      textStyle: Theme.of(context).textTheme.labelLarge)),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      baseurl + annonce!.Paysdep!["image"],
                      height: 20,
                      width: 20,
                    ),
                    Image.network(
                      baseurl + annonce!.PaysAriv!["image"],
                      height: 20,
                      width: 20,
                    )
                  ],
                ),
              ),
              Image.asset("assets/progress.png",
                  width: width, fit: BoxFit.contain),
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("${annonce!.Viledep!["titre"]}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                              fontSize: 10,
                              color: secondaryFont,
                              textStyle:
                                  Theme.of(context).textTheme.labelLarge)),
                    ),
                    Expanded(
                      child: Text("${annonce!.Vileariv!["titre"]}",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                              fontSize: 10,
                              color: textBoxColor,
                              textStyle:
                                  Theme.of(context).textTheme.bodyLarge)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
/**
 * Container(
      height: 220,
      width: width,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: annonce.user!["image"] == null
                              ? CircleAvatar(
                                  radius: 25,
                                  backgroundColor: cardColor,
                                  backgroundImage:
                                      AssetImage("assets/téléchargement.png"))
                              : CircleAvatar(
                                  radius: 25,
                                  backgroundColor: cardColor,
                                  backgroundImage: NetworkImage(baseurl +
                                      annonce.user!["image"].toString()),
                                ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Text(annonce.user!["name"],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inknutAntiqua(
                                    fontSize: 14,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge)))
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      height: 33,
                      width: 86,
                      decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.check_circle,
                              color: primary,
                              size: 20,
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Text("Billet",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 14,
                                      color: green,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium)))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(annonce.dateDep!,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inknutAntiqua(
                    fontSize: 14,
                    textStyle: Theme.of(context).textTheme.labelMedium)),
          ),
          Container(

              /// height: 100,
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/Ellipse 21.png"),
                          Image.asset(
                            "assets/Rectangle 30.png",
                            height: 70,
                          ),
                          Image.asset("assets/Ellipse 21.png")
                        ],
                      ),
                      Positioned(
                          right: 17,
                          top: 32,
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: primary,
                          ))
                    ])),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(annonce.villeDepart!,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inknutAntiqua(
                                          fontSize: 12,
                                          height: 1.5,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                  Image.network(
                                    baseurl + annonce.paysDepart!["image"],
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              Text(annonce.paysDepart!["name"],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 10,
                                      height: 1,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium)),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(annonce.villeArrive!,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inknutAntiqua(
                                          fontSize: 12,
                                          height: 1.5,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                  Image.network(
                                    baseurl + annonce.paysArrive!["image"],
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              Text(annonce.paysArrive!["name"],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inknutAntiqua(
                                      fontSize: 10,
                                      height: 1.5,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Text("${annonce.nombreKilo} kg",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inknutAntiqua(
                                    fontSize: 12,
                                    color: Colors.greenAccent,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium)),
                            Text("${annonce.nombreKilo}\$/kg",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inknutAntiqua(
                                    fontSize: 12,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium))
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );

 */

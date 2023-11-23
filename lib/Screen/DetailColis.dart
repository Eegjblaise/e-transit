/**
 * import 'package:etransit/data/Annonce.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:flutter/material.dart';
import 'package:etransit/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailColis extends StatefulWidget {
  Annonce? annonce;
  DetailColis({super.key, required this.annonce});

  @override
  State<DetailColis> createState() => _DetailColisState();
}

class _DetailColisState extends State<DetailColis> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appBgColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
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
                          Text("Detail",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  color: cardColor,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge)),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: textBoxColor,
                            child: Icon(Icons.info_outline,
                                color: cardColor, size: 17),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(top: 10),
                            height: 156,
                            width: width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: shadowColor.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: cardColor,
                            ),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${widget.annonce!.jour}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.manrope(
                                                fontSize: 20,
                                                color: textBoxColor,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8),
                                          height: 33,
                                          width: 86,
                                          decoration: BoxDecoration(
                                              color: textBoxColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: primary,
                                                size: 20,
                                              ),
                                              Text("Colis",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 14,
                                                      color: green,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text("${widget.annonce!.nbKilo}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          color: primary,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                  Container(
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          baseurl +
                                              widget.annonce!.Paysdep!["image"],
                                          height: 20,
                                          width: 20,
                                        ),
                                        Image.network(
                                          baseurl +
                                              widget
                                                  .annonce!.PaysAriv!["image"],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              "${widget.annonce!.paysD!["name"]}-${widget.annonce!.villeDepart}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.manrope(
                                                  fontSize: 10,
                                                  color: secondaryFont,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge)),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${widget.annonce!.paysArrive!["name"]}-${widget.annonce!.villeArrive}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.manrope(
                                                  fontSize: 10,
                                                  color: textBoxColor,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge)),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Valeur:",
                                style: GoogleFonts.manrope(
                                    fontSize: 17,
                                    color: cardColor,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "\$${widget.annonce!.valeur}",
                                    style: GoogleFonts.manrope(
                                        fontSize: 20,
                                        color: cardColor,
                                        fontWeight: FontWeight.w800,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ),
                                  Container(
                                    width: 90,
                                    height: 2,
                                    color: cardColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: textBoxColor),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child:
                                      widget.annonce!.user!["imageuser"] == null
                                          ? CircleAvatar(
                                              radius: 25,
                                              backgroundColor: cardColor,
                                              backgroundImage: AssetImage(
                                                  "assets/téléchargement.png"))
                                          : CircleAvatar(
                                              radius: 25,
                                              backgroundColor: cardColor,
                                              backgroundImage: NetworkImage(
                                                  baseurl +
                                                      widget.annonce!
                                                          .user!["imageuser"]
                                                          .toString()),
                                            ),
                                ),
                                Expanded(
                                    flex: 10,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, top: 10),
                                      // color: Colors.deepOrange,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  "${widget.annonce!.user!["name"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.manrope(
                                                      fontSize: 20,
                                                      color: cardColor,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(Icons.check_circle,
                                                  color: Colors.green, size: 17)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.amberAccent,
                                                  size: 15),
                                              Icon(Icons.star_outline,
                                                  color: cardColor, size: 15),
                                              Icon(Icons.star_outline,
                                                  color: cardColor, size: 15),
                                              Icon(Icons.star_outline,
                                                  color: cardColor, size: 15),
                                              Icon(Icons.star_outline,
                                                  color: cardColor, size: 15),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: cardColor,
                                    child: Icon(Icons.visibility,
                                        color: textBoxColor, size: 17),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: textBoxColor,
                                  child: Icon(Icons.favorite,
                                      color: Colors.red, size: 25),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: textBoxColor,
                                  child: Icon(Icons.share,
                                      color: cardColor, size: 25),
                                ),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: textBoxColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("Signaler",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.manrope(
                                            fontSize: 17,
                                            color: cardColor,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge)),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("Reserver",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.manrope(
                                            fontSize: 17,
                                            color: textBoxColor,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge)),
                                  ),
                                )
                              ]),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

 */
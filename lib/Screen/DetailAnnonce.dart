import 'package:etransit/Screen/ReservationArticle.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etransit/data/Annonce.dart';

class DetailAnnonce extends StatefulWidget {
  Annonce annonce;
  DetailAnnonce({super.key, required this.annonce});

  @override
  State<DetailAnnonce> createState() => _DetailAnnonceState();
}

class _DetailAnnonceState extends State<DetailAnnonce> {
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Text(widget.annonce.jour!,
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
                                              Text("Billet",
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
                                  Text("${widget.annonce.nbKilo}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          color: primary,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                  Text("${widget.annonce.prixKilo} \$/ kg",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          color: textBoxColor,
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
                                              widget.annonce.Paysdep!["image"],
                                          height: 20,
                                          width: 20,
                                        ),
                                        Image.network(
                                          baseurl +
                                              widget.annonce.PaysAriv!["image"],
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
                                          flex: 1,
                                          child: Text(
                                              "${widget.annonce.Viledep!["titre"]}",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.manrope(
                                                  fontSize: 10,
                                                  color: secondaryFont,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              "${widget.annonce.Vileariv!["titre"]}",
                                              textAlign: TextAlign.end,
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
                          Text(
                            "Nombre de kilos  (${widget.annonce.nbKilo})",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                                fontSize: 20,
                                color: cardColor,
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/noto_ballot-box-with-ballot.png"),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: cardColor),
                                    color: textBoxColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/noto_ballot-box-with-ballot.png"),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: textBoxColor,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/noto_ballot-box-with-ballot (1).png"),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: textBoxColor,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          Text(
                            "Vendre mes kilos en details",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                                fontSize: 20,
                                color: cardColor,
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge),
                          ),
                          Row(children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              height: 47,
                              child: Text("3 X",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: textBoxColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Container(
                              height: 47,
                              margin: EdgeInsets.only(right: 16),
                              child: Text("120 X",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: textBoxColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Container(
                              height: 47,
                              margin: EdgeInsets.only(right: 16),
                              child: Text("5 X",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: textBoxColor,
                                  borderRadius: BorderRadius.circular(30)),
                            )
                          ]),
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
                                  child: widget.annonce.user.photo == null
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
                                                  widget.annonce.user.photo
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
                                              Text("${widget.annonce.user.nom}",
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ReservationArticle(),
                                        ));
                                  },
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

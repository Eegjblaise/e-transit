import 'package:etransit/Screen/ReservationLieu.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationArticle extends StatefulWidget {
  const ReservationArticle({super.key});

  @override
  State<ReservationArticle> createState() => _ReservationArticleState();
}

class _ReservationArticleState extends State<ReservationArticle> {
  bool check = false;

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
                        height: 150,
                        width: width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: textBoxColor,
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ]),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/image 91.png",
                                width: 150,
                                height: 400,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "Type D'articles requis pour le transporter de votre colis.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: textBoxColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadowColor.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ]),
                                  child: Text("1",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 20,
                                          color: cardColor,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text("2",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 20,
                                          color: cardColor,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text("3",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 20,
                                          color: cardColor,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text("4",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                          fontSize: 20,
                                          color: cardColor,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Article transportés",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.manrope(
                                    fontSize: 18,
                                    color: cardColor,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                              title: Text("Electro-Menager",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                              title: Text("Vêtements",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ),
                            Text("Jour de recuperation",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.manrope(
                                    fontSize: 18,
                                    color: cardColor,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                              title: Text("Lundi",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                              title: Text("Mardi",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: cardColor,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge)),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReservationLieu(),
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
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge)),
                          ),
                        ),
                      )
                    ])))
          ]),
        )));
  }
}

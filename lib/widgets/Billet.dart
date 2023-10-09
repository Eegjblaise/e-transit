import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Billet extends StatelessWidget {
  const Billet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
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
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: cardColor,
                            backgroundImage:
                                AssetImage("assets/téléchargement.png"),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Text("Turbo 237",
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
                              child: Text("biellet",
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
            child: Text("09 dec 2023",
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
                      child: Column(
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
                    ),
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
                                  Text("Paris-surele-broussier",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inknutAntiqua(
                                          fontSize: 12,
                                          height: 1.5,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                  Image.asset(
                                    "assets/téléchargement.jpeg",
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              Text("FRANCE",
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
                                  Text("Paris-surele-broussier",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inknutAntiqua(
                                          fontSize: 12,
                                          height: 1.5,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                  Image.asset(
                                    "assets/téléchargement.jpeg",
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              ),
                              Text("FRANCE",
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
                            Text("24kg",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inknutAntiqua(
                                    fontSize: 12,
                                    color: Colors.greenAccent,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium)),
                            Text("1\$/kg",
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
  }
}

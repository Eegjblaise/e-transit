import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationKilo extends StatefulWidget {
  const ReservationKilo({super.key});

  @override
  State<ReservationKilo> createState() => _ReservationArticleState();
}

class _ReservationArticleState extends State<ReservationKilo> {
  bool check = false;
  int kilo = 1;
  Widget _incrementButton() {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          kilo++;
        });
      },
    );
  }

  Widget _decrementButton() {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            kilo--;
          });
        },
        child: new Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
            color: Colors.black),
        backgroundColor: Colors.white);
  }

  Widget _shoppingItem() {
    return Card(
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset("assets/noto_ballot-box-with-ballot.png", width: 100),
            _decrementButton(),
            Text(
              '${kilo} kg',
              style: TextStyle(fontSize: 18.0),
            ),
            _incrementButton(),
          ],
        ),
      ),
    );
  }

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
                                  "Précisez le nombre de kolis de kilogramme.",
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
                                  ),
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
                          children: [_shoppingItem()],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {},
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

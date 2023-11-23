import 'package:etransit/Screen/CreationAnnonce5.dart';
import 'package:etransit/Screen/CreationAnnonce6.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chip_list/chip_list.dart';

class CreationAnnonce4 extends StatefulWidget {
  dynamic annonce;
  CreationAnnonce4({super.key, required this.annonce});

  @override
  State<CreationAnnonce4> createState() => _CreationAnnonce3State();
}

class _CreationAnnonce3State extends State<CreationAnnonce4> {
  int? selectratio = 3;
  setSelectionRatio(int val) {
    setState(() {
      this.selectratio = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectratio = 0;
  }

  int _currentIndex = 0;
  int kilo = 1;
  Widget _incrementButton() {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.white,
      onPressed: () {
        setState(() {
          kilo++;
          widget.annonce["nbKilo"] = kilo.toString();
        });
      },
    );
  }

  Widget _decrementButton() {
    return FloatingActionButton(
        onPressed: () {
          setState(() {
            kilo--;
            widget.annonce["nbKilo"] = kilo.toString();
          });
        },
        child: new Icon(Icons.remove, color: Colors.black),
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
            Image.asset("assets/noto_ballot-box-with-ballot.png", width: 50),
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
    TextEditingController viledep = new TextEditingController();
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
                    child: Stack(children: [
                      SafeArea(
                          child: Container(
                              padding: EdgeInsets.all(16),
                              height: height,
                              width: width,
                              child: ListView(children: [
                                Text("Informations sur le kilos",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 17,
                                        color: darker,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                                Text("Combien de kilos souhaitez-vous vendre ?",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: Colors.black38,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),
                                SizedBox(
                                  height: 16,
                                ),
                                _shoppingItem(),
                                SizedBox(
                                  height: 16,
                                ),
                                Text("Comment voulez-vous vendre vos kilos",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: cardColor,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      bottom: 3, left: 16, right: 16),
                                  height: 44,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("A un seul client",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inknutAntiqua(
                                              fontSize: 13,
                                              color: Colors.black38,
                                              height: 1.5,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge)),
                                      Radio(
                                        activeColor: cardColor,
                                        value: 0,
                                        groupValue: selectratio,
                                        onChanged: (val) {
                                          setSelectionRatio(val!);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CreationAnnonce5(
                                                        annonce:
                                                            widget.annonce),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: textBoxColor,
                                    border: Border.all(color: textBoxColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                      bottom: 3, left: 16, right: 16),
                                  height: 44,
                                  width: width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("En détail",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inknutAntiqua(
                                              fontSize: 13,
                                              color: Colors.black38,
                                              height: 1.5,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge)),
                                      Radio(
                                        activeColor: cardColor,
                                        value: 1,
                                        groupValue: selectratio,
                                        onChanged: (val) {
                                          setSelectionRatio(val!);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CreationAnnonce6(
                                                        annonce:
                                                            widget.annonce),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: textBoxColor,
                                    border: Border.all(color: textBoxColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]))),
                    ]),
                  )
                ]))));
  }
}

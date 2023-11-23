import 'package:etransit/Screen/root.dart';
import 'package:etransit/services/AnnoncesService.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/Loader.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chip_list/chip_list.dart';
import 'package:provider/provider.dart';
import 'package:ftoast/ftoast.dart';

class CreationAnnonce5 extends StatefulWidget {
  dynamic annonce;
  CreationAnnonce5({super.key, required this.annonce});

  @override
  State<CreationAnnonce5> createState() => _CreationAnnonce5State();
}

class _CreationAnnonce5State extends State<CreationAnnonce5> {
  TextEditingController search = TextEditingController();

  double totalKilo = 1.0;
  bool isLoading = false;
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
                                Text(
                                    "Quel prix voulez vous pour vos ${widget.annonce["nbKilo"]} kilos en Euro",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 13,
                                        color: Colors.black38,
                                        height: 1.5,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge)),
                                Slider(
                                  value: totalKilo,
                                  max: 100,
                                  min: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      totalKilo = value;
                                    });
                                    print(value);
                                  },
                                ),
                                Text("${totalKilo.round()}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inknutAntiqua(
                                        fontSize: 17,
                                        height: 1.3,
                                        color: darker,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                                ListTile(
                                  leading: Icon(
                                    Icons.info,
                                  ),
                                  title: Text(
                                      "Plus les prix sont attractifs plus vous avez la clientèle",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.manrope(
                                          fontSize: 13,
                                          color: cardColor,
                                          height: 1.5,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelLarge)),
                                )
                              ]))),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            widget.annonce["prixKilo"] = totalKilo.round();

                            print(widget.annonce);

                            context
                                .read<AnnoncesService>()
                                .addAnnonce(widget.annonce)
                                .then((value) => setState(() {
                                      isLoading = false;
                                      context.read<AuthService>().setIndex(0);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RootApp(),
                                          ));
                                    }))
                                .catchError((err) {
                              FToast.toast(
                                context,
                                msg: "${err}",
                                subMsg: "",
                                corner: 20.0,
                                duration: 2000,
                                padding: const EdgeInsets.all(20),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            height: 40,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(30)),
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
                      ),
                      if (isLoading) Loader()
                    ]),
                  )
                ]))));
  }
}

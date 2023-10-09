import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/Billet.dart';
import 'package:etransit/widgets/Colis.dart';
import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iscolis = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appBgColor,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16),
              children: [
                SizedBox(
                  height: 16,
                ),
                CustomTextBox(
                  hint: "Recherche",
                  prefix: Icon(Icons.search, color: darker),
                  suffix: PopupMenuButton(
                    icon: Icon(
                      Icons.filter_list_outlined,
                      color: primary,
                    ),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return [
                        PopupMenuItem(
                          child: Text("Billets"),
                          value: '/hello',
                          onTap: () {
                            setState(() {
                              iscolis = false;
                            });
                          },
                        ),
                        PopupMenuItem(
                          child: Text("Colis"),
                          value: '/about',
                          onTap: () {
                            setState(() {
                              iscolis = true;
                            });
                          },
                        ),
                        PopupMenuItem(
                          child: Text("Tout"),
                          value: '/contact',
                        )
                      ];
                    },
                  ),
                ),
                Text("Top Destination",
                    style: GoogleFonts.inknutAntiqua(
                        fontSize: 16,
                        textStyle: Theme.of(context).textTheme.bodyLarge)),
                iscolis
                    ? Column(
                        children: List.generate(4, (index) => Colis()),
                      )
                    : Column(
                        children: List.generate(4, (index) => Billet()),
                      )
              ],
            ),
          ),
        ));
  }
}

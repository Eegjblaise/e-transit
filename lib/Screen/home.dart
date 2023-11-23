import 'package:etransit/data/Annonce.dart';
import 'package:etransit/services/AnnoncesService.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/widgets/Billet.dart';

import 'package:etransit/widgets/custom_textbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/Shimer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<List<Annonce>>? _streamannonce;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamannonce = Stream.periodic(Duration(seconds: 5),
            (_) => context.read<AnnoncesService>().getAnnonce())
        .asyncMap((annonce) async {
      return await annonce;
    });
  }

  Future<void> refreshData() async {
    final annonces = await context.read<AnnoncesService>().getAnnonce();
    _streamannonce = Stream.value(annonces);
    setState(() {});
  }

  bool iscolis = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBgColor,
        title: CustomTextBox(
          hint: "Recherche",
          prefix: Icon(Icons.search, color: darker),
          suffix: PopupMenuButton(
            icon: Icon(
              Icons.filter_list_outlined,
              color: shadowColor,
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
                    iscolis = false;
                  },
                ),
                PopupMenuItem(
                  child: Text("Colis"),
                  value: '/about',
                  onTap: () {
                    iscolis = true;
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
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: [
            Text("Top Destination",
                textAlign: TextAlign.left,
                style: GoogleFonts.inknutAntiqua(
                    fontSize: 16,
                    textStyle: Theme.of(context).textTheme.bodyLarge)),
            /*  Column(
              children: List.generate(5, (index) => Colis()),
            )*/

            StreamBuilder(
              stream: _streamannonce,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                      children: List.generate(3, (index) => Shimer()));
                } else if (snapshot.hasError) {
                  return Text('Erreur : ${snapshot.error}');
                } else {
                  final data = snapshot.data;
                  return Column(
                    children: List.generate(
                        data!.length,
                        (index) => Billet(
                              annonce: data[index],
                            )),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

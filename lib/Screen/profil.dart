import 'package:etransit/Screen/Annonce.dart';
import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/Screen/MonCompte.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:etransit/Screen/MonCompte.dart';

import '../theme/color.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthService>().authenticate;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = context.read<AuthService>();
    print(auth.currentUser!.photo);
    return Scaffold(
        backgroundColor: appBgColor,
        body: Stack(children: [
          SafeArea(
              child: Container(
                color: appBgColor,
                height: height,
                width: width,
                child: ListView(
                  padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                      NetworkImage(baseurl + auth.currentUser!.photo!),
                    ),
                    Text(auth.currentUser!.nom!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            textStyle: Theme.of(context).textTheme.bodyLarge)),
                    Text(auth.currentUser!.email!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            height: 1,
                            fontSize: 16,
                            textStyle: Theme.of(context).textTheme.bodySmall)),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                      // height: 300,
                      width: width,
                      decoration: BoxDecoration(
                          color: textBoxColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.person_outline,
                                  color: Color(0xff8babfa)),
                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MonCompte()),
                                  );
                                },
                              ),
                            ),
                            subtitle: Text(
                                "apporter des modifications à votre compte",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    height: 1,
                                    fontSize: 10,
                                    textStyle:
                                    Theme.of(context).textTheme.bodySmall)),
                            title: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Mon Compte",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                const Icon(Icons.error_outline,
                                    color: Colors.red, size: 17)
                              ],
                            )),
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.message_outlined,
                                  color: Color(0xff8babfa)),
                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Annonce()),
                                  );
                                },
                              ),
                            ),
                            subtitle: Text("Gérer vos Annonces enregistré",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    height: 1,
                                    fontSize: 10,
                                    textStyle:
                                    Theme.of(context).textTheme.bodySmall)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Annonces",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                //  Icon(Icons.error_outline,
                                // color: Colors.red, size: 17)
                              ],
                            )),
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.shield_moon_outlined,
                                  color: Color(0xff8babfa)),

                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MonCompte()),
                                  );
                                },
                              ),
                            ),
                            subtitle: Text(
                                "sécurisez davantage votre compte pour plus de sécurité",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    height: 1,
                                    fontSize: 10,
                                    textStyle:
                                    Theme.of(context).textTheme.bodySmall)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Double Authentification",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                // Icon(Icons.error_outline,
                                //   color: Colors.red, size: 17)
                              ],
                            )),
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.logout,
                                  color: Color(0xff8babfa)),
                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MonCompte()),
                                  );
                                },
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Deconexion",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                // Icon(Icons.error_outline,
                                //color: Colors.red, size: 17)
                              ],
                            )),
                      ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Plus",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.manrope(
                            fontSize: 16,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            textStyle: Theme.of(context).textTheme.bodyLarge)),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                      // height: 300,
                      width: width,
                      decoration: BoxDecoration(
                          color: textBoxColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.notification_add_outlined,
                                  color: Color(0xff8babfa)),
                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MonCompte()),
                                  );
                                },
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Aide ",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                //Icon(Icons.error_outline,
                                //  color: Colors.red, size: 17)
                              ],
                            )),
                        ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: appBgColor,
                              child: Icon(Icons.favorite_border_outlined,
                                  color: Color(0xff8babfa)),
                            ),
                            trailing: Container(
                              width: 16,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios, size: 12,),
                                onPressed: () {
                                  // Naviguer vers la nouvelle page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MonCompte()),
                                  );
                                },
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("A propos",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                //  Icon(Icons.error_outline,
                                // color: Colors.red, size: 17)
                              ],
                            )),
                      ]),
                    ),
                  ],
                ),
              ))
        ]));
  }
}

/**
 * Scaffold(
    body: Stack(
    children: [
    Container(
    color: Colors.white,
    child: ListView(
    padding: EdgeInsets.only(left: 16, right: 16, top: 100),
    children: [
    Image.asset("assets/connexion.png"),
    Container(
    width: MediaQuery.of(context).size.width * .9,
    child: Text(
    "Vous devez être connecté pour pouvoir accéder à cette page.",
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: GoogleFonts.inknutAntiqua(
    height: 1.5,
    fontSize: 14,
    textStyle: Theme.of(context).textTheme.labelLarge)),
    ),
    SizedBox(
    height: 100,
    ),
    ],
    ),
    ),
    Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    height: 130,
    width: 300,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
    children: [
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => LoginScreen(),
    ));
    },
    child: Container(
    height: 40,
    width: 300,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: primary,
    ),
    child: Text("Se connecter",
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: GoogleFonts.inknutAntiqua(
    height: 1.5,
    fontSize: 14,
    color: appBgColor,
    textStyle:
    Theme.of(context).textTheme.labelLarge)),
    ),
    ),
    SizedBox(
    height: 16,
    ),
    Container(
    height: 40,
    width: 300,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: green,
    ),
    child: Text("S'inscrire",
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: GoogleFonts.inknutAntiqua(
    height: 1.5,
    fontSize: 14,
    color: appBgColor,
    textStyle: Theme.of(context).textTheme.labelLarge)),
    ),
    SizedBox(
    height: 3,
    ),
    Text(
    "Version: 1.0.0",
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: TextStyle(
    height: 1.5,
    fontSize: 14,
    color: darker.withOpacity(.5),
    ),
    ),
    SizedBox(
    height: 3,
    ),
    ],
    ),
    ))
    ],
    ));
 */
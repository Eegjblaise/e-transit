import 'package:etransit/Screen/EmailVerification.dart';
import 'package:etransit/Screen/PhoneVerification.dart';
import 'package:flutter/material.dart';
import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:etransit/Screen/profil.dart';

import '../theme/color.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({super.key});

  @override
  State<MonCompte> createState() => _MonCompteState();
}



  class _MonCompteState extends State<MonCompte> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = context.read<AuthService>();
    print(auth.currentUser!.photo);
    return  Scaffold(
        backgroundColor: appBgColor,
        body: Stack(children: [
          SafeArea(
              child: Container(
                color: appBgColor,
                height: height,
                width: width,
                child: ListView(
                  padding: EdgeInsets.only(top: 15, left: 16, right: 16),
                  children: [
                    //pour le bouton de direction
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                // Retourner à la page précédente
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Vérifiez mon profil",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.manrope(
                            fontSize: 16,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            textStyle: Theme.of(context).textTheme.bodyLarge)),
                    const SizedBox(
                      height: 16,
                    ),
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
                              child: Icon(Icons.mail_lock_outlined,
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
                                    MaterialPageRoute(builder: (context) => const EmailVerification()),
                                  );
                                },
                              ),
                            ),
                            subtitle: Text(
                                "Non vérifié",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    height: 1,
                                    fontSize: 10,
                                    textStyle:
                                    Theme.of(context).textTheme.bodySmall)),
                            title: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Email",
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
                              child: Icon(Icons.phone,
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
                                    MaterialPageRoute(builder: (context) => const PhoneVerification()),
                                  );
                                },
                              ),
                            ),
                            subtitle: Text("Non vérifié",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    height: 1,
                                    fontSize: 10,
                                    textStyle:
                                    Theme.of(context).textTheme.bodySmall)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Téléphones",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                        Theme.of(context).textTheme.bodyLarge)),
                                  Icon(Icons.error_outline,
                                 color: Colors.red, size: 17)
                              ],
                            )),

                      ]),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                       height: 300,
                      width: width,
                      decoration: BoxDecoration(
                          color: textBoxColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        ListTile(
                      trailing: Text("Informations non vérifiées ",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                              fontSize: 10,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              textStyle:
                              Theme.of(context).textTheme.bodyLarge)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nom ",
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
                            trailing: Text("Informations non vérifiées ",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.manrope(
                                    fontSize: 10,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    textStyle:
                                    Theme.of(context).textTheme.bodyLarge)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nom",
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
                    const SizedBox(height: 56),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xfffe255EEC),
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
                  ],
                ),
              ))
        ]));
  }
}


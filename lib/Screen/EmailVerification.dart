import 'package:etransit/Screen/CodeEmail.dart';
import 'package:flutter/material.dart';
import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/services/DioClient.dart';
import 'package:etransit/theme/color.dart';
import 'package:etransit/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:etransit/Screen/profil.dart';
import 'package:etransit/theme/string.dart';



class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
                    Text("Un code vous sera envoyé à cette adresse pour vérification",
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
                      width: width,
                      decoration: BoxDecoration(
                        color: textBoxColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: appBgColor,
                            child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: searchanything,
                                  hintStyle: TextStyle(color: secondaryFont )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    const SizedBox(height: 426),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CodeEmail()),
                          );
                        },
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

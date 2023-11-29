import 'package:etransit/Screen/CodeEmail.dart';
import 'package:etransit/Screen/CodePhone.dart';
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
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class PhoneVerification extends StatefulWidget {
  const PhoneVerification ({super.key});


  @override
  State<PhoneVerification> createState() => _PhoneVerification();
}

class _PhoneVerification extends State<PhoneVerification> {

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
                    Text("Un code vous sera envoyé à ce numéro pour vérification",
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            inputDecoration: const InputDecoration(
                              labelText: 'Téléphone',
                            ),
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                            ),
                             initialValue: PhoneNumber(isoCode: 'CM'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    const SizedBox(height: 437),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CodePhone()),
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

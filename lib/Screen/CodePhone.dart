import 'package:etransit/Screen/EmailVerification.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:etransit/Screen/LoginScreen.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CodePhone extends StatefulWidget {
  const CodePhone({Key? key}) : super(key: key);

  @override
  State<CodePhone> createState() => _CodeEmailState();
}

class _CodeEmailState extends State<CodePhone> {
  List<TextEditingController> codeControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = context.read<AuthService>();
    print(auth.currentUser!.photo);
    return Scaffold(
      backgroundColor: appBgColor,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: appBgColor,
              height: height,
              width: width,
              child: ListView(
                padding: EdgeInsets.only(top: 15, left: 16, right: 16),
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.phone_rounded),
                        color: Color(0xff0134b6),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Text(
                    "Vérifier votre  numéro",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    "Entrer le code",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      height: 1,
                      fontSize: 16,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      codeControllers.length,
                          (index) => Container(
                        width: 50,
                        child: TextFormField(
                          controller: codeControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfffe255EEC),
                      ),
                      onPressed: () {},
                      child: Text('Suivant',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.manrope(
                              fontSize: 17,
                              color: textBoxColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge))
                  ),
                  SizedBox(height: 20),
                  Text(" Vous n’avez pas recu de message? Renvoyer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inknutAntiqua(
                          fontSize: 12,
                          color: primary,
                          textStyle: Theme.of(context).textTheme.bodyMedium)),
                  SizedBox(height: 20 ,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            tooltip: 'Back to Log In',
                          ),
                          Text('Back to Log In'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

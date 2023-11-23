import 'package:etransit/Screen/root.dart';
import 'package:etransit/services/AnnoncesService.dart';
import 'package:etransit/services/AuthService.dart';
import 'package:etransit/services/autreService.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AnnoncesService()),
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => AutreService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-transit',
      theme: ThemeData(
        primaryColor: primary,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: RootApp(),
    );
  }
}

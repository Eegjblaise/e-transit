import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset("assets/logo.png"),
            Container(
              height: 40,
              width: width,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}

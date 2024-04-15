import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ));
    });
    return Scaffold(
       backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/splash_screen.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
     
    );
  }
}
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopsify/screens/ProductScreen.dart';
import 'package:shopsify/screens/SignInPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => SignInPage()));
    });
    return Container(
        color: Colors.white,
        //  Theme.of(context).colorScheme.primary,
        child: Center(
            child: Image.asset(
          "assets/images/Shopping.gif",
        )));
  }
}

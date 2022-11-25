import 'package:flutter/material.dart';

class FreshScreen extends StatelessWidget {
  static var routeName = "/-freshscreen";

  const FreshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "shopsify",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

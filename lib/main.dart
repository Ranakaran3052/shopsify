import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/models/CartModel.dart';
import 'package:shopsify/models/ProductsDetails.dart';
import 'package:shopsify/screens/SplashScreen.dart';
import '../screens/ProductScreen.dart';
import 'screens/CartScreen.dart';
import 'screens/SignupPage.dart';
import 'screens/freshScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("main");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shopsify',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange)),
        home:
            //SplashScreen(),
            // SignupPage(),
            ProductScreen(),
        routes: {
          ProductScreen.routeName: (context) => ProductScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          FreshScreen.routeName: (context) => FreshScreen()
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopsify/screens/SignInPage.dart';
import 'package:shopsify/widgets/Drawer/helpPage.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.all(10),
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(0)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/me.png',
                  ),
                  radius: 50,
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  "hello ",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("hello@gmail.com", style: TextStyle(color: Colors.white))
              ],
            ),
          ]),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.payment),
            title: Text("Order"),
            onTap: () {},
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title: Text(" Help & Support"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HelpPage()));
            },
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.login),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => SignInPage()));
            },
          ),
        )
      ],
    ));
  }
}

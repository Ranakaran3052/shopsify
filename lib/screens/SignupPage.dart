import 'package:flutter/material.dart';

import 'SignInPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final _signupformkey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _signupformkey,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Shopsify ',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    const Text(
                      'Sign up ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'enter atleast 3 character  ';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "name"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty || value.contains('@')) {
                          return 'enter  a valid email address ';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Email- id "),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'enter  a valid street  address  ';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: ' Address ',
                          hintText: "Address"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return ' password is too short  ';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'Password',
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        width: 450,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                            child: const Text('Sign - up '),
                            onPressed: () {
                              if (_signupformkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              }
                            })),
                  ],
                ),
              ),
            )));
  }
}

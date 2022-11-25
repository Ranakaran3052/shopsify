import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          children: [Text("help"), Icon(Icons.question_mark_outlined)],
        )),
      ),
      body: Container(
          child: Column(
        children: const  [
          Text(" about sphopsify privacy settings "),
          SizedBox(
            height: 20,
          ),
          Text("change/check your password "),
          SizedBox(
            height: 20,
          ),
          Text(
              "logging in to the shopsify  on your computer  , mac os using smartphone 's unlock method "),
          SizedBox(
            height: 30,
          ),
         
        ],
      
      ),
    
      
      ),
    

      
       
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_checker/screens/auth/login/login.dart';
import 'onBoarding_screen1.dart';

class screen3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: introScreen(imagePath: 'assets/images/onBoardin_screen3.png',context: context,Tital: "Keep Your Equipment Clean", des: "Add equipment, schedule cleanings, and follow checklists to maintain hygiene. Assign cleaning tasks to your team for smooth operations.", btnTxt: "Start",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
            },
          ),
    );
  }
}
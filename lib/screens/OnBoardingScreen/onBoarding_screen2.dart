import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/OnBoardingScreen/onBoarding_screen3.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';

import 'onBoarding_screen1.dart';

class screen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: introScreen(imagePath: Assets.imagesOnBoardinScreen2,context: context,  Tital: "Effortless Staff Management",
        des: "Add team members and update their details as needed. Provide access to specific locations and ensure smooth collaboration within your restaurant.",
        ),
    );
  }
}
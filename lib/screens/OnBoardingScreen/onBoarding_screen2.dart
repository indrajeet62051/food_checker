import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';



class screen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(height: 610,
        child: Image.asset(Assets.imagesOnBoardinScreen2,fit: BoxFit.cover,),
      ),

    );
  }
}
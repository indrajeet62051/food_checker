import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';

import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';


class screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(height: 610,
        child: Image.asset(Assets.imagesOnBoardinScreen1,fit: BoxFit.cover,),
      ),



    );
  }
}


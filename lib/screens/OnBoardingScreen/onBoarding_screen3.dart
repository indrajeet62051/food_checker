import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_checker/screens/auth/login/login.dart';

import '../../generated/assets.dart';



class screen3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(height: 610,
        child: Image.asset(Assets.imagesOnBoardinScreen3,fit: BoxFit.cover,),
      ),

    );
  }
}
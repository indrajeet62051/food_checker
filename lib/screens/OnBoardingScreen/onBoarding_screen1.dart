import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/OnBoardingScreen/onBoarding_screen2.dart';
import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';
import '/screens/OnBoardingScreen/into_screen.dart';

class screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: introScreen(imagePath: Assets.imagesOnBoardinScreen1,context: context,  Tital: "Add and Manage Locations", des: "Easily set up your restaurant locations with names and addresses. Edit or remove locations anytime to keep your information up to date.",

        // onPress: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>screen2()));
        //   },
          )
    );
  }
}

Widget introScreen({
  required String Tital,
  required String des,
  String ? btnTxt,
  VoidCallback ? onPress,
  required BuildContext context,
  required imagePath,


}
    ){
  return Stack(children: [
    Container(height: 914,
      child: Stack(children: [
        Container(
          child: Image.asset(imagePath,fit: BoxFit.cover,),),
        Positioned(
            bottom: 0,
            child: Container(width: 410,height: 328,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
                child: Column(children: [
                  commonText(text: Tital, txtSize: 26,fontWeight: FontWeight.w700,color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 60),
                    child: Text(des,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: graycol),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 55,width: 390,
                      // child: commonButton(text: btnTxt,buttonColor: green.withOpacity(0.9),txtSize: 18,onPress: onPress)
                  )
                ],
                ),
              ),
            ))
      ],),
    ),
    // Positioned(
    //     top: 60,
    //     right: 20,
    //     child: GestureDetector(onTap: () {
    //       Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));
    //     },
    //         child: commonText(text: "Skip", txtSize: 18,fontWeight: FontWeight.w800,color: whiteColor)))
  ],);
}
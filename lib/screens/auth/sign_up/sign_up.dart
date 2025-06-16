import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';

import '../../../core/Constrants/color.dart';
import '../../widget/text_field.dart';
import '../login/login.dart';




class Signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Sign_up();
}

class Sign_up extends State<Signup>{
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body:SingleChildScrollView(
          child: SafeArea(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
            Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/appLogo.svg'),
                  SizedBox(height: 16,),
                  Text("Get Started",style: TextStyle(fontSize: 24,fontFamily: 'PlusJakartaSans',fontWeight: FontWeight.w700),),
                  SizedBox(height: 4,),
                  Text("Create an account to get all features ",style: TextStyle(fontSize: 16,fontFamily: 'PlusJakartaSans',color: graycol ),),
                  SizedBox(height: 90,),
                  Row(children:[
                    Expanded(
                      child: Column(
                        children: [
                          Align(alignment: Alignment.centerLeft,child: Text("First Name",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500,fontFamily:  'PlusJakartaSans',color: graycol),),),
                          SizedBox(height: 8,),
                          commonTextField(hintText: "First Name", Svg_Path: 'assets/icons/User.svg') // First Name
                        ],),
                    ),  //First Name
                    SizedBox(width: 16,), // Space betwn first and lst nm
                    Expanded(
                      child: Column(
                        children: [
                          Align(alignment: Alignment.centerLeft,child: Text("Last Name",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500,fontFamily:  'PlusJakartaSans',color: graycol),),),
                          SizedBox(height: 8,),
                          commonTextField(hintText: "Last Name",Svg_Path: 'assets/icons/User.svg') // Last Name
                        ],),
                    ), //Last name
                  ]),
                  SizedBox(height: 8,),
                  Align(alignment: Alignment.centerLeft ,child: Text("Email", style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500))),
                  SizedBox(height: 8,),
                  commonTextField(hintText: "Enter your email", Svg_Path: 'assets/icons/Mail.svg'), //Email id
                  SizedBox(height: 12,),
                  Align(alignment: Alignment.centerLeft ,child: Text("Password",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
                  SizedBox(height: 8,),
                  commonTextField(hintText: "Enter your Password",Svg_Path: 'assets/icons/Lockcheck.svg'),  //Password
                  SizedBox(height: 12,),
                  Align(alignment: Alignment.centerLeft ,child: Text("Confirm Password",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
                  SizedBox(height: 8,),
                  commonTextField(hintText: "Re-enter Password",Svg_Path: 'assets/icons/Lockcheck.svg'), //Conf Password
                  SizedBox(height: 48,),
                  SizedBox(height: 60,width: 390,
                      child: commonButton(text: "Register", txtSize: 18, context: context,onPress: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));},)),
                  SizedBox(height: 40,),
                  Row(children: [
                    SvgPicture.asset('assets/images/Rectangle_27.svg'),SizedBox(width: 10,),Text("OR",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol),),SizedBox(width: 10,),SvgPicture.asset('assets/images/Rectangle_27.svg')
                  ],),
                  SizedBox(height: 40,),
                  Text("Sign in With",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: graycol),),
                  SizedBox(height: 40,),
                  SvgPicture.asset('assets/images/google_apple_facebook.svg'),
                  SizedBox(height: 40,),
                  Row(children:[ SizedBox(width: screenWidth*0.3348,),Text("Existing User?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: graycol),),
                    TextButton(onPressed: (){
                      Navigator.pop(context) ;
                    }, child: Text("LogIn",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: black,decoration: TextDecoration.underline,decorationColor: black,decorationStyle: TextDecorationStyle.solid,decorationThickness: 1.5),),style: TextButton.styleFrom(padding: EdgeInsets.zero,minimumSize: Size(0, 0)),)

                  ]),
                  SizedBox(height: 43,),





                ],
              ),
            ),
          )),
        )
    );


  }
  // Widget commonTextField(){
  //   return Sca;
  //
  // }

}
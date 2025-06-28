import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/auth/forgot_password/forgot_pass_controller.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:food_checker/screens/widget/text_field.dart';

class ForgotPass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => forgotPassword();
}

class forgotPassword extends State<ForgotPass>{


  late final ForgotPassController forgotPassController;

  @override
  void initState(){
    super.initState();
    forgotPassController = ForgotPassController();
  }

  @override
  void dispose(){
    forgotPassController.dispose();
  }

  @override
  void clear(){
    forgotPassController.clear();
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth  = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SafeArea(child:
          Column(children: [
            SvgPicture.asset('assets/images/appLogo.svg'),
            SizedBox(height: 16,),
            Text("Forgot Password",style: TextStyle(fontSize: 24, fontFamily: 'PlusJakartaSans',fontWeight: FontWeight.w700),),
            SizedBox(height: 4,),
            commonText(text: "Enter your email and reset password", txtSize: 16),
            SizedBox(height: 90,),
            Align(alignment: Alignment.centerLeft, child:
            commonText(text: "Email Address", txtSize: 14),),
            SizedBox(height: 8,),
            commonTextField(hintText: "Enter Your Email Address",Svg_Path: 'assets/icons/Mail.svg',controller: forgotPassController.emailController),
            SizedBox(height: 40,),
            SizedBox(height:60,width: 390,child:  
            commonButton(text: "Request", txtSize: 18,onPress: () {

            },),),
            SizedBox(height: 40,),
            Row(children: [
              SizedBox(width: screenWidth*0.26,),
              Text("Remember Password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'PlusJakartaSans',color: graycol),),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Log In",style: TextStyle(fontFamily: 'PlusJakartaSans',fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),style: TextButton.styleFrom(minimumSize: Size(00, 00),padding: EdgeInsets.all(0),alignment: Alignment.centerLeft),)

            ],)


          ],)
          ),
        ),
      ),
    );
  }

}
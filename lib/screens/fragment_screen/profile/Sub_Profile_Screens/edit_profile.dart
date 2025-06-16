import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text_field.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/card.dart';
import '../../../widget/text.dart';

class EditProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => edit_screen();
}


class edit_screen extends State<EditProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        commAppBar(app_bar: "Profile",onTap: () {
          Navigator.pop(context);
        },),

        SizedBox(width: ScreenWight*0.9069,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
            Padding(
              padding: const EdgeInsets.only(top: 35,bottom: 35),
              child: Stack(children: [
                Container(
                  width: 120, height: 120,
                  decoration: BoxDecoration(color: green, shape: BoxShape.circle),
                  child: Center(child: CircleAvatar(radius: 56,
                    backgroundImage: AssetImage('assets/images/bydefault_user.jpg'),
                  ),
                  ),),
                Positioned(
                  bottom: 0, right: 0,
                  child: Container(
                    width: 38, height: 38,
                    decoration: BoxDecoration(color: green, shape: BoxShape.circle),
                    child: Icon(Icons.camera_alt, color: whiteColor),
                  ),
                ),
              ],),
            ),
            Align(alignment: Alignment.centerLeft ,child: Text("Email", style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500))),
            SizedBox(height: 8,),
            commonTextField(hintText: "Enter your email", Svg_Path: 'assets/icons/Mail.svg'), //Email id
            SizedBox(height: 12,),
            Align(alignment: Alignment.centerLeft ,child: Text("Password",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
            SizedBox(height: 8,),
            commonTextField(hintText: "Enter your Password",Svg_Path: 'assets/icons/Lockcheck.svg'),
            SizedBox(height: 40,),
            SizedBox(width: ScreenWight*0.9069,height: 60,
              child: commonButton(text: "Save Changes",onPress: () {
                Navigator.pop(context);
              }, ))



          ],),
        )

      ],),
    );
  }
}




Widget commAppBar({
  required String app_bar,
  VoidCallback ? onTap,
}){
  return Container(
    height: 90, width: ScreenWight,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [ BoxShadow(
        color: graycol.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 4),
      )
      ],),
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 105),
              child: GestureDetector(onTap:  onTap,
                  child: Icon(Icons.arrow_back)),
            ),
            commonText(text: app_bar, txtSize: 20, color: black, fontWeight: FontWeight.w600,),
          ]),
          SizedBox(height: 15),
        ],
      ),
    ),);
}
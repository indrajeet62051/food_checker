import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text_field.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/card.dart';
import '../../../widget/text.dart';
import 'edit_profile.dart';

class Change_Password extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => change_password();
}


class change_password extends State<Change_Password>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
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
                    padding: const EdgeInsets.only(right: 75),
                    child: GestureDetector(onTap:  () {
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.arrow_back)),
                  ),

                  commonText(text: "Change Password", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                ]),
                SizedBox(height: 15),
              ],
            ),
          ),), //App Bar

        SizedBox(width: ScreenWight*0.9069,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
            SizedBox(height: 24,),
            Align(alignment: Alignment.centerLeft ,child: Text("Current Password ", style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500))),
            SizedBox(height: 8,),
            commonTextField(hintText: "Enter current password", Svg_Path: 'assets/icons/Mail.svg'), //Email id
            SizedBox(height: 12,),
            Align(alignment: Alignment.centerLeft ,child: Text("New Password",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
            SizedBox(height: 8,),
            commonTextField(hintText: "Enter New Password",Svg_Path: 'assets/icons/Lockcheck.svg'),
            SizedBox(height: 8+4,),
            Align(alignment: Alignment.centerLeft ,child: Text("Confirm Password ",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
            SizedBox(height: 8,),
            commonTextField(hintText: "Re-enter Password",Svg_Path: 'assets/icons/Lockcheck.svg'),
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

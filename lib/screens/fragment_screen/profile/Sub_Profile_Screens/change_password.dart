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
        commAppBar(app_bar: "Change Password",onTap: () {
          Navigator.pop(context);
        },),

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

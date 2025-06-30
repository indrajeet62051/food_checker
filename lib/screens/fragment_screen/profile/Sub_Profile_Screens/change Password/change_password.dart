import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/api/Services/change_PassWord_Service.dart';
import 'package:food_checker/api/Services/forgot_password_Service.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/change%20Password/change_pass_controller.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Constrants/color.dart';
import '../../../../widget/card.dart';
import '../../../../widget/text.dart';
import '../edit profile/edit_profile.dart';

class Change_Password extends StatefulWidget{
  const Change_Password({super.key});
  @override
  State<StatefulWidget> createState() => change_password();
}

String auth_Token_C = "";


class change_password extends State<Change_Password>{
  late final ChangePassController controller;

  bool isLoading = false;

  @override
  void initState(){
    controller = ChangePassController();
    super.initState();
    _loaddata();
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  Future<void> _loaddata() async{
    final pref = await SharedPreferences.getInstance();
    final auth_token = pref.getString('auth_token');
    setState((){
      auth_Token_C = '$auth_token';
    });

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ Column(children: [
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
              Align(alignment: Alignment.centerLeft ,child: Text("Current Password ", style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
              SizedBox(height: 8,),
              commonTextField(hintText: "Enter current password", Svg_Path: Assets.iconsLockcheck,controller: controller.CurrentPassController,obsecure: true), //Email id
              SizedBox(height: 12,),
              Align(alignment: Alignment.centerLeft ,child: Text("New Password",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
              SizedBox(height: 8,),
              commonTextField(hintText: "Enter New Password",Svg_Path: 'assets/icons/Lockcheck.svg',controller: controller.NewPassController,obsecure: true),
              SizedBox(height: 8+4,),
              Align(alignment: Alignment.centerLeft ,child: Text("Confirm Password ",style: TextStyle(fontSize: 14,fontFamily: 'PlusJakartaSans',color: graycol,fontWeight: FontWeight.w500),)),
              SizedBox(height: 8,),
              commonTextField(hintText: "Re-enter Password",Svg_Path: 'assets/icons/Lockcheck.svg',controller: controller.ConfPassController,obsecure: true),
              SizedBox(height: 40,),
              SizedBox(width: ScreenWight*0.9069,height: 60,
                  child: commonButton(text: "Save Changes",onPress: () async {
                    final validation = controller.Validation();
                    if(validation != null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(validation)));
                      return null;
                    }
                    setState(() => isLoading = true);
                    final user = await ChangePassWordService().ChangePassUser(OldPass: controller.CurrentPassController.text, NewPass: controller.NewPassController.text);
                    setState(() => isLoading = false);

                    if(user !=null && user.status == 1){
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('new_token', user.data?.authToken?? "");
                      print("New token: ${user.data?.authToken}");


                      Navigator.pop(context);
                    }else {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(user?.msg ?? "Login Fail")),
                      );
                    }







                  }, ))



            ],),
          )

        ],),

          if (isLoading)
            Center(
              child: Container(
                color: Colors.white.withOpacity(
                  0.2,
                ), // semi-transparent background
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
      ]),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:food_checker/screens/widget/row.dart';

import 'Sub_Profile_Screens/Language.dart';
import 'Sub_Profile_Screens/change_password.dart';
import 'Sub_Profile_Screens/edit_profile.dart';
import 'Sub_Profile_Screens/export.dart';
import 'Sub_Profile_Screens/subscription.dart';

class ProfileScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Profile_screen();
}

class Profile_screen extends State<ProfileScreen2> {
  bool isSwitch = true;



  @override
  Widget build(BuildContext context) {
    final double ScreenWight = MediaQuery.of(context).size.width;

    List<ProfileItem> profileItems = [
      ProfileItem(imagePath: 'assets/icons/Edit_pencil.svg', rowText: 'Edit Profile',onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  EditProfileScreen()));
      },),
      ProfileItem(imagePath: 'assets/icons/changePassword.svg', rowText: 'Change Password',onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Change_Password()));
      },),
      ProfileItem(imagePath: 'assets/icons/language.svg', rowText: 'Language',onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Language()));
      },),
      ProfileItem(imagePath: 'assets/icons/Subscription.svg', rowText: 'Subscription',onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Subscription()));
      },),
      ProfileItem(imagePath: 'assets/icons/Export.svg', rowText: 'Export',onTap: () {
        Export(context);
      },),
      ProfileItem(imagePath: 'assets/icons/delete_profile.svg', rowText: 'Delete Account',onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
      },),
      ProfileItem(imagePath: 'assets/icons/SignOut.svg', rowText: 'Log Out',onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
      },),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
              Container(
                height: 90, width: ScreenWight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [ BoxShadow(
                      color: graycol.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 4),
                    )
                  ],),
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      commonText(text: "Profile", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                      SizedBox(height: 15),
                    ],),
                ),),
              Padding(
                padding: const EdgeInsets.only(top: 38, bottom: 16),
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
                  ],
                ),
              ),
              commonText(
                text: "Brew & Bite",
                txtSize: 20,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    child: Column(
                      children: profileItems.asMap().entries.map((entry) {
                        int index = entry.key;
                        ProfileItem item = entry.value;

                        List<Widget> widgets = [commonRowForProfile(item)];
                        if (index == 1) {
                          widgets.add(
                            Padding(
                              padding: const EdgeInsets.only(top: 24, bottom: 2, ),
                              child: SizedBox(
                                height: 28,
                                width: ScreenWight * 0.813,
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/notification_profile.svg'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: commonText(text: "Notification Setting", txtSize: 14, color: black),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Switch(
                                            value: isSwitch,
                                            onChanged: (value) {

                                            },
                                            activeColor: Colors.white,
                                            activeTrackColor: Colors.green,
                                            inactiveThumbColor: Colors.white,
                                            inactiveTrackColor: Colors.grey,
                                          )
                                        ],),
                                    )
                                  ],),
                              ),),);
                        }
                        return Column(children: widgets);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Model
class ProfileItem {
  final String imagePath;
  final String rowText;
  final VoidCallback? onTap;

  ProfileItem({
    required this.imagePath,
    required this.rowText,
    this.onTap,
  });
}




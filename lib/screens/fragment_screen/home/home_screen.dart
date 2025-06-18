import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/fragment_screen/home/suppliers/suppliers_main_screen.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/text.dart';

import 'chilling/chilling_main_screen.dart';
import 'cleaning_schedule/cleaning_schedule_main_screen.dart';
import 'cooking/cooking_main_screen.dart';
import 'hot_holding/hot_holding_mainScreen.dart';
import 'maintenance/maintenance_main_screen.dart';
import 'opening_and_closing/opening_and_closing_mainScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => home_screen();


}

class home_screen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery
        .of(context).size.width;
    final ScreeHeight = MediaQuery
        .of(context).size.height;

    List<HomeItem> homeItem = [
      HomeItem(
          iconPath: 'assets/icons/cooking.svg', text: "Cooking", onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CookingMainScreen()));
      }),
      HomeItem(iconPath: 'assets/icons/hot_holding.svg',
          text: "Hot Holding",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HotHoldingMainscreen()));
          }),
      HomeItem(
          iconPath: 'assets/icons/chilling.svg', text: "Chilling", onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChillingMainScreen()));
      }),
      HomeItem(iconPath: 'assets/icons/Cleaning_Schedule.svg',
          text: "Cleaning Schedule",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => CleaningScheduleMainScreen()));
          }),
      HomeItem(
          iconPath: 'assets/icons/Supplier.svg', text: "Supplier", onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SuppliersMainScreen()));
      }),
      HomeItem(iconPath: 'assets/icons/Opening_Closing_Checks.svg',
          text: "Opening & Closing Checks",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => OpeningAndClosingMainscreen()));
          }),
      HomeItem(iconPath: 'assets/icons/Maintenance.svg',
          text: "Maintenance",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MaintenanceMainScreen()));
          }),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: ScreenWidth,
            height: ScreeHeight * 0.155,
            color: Colors.green.shade50,
            child: SafeArea(
              child: Row(
                children: [
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5, top: 8),
                            child: SvgPicture.asset(
                                'assets/icons/location.svg'),),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 3, top: 8),
                            child: commonText(text: "Brew & Bite",
                                txtSize: 16,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5,
                                left: 5,
                                top: 8),
                            child: SvgPicture.asset(
                                'assets/icons/Vector_11.svg'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: commonText(
                            text: "2464 Royal Ln. Mesa, New Jersey 45463",
                            txtSize: 12),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset('assets/icons/notification.svg'),
                  ),
                ],
              ),
            ),
          ),  // app bar


          // Main screen
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 24),
              itemCount: homeItem.length,
              itemBuilder: (context, index) {
                return commonCardHomePage(homeItem[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/common_button.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/card.dart';
import '../../../widget/text.dart';

class Subscription extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => subscription();


}

class subscription extends State<Subscription>{
  @override
  Widget build(BuildContext context) {
    final ScreenHight = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(children: [
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
                      padding: const EdgeInsets.only(right: 105),
                      child: GestureDetector(onTap:  () {
                        Navigator.pop(context);
                      },
                          child: Icon(Icons.arrow_back)),
                    ),
        
                    commonText(text: "Subscription", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),
          SizedBox(height:ScreenHight*0.6086,width: ScreenWight*0.9069,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SvgPicture.asset(Assets.iconsSubscription2),
            Padding(
              padding: const EdgeInsets.only(top: 21,bottom: 12),
              child: Row(children: [SizedBox(width: ScreenWight*0.2039,),
                commonText(text: "Upgrade to ", txtSize: 24,fontWeight: FontWeight.w700,color: black),
                commonText(text: "Premium", txtSize: 24,fontWeight: FontWeight.w700,color: green)
              ],),
            ),
            SizedBox(width: ScreenWight*0.8139,
                child: Text(
                  "Choose a plan to unlock full access to all features and benefits of our Hygiene & Equipment Management System!",
                style: TextStyle(color: graycol,fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center,))
            ],
          ),),
          SizedBox(width: ScreenWight*0.9069,height: 60,
            child: commonButton(text: "Subcribe",onPress: () {
              Navigator.pop(context);
            },),
          ),
          SizedBox(height: 40,),
          SizedBox(width: ScreenWight*0.9069,
              child: Text(
                "This subscription auto-renews at the end of each year, unless cancelled 24-hours in advance. The fee is charged to your iTunes or Google Play account at confirmation of purchase. You may manage your subscriptions and turn off the auto-renewal by going to your Account Settings. No cancellation of the current subscription is allowed during active subscription period. Any unused portion of a free trial will be forfeited when you purchase a subscription to that publication. By joining you accept our Terms of Use and Privacy Policy.",
                style: TextStyle(color: graycol,fontWeight: FontWeight.w500,fontSize: 11),textAlign: TextAlign.center,))
        
        
        
        
        ],),
      ),
    );
  }

}
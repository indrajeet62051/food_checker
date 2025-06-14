import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';

class HotHoldingMainscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => hotholdingMainScreen();

}

class hotholdingMainScreen extends State<HotHoldingMainscreen>{
  get profileItems => null;



  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.only(right: 110),
                      child: GestureDetector(onTap: (){Navigator.pop(context );},
                          child: Icon(Icons.arrow_back)),
                    ),
                    commonText(text: "Hot Holding", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                    Spacer(),
                    SvgPicture.asset('assets/icons/history.svg', ),

                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),




          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.76, // You can tweak this value
            children: <Widget>[
              commonCardForSubFragmentPage(imagePath: 'assets/images/bydefault_user.jpg',
                  titalText: "oven", subText: "Used for storing dairy...", temp: "12"),
              commonCardForSubFragmentPage(imagePath: 'assets/images/bydefault_user.jpg',
                  titalText: "grill", subText: "Used for storing dairy...", temp: "22"),
            ],
          )





        ],),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SvgPicture.asset('assets/icons/add_button.svg')),
    );
  }

}



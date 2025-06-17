import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/Constrants/color.dart';
import '../auth/login/login.dart';
import '../widget/common_button.dart';
import '../widget/text.dart';
import 'onBoarding_screen1.dart';
import 'onBoarding_screen2.dart';
import 'onBoarding_screen3.dart';


class into_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> Intro_Screen();
}
class Intro_Screen extends State<into_screen>{
  PageController _controller = PageController();
  bool lastPage = false;
  bool SecondPage = false;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children:[ PageView(
            controller: _controller,
            onPageChanged:(index){
              setState(() {
                currentPage = index;

              });
            },
            children: [
              screen1(),
              screen2(),
              screen3(),
            ],),



            if(currentPage == 1)
              Positioned(
                left: 0,right: 0,bottom: 0,
                child: Container(alignment: Alignment(0, 0.915),
                  width: 410,height: 328,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,


                  ),
                  child: Column(children: [
                    SizedBox(height: 25,),
                    commonText(text: "Effortless Staff Management", txtSize: 26,fontWeight: FontWeight.w700,color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 20,left: 20,),
                      child: Text("Add team members and update their details as needed. Provide access to specific locations and ensure smooth collaboration within your restaurant.", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: graycol),
                        textAlign: TextAlign.center,),
                    ),Spacer(),

                    SizedBox(height: 55,width: 390,
                        child: commonButton(text:
                        "Next",buttonColor: green.withOpacity(0.9),txtSize: 18,onPress: () => _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn),)
                    ),
                    SizedBox(height: 70,),



                  ],
                  ),



                ),)
            else if(currentPage == 2)
              Positioned(
                left: 0,right: 0,bottom: 0,
                child: Container(alignment: Alignment(0, 0.915),
                  width: 410,height: 328,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,


                  ),
                  child: Column(children: [
                    SizedBox(height: 25,),
                    commonText(text: "Keep Your Equipment Clean", txtSize: 26,fontWeight: FontWeight.w700,color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 20,left: 20,),
                      child: Text("Add equipment, schedule cleanings, and follow checklists to maintain hygiene. Assign cleaning tasks to your team for smooth operations.", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: graycol),
                        textAlign: TextAlign.center,),
                    ),Spacer(),

                    SizedBox(height: 55,width: 390,
                        child: commonButton(text:
                        "Start",buttonColor: green.withOpacity(0.9),txtSize: 18,onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                        },)
                    ),
                    SizedBox(height: 70,),



                  ],
                  ),



                ),)
            else
              Positioned(
                left: 0,right: 0,bottom: 0,
                child: Container(alignment: Alignment(0, 0.915),
                  width: 410,height: 328,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,


                  ),
                  child: Column(children: [
                    SizedBox(height: 25,),
                    commonText(text: "Add and Manage Locations", txtSize: 26,fontWeight: FontWeight.w700,color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 20,left: 20,),
                      child: Text("Easily set up your restaurant locations with names and addresses. Edit or remove locations anytime to keep your information up to date.", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: graycol),
                        textAlign: TextAlign.center,),
                    ),Spacer(),

                    SizedBox(height: 55,width: 390,
                        child: commonButton(text:
                        "Next",buttonColor: green.withOpacity(0.9),txtSize: 18,  onPress: () => _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn),)
                    ),
                    SizedBox(height: 70,),



                  ],
                  ),



                ),)
            ,//1stscreen











            Container(alignment: Alignment(0, .915),
              child: SmoothPageIndicator(controller: _controller, count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.black,   // Customize as needed
                  dotColor: Colors.grey.shade300,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3.5,  // Makes the active dot wider
                  spacing: 8,
                  radius: 16,
                ),),
            ),



            Positioned(
                top: 60,
                right: 20,
                child: GestureDetector(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                },
                    child: commonText(text: "Skip", txtSize: 18,fontWeight: FontWeight.w800,color: whiteColor)))


          ]),
    );
  }

}
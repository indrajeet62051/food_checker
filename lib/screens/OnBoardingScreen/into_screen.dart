import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/screens/OnBoardingScreen/onBoarding_screen1.dart';
import 'package:food_checker/screens/OnBoardingScreen/onBoarding_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/Constrants/color.dart';
import '../auth/login/login.dart';
import '../widget/common_button.dart';
import '../widget/text.dart';
import 'onBoarding_screen2.dart';

class into_screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> Intro_Screen();
}
class Intro_Screen extends State<into_screen>{
  PageController _controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: Stack(
       children:[ PageView(
         controller: _controller,
         onPageChanged:(index){
           setState(() {
             lastPage = (index == 2) ;
           });
         },
         children: [
         screen1(),
         screen2(),
         screen3(),
       ],),
         Container(alignment: Alignment(0, 0.915),
             child: SmoothPageIndicator(controller: _controller, count: 3,
                 effect: ExpandingDotsEffect(
                   activeDotColor: Colors.black,   // Customize as needed
                   dotColor: Colors.grey.shade300,
                   dotHeight: 8,
                   dotWidth: 8,
                   expansionFactor: 3.5,  // Makes the active dot wider
                   spacing: 8,
                   radius: 16,
                 ),)),
         lastPage ?
         Container(alignment: Alignment(0, .800),
           child: SizedBox(height: 55,width: 390,
               child: commonButton(text: "Start",buttonColor: green.withOpacity(0.9),txtSize: 18,
                 onPress: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                 },)
           ),
         )
         :
         Container(alignment: Alignment(0, .800),
           child: SizedBox(height: 55,width: 390,
               child: commonButton(text: "Next",buttonColor: green.withOpacity(0.9),txtSize: 18,
                 onPress: () => _controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn),)
           ),
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
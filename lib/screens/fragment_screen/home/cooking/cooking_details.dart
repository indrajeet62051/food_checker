import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/text.dart';

class CookingDetails extends StatelessWidget{



  final String title;
  final String description;
  final String imagePath;
  final String temperature;

  const CookingDetails({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.temperature,
  });




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(height: ScreenHeight,color: Colors.green,
          child: Column(children: [
            Container(height:ScreenHeight*0.588,width: ScreenWight,child: 
              buildCardImage(imagePath,)
              ,)
          ],),
          ),
           Positioned(top: 64,left: 20,right: 20,
               child: Container(width: ScreenWight*0.9069,
           child: Row(children: [
             commonButtonforDetailPageHeade(bgColour: Colors.white.withOpacity(0.25),onTap: () {
               Navigator.pop(context);
             },child: Icon(Icons.arrow_back,)),
             Spacer(),
             commonButtonforDetailPageHeade(bgColour: Colors.red.withOpacity(0.25),child: SvgPicture.asset(Assets.iconsDeleteOutline,fit: BoxFit.scaleDown,)),
             SizedBox(width: 16,),

             commonButtonforDetailPageHeade(bgColour:green,child: Icon(Icons.edit,color: whiteColor,)),



           ],),

           )
           ),





          Positioned(right: 0,bottom: 0,left: 0,
        
              child: Container(decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24,bottom: 16),
                    child: commonText(text: title, txtSize: 20,fontWeight: FontWeight.w600,color: black),
                  ),
        
                    SizedBox(height: 125,
                        child: commonText(text: description, txtSize: 14)),
        
                    Padding(
                      padding: const EdgeInsets.only(top:24,bottom: 24),
                      child: Container(height: 55,width: 206,decoration: BoxDecoration(
                        color: green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: green.withOpacity(0.5),width: 2)
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 16,right: 12),
                          child: Row(children: [
                            commonText(text: "Temperature", txtSize: 14,color: black),
                            Spacer(),
                            Container(height: 35,width: 72,decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: black.withOpacity(0.06),width: 1)
        
                            ),
                            child: Center(child: commonText(text: temperature, txtSize: 14,color: whiteColor,fontWeight: FontWeight.w600),),)
                          ],),
                        ),
        
        
                      ],),
        
        
                      ),
                    ),
                    commonText(text: "Inspected By", txtSize: 14,color: black,fontWeight: FontWeight.w600),
                    SizedBox(height: 8,),
                    Container(height: 46,width: 122.5,decoration: BoxDecoration(
                      color: black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: black.withOpacity(0.3),width: 1),
                      ),
        
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12,left: 5.5),
                      child: Row(children: [
                        Container(height: 35,width: 35,decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: green
                        ),
                        child: ClipOval(child: Image.asset(Assets.imagesByDefaultFemaleUser,fit: BoxFit.cover,)),
        
                        ),Spacer(),
                        commonText(text: "John Doe", txtSize: 14,color: black)
                      ],),
                    ),
        
        
                      ),
                    SizedBox(height: 26,)
        
                ],
        
                ),
              ),
        
              )),
        ],
        
        ),
      ),

    );
  }
}



Widget commonButtonforDetailPageHeade({
  VoidCallback ? onTap,
  Color ? bgColour,
  Widget ? child,
  }
    ){
  return  GestureDetector(
    onTap: onTap,
    child: Container(height: 60,width: 60, decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColour ?? whiteColor,
    ),

      child: SizedBox(height: 20 ,width: 20,

          child: child),
    ),
  );
}
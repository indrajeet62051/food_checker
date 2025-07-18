



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/text.dart';




class CleaningDetails extends StatelessWidget{



  final String title;
  final String ? description;
  final String imagePath;
  final String Requirment;
  final String Location;

  const CleaningDetails({
    super.key,
    required this.title,
    this.description,
    required this.imagePath,
    required this.Requirment,
    required this.Location,
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
                  commonButtonforDetailPageHeade(bgColour: Colors.white.withOpacity(0.3),onTap: () {
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back,)),
                  Spacer(),

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

                      SizedBox(height: 80,
                          child: commonText(text: description ?? "Ensure toilets are thoroughly cleaned and sanitized to"
                              "maintain hygiene and prevent the spread of germs. This includes scrubbing toilet bowls, cleaning seats,"
                              "wiping down flush handles.", txtSize: 14)),

                      Padding(
                        padding: const EdgeInsets.only(top:24,bottom: 24),
                        child: Row(children: [

                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            commonText(text: "Requirement", txtSize: 14,fontWeight: FontWeight.w500),
                            SizedBox(height: 8,),
                            Container(
                              height: 46,width: 126,decoration: BoxDecoration(
                              color: black.withOpacity(0.02),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: black.withOpacity(0.06),width: 1),
                            ),

                              child: Center(child: commonText(text: Requirment, txtSize: 14,fontWeight: FontWeight.w600,color: green),),


                            ),
                          ],),
                          SizedBox(width: 27.5,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            commonText(text: "Inspected By", txtSize: 14,fontWeight: FontWeight.w500),
                            SizedBox(height: 8,),
                            Container(
                              height: 46,width: 122.5,decoration: BoxDecoration(
                              color: black.withOpacity(0.02),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: black.withOpacity(0.06),width: 1),
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
                                  commonText(text: "John Doe", txtSize: 14,color: black,fontWeight: FontWeight.w500)
                                ],),
                              ),


                            ),
                          ],)
                        ],)
                      ),
                      commonText(text: "Location", txtSize: 14,fontWeight: FontWeight.w500),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                        color: black.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: black.withOpacity(0.06),width: 1),
                      ),

                        child: Center(child: Row(children:[ Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20,right: 5,left: 20),
                          child: SvgPicture.asset(Assets.iconsLocation),
                        ),
                            commonText(text: Location, txtSize: 16,fontWeight: FontWeight.w600,color: black)



                        ]),),


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
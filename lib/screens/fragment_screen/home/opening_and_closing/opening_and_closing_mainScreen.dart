import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';

class OpeningAndClosingMainscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => openingAndClosingMainscreen();

}

class openingAndClosingMainscreen extends State<OpeningAndClosingMainscreen>{
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
                      padding: const EdgeInsets.only(right: 43),
                      child: GestureDetector(onTap: (){Navigator.pop(context );},
                          child: Icon(Icons.arrow_back)),
                    ),
                    commonText(text: "Opening & Closing Checks ", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                    Spacer(),
                    SvgPicture.asset('assets/icons/history.svg', ),

                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(top: 12,bottom: 12),
            child: SizedBox(
              width: ScreenWight * 0.906,
              child: Card(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22,top: 28.5,bottom: 28.5,right: 10),
                    child: Row(children: [
                      commonText(text: "1", txtSize: 20,fontWeight: FontWeight.w700,color: green),
                      commonText(text: ".", txtSize: 20,fontWeight: FontWeight.w700,color: green),

                    ],)

                  ),
                  Expanded(child: commonText(text: "Turn on kitchen equipment and check functionality.", txtSize: 14,color: black)),
                  SvgPicture.asset('assets/icons/Edit.svg'),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 15),
                    child: SvgPicture.asset('assets/icons/delete.svg'),
                  )

                ],),
              ),
            ),
          ),
          commonCardForOpeningAndClosing(number: "2", details: "Maintain hygiene in foodpreparation.",)



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


Widget commonCardForOpeningAndClosing({
  required String number,
  required String details,
  VoidCallback ? OnTap_edit,
  VoidCallback ? OnTap_delete,
}){

  return Padding(
    padding: const EdgeInsets.only(top: 0,bottom: 12),
    child: SizedBox(
      width: ScreenWight * 0.906,
      child: Card(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 22,top: 28.5,bottom: 28.5,right: 10),
            child: Row(
              children: [
                commonText(text: number, txtSize: 20,fontWeight: FontWeight.w700,color: green),
                commonText(text: ".", txtSize: 20,fontWeight: FontWeight.w700,color: green),
              ],
            ),
          ),
          Expanded(child: commonText(text: details, txtSize: 14,color: black)),
          GestureDetector(onTap: OnTap_edit,
              child: SvgPicture.asset('assets/icons/Edit.svg')),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 15),
            child: GestureDetector(onTap: OnTap_delete,
                child: SvgPicture.asset('assets/icons/delete.svg')),
          )

        ],),
      ),
    ),
  );
}


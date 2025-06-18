import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/text.dart';



class SupplierDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => supplierDetails();
}

class supplierDetails extends State<SupplierDetails>{
  @override
  Widget build(BuildContext context) {
    final SHight = MediaQuery.of(context).size.height;
    final SWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        Container(height: SHight*0.70,width: SWidth,
        child: Image.asset(Assets.imagesOnBoardinScreen3,fit: BoxFit.cover,),),

        Align(alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 24,left: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            commonText(text: "Darrell Steward", txtSize: 20,fontWeight: FontWeight.w600,color: black),
            Padding(
              padding: const EdgeInsets.only(top: 6,bottom: 20),
              child: commonText(text: "Frozen Food", txtSize: 14),
            ),
            Container(width: SWidth*0.479,height: 55,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: green.withOpacity(0.15),
              border: Border.all(color: green.withOpacity(0.5),width: 2),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              commonText(text: "Temperature", txtSize: 14,color: black),
              SizedBox(width: 20,),
              Container(height: 35,width: 72,decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                commonText(text: "23", txtSize: 14,color: whiteColor),
                commonText(text: "°C", txtSize: 14,color: whiteColor),

              ],),

              )


            ],),
            )
          ],),
        ),)


      ],),




    );
  }

}
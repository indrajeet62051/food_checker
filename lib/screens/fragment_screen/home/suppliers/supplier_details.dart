import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/text.dart';



class SupplierDetails extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String temperature;

  const SupplierDetails({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.temperature,
  });



  @override
  Widget build(BuildContext context) {
    final SHight = MediaQuery.of(context).size.height;
    final SWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        Stack(
          children:[ Container(height: SHight*0.70,width: SWidth,
            child: Image.asset(imagePath,fit: BoxFit.cover,),),

            Positioned(child: Padding(
              padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
              child: SizedBox(width: SWidth*0.9069,height: 60,
              child: Row(children: [
                GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                  child: Container(height: 60,width: 60,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3)
                  ),
                  child: Center(child:
                    Icon(Icons.arrow_back,color: whiteColor,),),),
                ),
                Spacer(),

                GestureDetector(onTap: () {
                  Navigator.pop(context);
                },
                  child: Container(height: 60,width: 60,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: green
                  ),
                    child: Center(child:
                    Icon(Icons.edit,color: whiteColor,),),),
                )
              ],),),
            ))
        ]),

        Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 24,left: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              commonText(text: title, txtSize: 20,fontWeight: FontWeight.w600,color: black),
              Padding(
                padding: const EdgeInsets.only(top: 6,bottom: 20),
                child: commonText(text: description, txtSize: 14),
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
                          commonText(text: temperature, txtSize: 14,color: whiteColor),
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


//
//
//
// class SupplierDetails extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => supplierDetails();
// }
//
// class supplierDetails extends State<SupplierDetails>{
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Column(children: [
//         Container(height: SHight*0.70,width: SWidth,
//         child: Image.asset(Assets.imagesOnBoardinScreen3,fit: BoxFit.cover,),),
//
//         Align(alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 24,left: 20),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//             commonText(text: "Darrell Steward", txtSize: 20,fontWeight: FontWeight.w600,color: black),
//             Padding(
//               padding: const EdgeInsets.only(top: 6,bottom: 20),
//               child: commonText(text: "Frozen Food", txtSize: 14),
//             ),
//             Container(width: SWidth*0.479,height: 55,decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: green.withOpacity(0.15),
//               border: Border.all(color: green.withOpacity(0.5),width: 2),
//             ),
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//               commonText(text: "Temperature", txtSize: 14,color: black),
//               SizedBox(width: 20,),
//               Container(height: 35,width: 72,decoration: BoxDecoration(
//                 color: green,
//                 borderRadius: BorderRadius.circular(15)
//               ),
//               child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                 commonText(text: "23", txtSize: 14,color: whiteColor),
//                 commonText(text: "°C", txtSize: 14,color: whiteColor),
//
//               ],),
//
//               )
//
//
//             ],),
//             )
//           ],),
//         ),)
//
//
//       ],),
//
//
//
//
//     );
//   }
//
// }
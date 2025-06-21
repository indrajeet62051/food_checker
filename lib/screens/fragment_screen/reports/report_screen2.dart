import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/fragment_screen/reports/report_in_details.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:food_checker/screens/widget/text_field.dart';

class ReportScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Report_Screen();
}

class Report_Screen extends State<ReportScreen2> {
  List<ReportCardModel> reportInDetail = [
    ReportCardModel(
      reportTitle: "Oven Not Heating Properly",
      reportDetail:
      "The oven is not reaching the required temperature,causing delays in food preparation. The issue wasreported after multiple failed attempts to heat itproperly.",
      taskText: "Maintain hygiene in food Preparation.",
      reporterName: "Sarah Thompson",
      userAvatarPath: 'assets/images/reporter2.png',
    ),

    ReportCardModel(
      reportTitle: "Gas leak Detacted",
      reportDetail: "abcgsbsb",
      taskText: "vjhsdvh",
      userAvatarPath: 'assets/images/reporter1.png',
      reporterName: "nikhil",
    ),
    ReportCardModel(
      reportTitle: "Gas leak Detacted",
      reportDetail: "abcgsbsb",
      taskText: "vjhsdvh",
      reporterName: "nikhil ",
      userAvatarPath: 'assets/images/reporter2.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ScreenWight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        shadowColor: Colors.black,
        title: Container(
          alignment: Alignment.center,
          child: commonText(
            text: "Report",
            txtSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
        // backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 17, left: 17, top: 10),
        child: ListView.builder(
          itemCount: reportInDetail.length,
          itemBuilder: (context, index) {
            final cardData = reportInDetail[index];
            return ReportCardWidget(
              data: ReportCardModel(
                reportTitle: cardData.reportTitle,
                reportDetail: cardData.reportDetail,
                taskText: cardData.taskText,
                reporterName: cardData.reporterName,
                userAvatarPath: cardData.userAvatarPath,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ReportScreen_details(data: cardData),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


// Card(
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           commonText(text: "Report :  ", txtSize: 18,color: green,fontWeight: FontWeight.w600),
//           Expanded(child: commonText(text: "Oven Not Heating Properly", txtSize: 18,fontWeight: FontWeight.w600,color: black)) //report title
//         ],),//Report tile row
//         Padding(
//           padding: const EdgeInsets.only(top: 12,bottom: 20),
//           child: commonText(
//               text:
//               "The oven is not reaching the required temperature,causing delays in food preparation. The issue wasreported after multiple failed attempts to heat itproperly.", txtSize: 14), //report detail
//         ), //detail txt
//         commonText(text: "Task", txtSize: 14),
//         Card(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 12,bottom: 12,left: 8,right: 8),
//             child: commonText(text: "Maintain hygiene in food Preparation .", txtSize: 14,color: black),//task txt
//           ),
//         ),
//         SizedBox(width: ScreenWight * 0.501,
//           child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//             margin: EdgeInsets.only(top: 16,bottom: 16),
//             child: Row(children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 4,bottom: 4,left: 4,right: 6),
//                 child: CircleAvatar(child: Image.asset('assets/images/reporter1.png')),//user avtar
//               ),
//               Expanded(child: commonText(text: "NAme of reporter", txtSize: 14,color: black))//name of reporter
//             ],
//             ),),
//         ),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Comment",
//             hintStyle: TextStyle(color: graycol,fontWeight: FontWeight.w500,fontSize: 14),
//             suffixIcon: Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10,right: 20),
//               child: SvgPicture.asset('assets/icons/send arrow.svg',width: 24,height: 24,fit: BoxFit.contain,),
//             ),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(
//                   color: black,
//                 )
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(
//                 color: Colors.green, // border when focused
//                 width: 2.0,
//               ),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 24,bottom: 20),
//           child: Row(
//             children: [
//               SizedBox(height: 50,width: ScreenWight*0.397,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: greenColor,
//                         width: 2.0,
//                       ),
//                       borderRadius: BorderRadius.circular(20,),
//                       color: greenColor.withOpacity(0.1),
//                     ),
//
//                     child:  Center(
//                       child: commonText(text: "Checking", txtSize:16,color: greenColor,fontWeight: FontWeight.w700),
//                     ),
//                   )),
//               SizedBox(width: 10,),
//               SizedBox(height: 50,width: ScreenWight*0.397,
//                 child: commonButton(text: "Resolve",
//                     textColor: whiteColor,txtSize: 16,buttonShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular( 20),
//                     )),
//               )
//             ],),
//         ),
//
//
//
//
//
//
//       ],),
//   ), //main column inside individual crd
// ),////
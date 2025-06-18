import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_checker/screens/fragment_screen/home/home_screen.dart';
import 'package:food_checker/screens/widget/text.dart';

import '../../core/Constrants/color.dart';
import '../fragment_screen/home/home_screen2.dart';
import '../fragment_screen/staff/staff_screen.dart';
import 'common_button.dart' show commonButton;

double ScreenWight = 430;
double ScreenHeight = 914;



class HomeItem {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  HomeItem({
    required this.iconPath,
    required this.text,
    this.onTap,
  });
}

Widget commonCardHomePage(HomeItem item) {
  return GestureDetector(
    onTap: item.onTap,
    child: Padding(
      padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SvgPicture.asset(item.iconPath),

              SizedBox(width: 16),
              Expanded(
                child: commonText(
                  text: item.text,
                  txtSize: 16,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),


              SvgPicture.asset('assets/icons/right_sid_arrow.svg'),
            ],
          ),
        ),
      ),
    ),
  );
}

class ReportCard extends StatelessWidget {
  final String reportTitle;
  final String reportDetail;
  final String taskText;
  final String reporterName;
  final String userAvatarPath; // optional

  const ReportCard({
    super.key,
    required this.reportTitle,
    required this.reportDetail,
    required this.taskText,
    required this.reporterName,
    required this.userAvatarPath,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(elevation: 5, color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              commonText(
                  text: "Report :  ",
                  txtSize: 18,
                  color: greenColor,
                  fontWeight: FontWeight.w600),
              Expanded(
                child: commonText(
                    text: reportTitle,
                    txtSize: 18,
                    fontWeight: FontWeight.w600,
                    color: black),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: commonText(text: reportDetail, txtSize: 14),
          ),
          commonText(text: "Task", txtSize: 14),
          Card(
            child: Padding(
              padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
              child:
              commonText(text: taskText, txtSize: 14, color: black),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.501,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  ),

              margin: const EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 4, right: 6),
                    child: CircleAvatar(
                        child: Image.asset(userAvatarPath)),
                  ),
                  Expanded(
                    child: commonText(
                        text: reporterName, txtSize: 14, color: black),
                  )
                ],
              ),
            ),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: litegray,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Comment",
                hintStyle: const TextStyle(
                    color: graycol, fontWeight: FontWeight.w500, fontSize: 14),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 20),
                  child: SvgPicture.asset('assets/icons/send_arrow.svg',
                      width: 24, height: 24, fit: BoxFit.contain),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: greenColor, width: 2.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: screenWidth * 0.397,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: greenColor, width: 2.0),
                      borderRadius: BorderRadius.circular(20),
                      color: greenColor.withOpacity(0.1),
                    ),
                    child: Center(
                      child: commonText(
                          text: "Checking",
                          txtSize: 16,
                          color: greenColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  width: screenWidth * 0.397,
                  child: commonButton(
                    text: "Resolve",
                    textColor: whiteColor,
                    txtSize: 16,
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}




// Widget commonCardforStaff(
//     StaffCard item
//     ){
//
//   return Padding(
//     padding: const EdgeInsets.only(left: 15,right: 15),
//     child: SizedBox(
//       width: ScreenWight * 0.906,
//       height: 102,
//       child: Card(
//         margin: EdgeInsets.only(bottom: 8),
//         child: Row(children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox( width: 70,height: 70,
//               child: CircleAvatar(backgroundColor: green,
//                 child: SizedBox(height: 67,width: 67,  child: ClipOval(child: Image.asset(item.image_path ?? 'assets/images/bydefault_user.jpg',fit: BoxFit.cover,))),
//               ),
//             ),
//           ),  //staff Photo
//
//           Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 12,bottom: 4),
//               child: Row(children: [
//                 commonText(text: item.staffName, txtSize: 14,fontWeight: FontWeight.w600,color: black),
//                 commonText(text: " (", txtSize: 14,fontWeight: FontWeight.w600,color: green),
//                 commonText(text: item.designation, txtSize: 14,fontWeight: FontWeight.w600,color: green),
//                 commonText(text: ") ", txtSize: 14,fontWeight: FontWeight.w600,color: green),
//               ],),
//             ) , //staff name and designation
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: commonText(text: item.allocation, txtSize: 12),
//             ),
//             Row(children: [
//               SvgPicture.asset('assets/icons/location.svg',),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5.0),
//                 child: commonText(text: item.kitchen_Location, txtSize: 12,color: black),
//               )
//             ],) //Kitchen Location
//           ],),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 22),
//               child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: SvgPicture.asset('assets/icons/Edit.svg'),
//                   ),
//                   SvgPicture.asset('assets/icons/delete.svg'),
//                 ],
//               ),
//             ),
//           )
//
//         ],),
//       ),
//     ),
//   );
// }




class fragmentCommCard {
  final String imagePath;
  final String titalText;
  final VoidCallback? onTap;
  final String subText;
  final String temp;

  fragmentCommCard({
    required this.imagePath,
    required this.titalText,
    required this.subText,
    required this.temp,
    this.onTap,
  });
}



Widget commonCardForSubFragmentPage(fragmentCommCard item){
  return GestureDetector(
    onTap: item.onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 0),
              child: commonText(
                text: item.titalText,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            commonText(
              text: item.subText,
              txtSize: 11,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                commonText(
                  text:  "Temp.: ",
                  txtSize: 11,
                  color: liteDarkgrey,
                ),
                commonText(
                  text: item.temp,
                  txtSize: 11,
                  color: green,
                  fontWeight: FontWeight.w600,
                ),
                commonText(
                  text: "°C",
                  txtSize: 11,
                  color: green,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  )
    ;

}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_checker/screens/fragment_screen/home/home_screen.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../core/Constrants/color.dart';
import '../fragment_screen/home/home_screen2.dart';
import '../fragment_screen/reports/report_in_details.dart';
import '../fragment_screen/staff/editScrenen.dart';
import '../fragment_screen/staff/staff_screen.dart';
import 'common_button.dart' show commonButton;

double ScreenWight = 430;
double ScreenHeight = 914;

class HomeItem {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  HomeItem({required this.iconPath, required this.text, this.onTap});
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











class ReportCardModel {
  final String reportTitle;
  final String reportDetail;
  final String taskText;
  final String reporterName;
  final String userAvatarPath; // optional
  final VoidCallback? onTap;

  const ReportCardModel({
    required this.reportTitle,
    required this.reportDetail,
    required this.taskText,
    required this.reporterName,
    required this.userAvatarPath,
    this.onTap,
  });
}

class ReportCardWidget extends StatelessWidget {
  final ReportCardModel data;

  const ReportCardWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap:
      data.onTap ??
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportScreen_details(data: data),
              ),
            );
          },
      child: Card(
        elevation: 5,
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  commonText(
                    text: "Report :  ",
                    txtSize: 18,
                    color: greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(
                    child: commonText(
                      text: data.reportTitle,
                      txtSize: 18,
                      fontWeight: FontWeight.w600,
                      color: black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                child: commonText(text: data.reportDetail, txtSize: 14),
              ),
              commonText(text: "Task", txtSize: 14),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 8,
                    right: 8,
                  ),
                  child: commonText(
                    text: data.taskText,
                    txtSize: 14,
                    color: black,
                  ),
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
                          top: 4,
                          bottom: 4,
                          left: 4,
                          right: 6,
                        ),
                        child: CircleAvatar(
                          child: Image.asset(data.userAvatarPath),
                        ),
                      ),
                      Expanded(
                        child: commonText(
                          text: data.reporterName,
                          txtSize: 14,
                          color: black,
                        ),
                      ),
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
                      color: graycol,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                        bottom: 10,
                        right: 20,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/send_arrow.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: greenColor,
                        width: 2.0,
                      ),
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
                      child: GestureDetector(onTap: () => editScreen(),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: greenColor, width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                            color: greenColor.withOpacity(0.1),
                          ),
                          child: Center(
                            child: commonText(
                              text: "Closed",
                              txtSize: 16,
                              color: greenColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

// Helper to build image from asset or file
Widget buildCardImage(String imagePath,
    {double ? height,}

    ) {
  if (imagePath.startsWith('assets/')) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: height,
    );
  } else {
    return Image.file(
      File(imagePath),
      fit: BoxFit.cover,
      width: double.infinity,
      height: height,
    );
  }
}

Widget commonCardForSubFragmentPage(fragmentCommCard item) {
  return GestureDetector(
    onTap: item.onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
              text: item.subText.length > 26
                  ? '${item.subText.substring(0, 26)}...'
                  : item.subText,
              txtSize: 11,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                commonText(text: "Temp.: ", txtSize: 11, color: liteDarkgrey),
                commonText(
                  text: item.temp,
                  txtSize: 11,
                  color: green,
                  fontWeight: FontWeight.w600,
                ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}




class HistoryCommonCard {
  final String title;
  final String description;
  final String temp;
  final DateTime date;
  final VoidCallback? onTap;

  HistoryCommonCard({
    required this.title,
    required this.description,
    required this.temp,
    required this.date,
    this.onTap,
  });
}



Widget commonCardForHistory(HistoryCommonCard item) {
  return GestureDetector(
    onTap: item.onTap,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: black.withOpacity(0.02),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: black.withOpacity(0.06),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: litegray.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            commonText(
              text: item.title!,
              txtSize: 16,
              color: black,
              fontWeight: FontWeight.w600,
            ),
            // if (item.title != null)
            //   commonText(
            //     text: item.title!,
            //     txtSize: 16,
            //     color: black,
            //     fontWeight: FontWeight.w600,
            //   ),
            const SizedBox(height: 4),
            commonText(
                text: item.description.length > 77
                    ? '${item.description.substring(0, 78)}...'
                    : item.description,
                txtSize: 15
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                commonText(
                  text: 'Temp.: ',
                  txtSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                commonText(
                  text: item.temp,
                  txtSize: 14,
                  color: greenColor,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 24),
                SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  height: 18,
                  width: 18,
                ),
                const SizedBox(width: 8),
                commonText(
                  text: DateFormat('dd-MMM-yyyy, hh:mm a').format(item.date),
                  txtSize: 13,
                  color: graycol,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}







class StaffItem {
  final String staffName;
  final String designation;
  final String allocation;
  final String kitchen_Location;
  final String image_path;

  StaffItem({
    required this.staffName,
    required this.designation,
    required this.allocation,
    required this.kitchen_Location,
    required this.image_path,
  });
}


class CommonStaffCard extends StatelessWidget {
  final StaffItem item;
  final VoidCallback onTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  const CommonStaffCard({
    super.key,
    required this.item,
    required this.onTap,
    this.onEditTap,
    this.onDeleteTap,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.906,
          height: 102,
          child: Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                _buildStaffImage(item),
                _buildStaffDetails(item),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStaffImage(StaffItem item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircleAvatar(
          backgroundColor: green,
          child: SizedBox(
            height: 67,
            width: 67,
            child: ClipOval(
              child:
              item.image_path.startsWith('assets/')
                  ? Image.asset(item.image_path, fit: BoxFit.cover)
                  : Image.file(File(item.image_path), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStaffDetails(StaffItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              commonText(
                text: item.staffName,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: black,
              ),
              commonText(
                text: " (",
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
              commonText(
                text: item.designation,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
              commonText(
                text: ") ",
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: commonText(text: item.allocation, txtSize: 12),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/location.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: commonText(
                text: item.kitchen_Location,
                txtSize: 12,
                color: black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: onEditTap,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector( onTap: () => editScreen(),
                    child: SvgPicture.asset('assets/icons/Edit.svg')),
              ),
            ),
            GestureDetector(
              onTap: onDeleteTap,
              child: SvgPicture.asset('assets/icons/delete.svg'),
            ),
          ],
        ),
      ),
    );
  }
}



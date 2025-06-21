
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import '../../../widget/card.dart';
import '../../../widget/common_filter.dart';



class OnCHistory extends StatefulWidget {
  const OnCHistory({Key? key}) : super(key: key);

  @override
  State<OnCHistory> createState() => OnChistory();
}

class OnChistory extends State<OnCHistory> {
  int selectedIndex = 1;

  // final List<Map<String, dynamic>> historyList = [
  //   {
  //     'title': 'Spaghetti Carbonara',
  //     'desc':
  //     'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
  //     'temp': '23°C',
  //     'date': DateTime(2025, 3, 25, 8, 30),
  //   },
  //   {
  //     'title': 'Grilled Salmon with Lemon Butter',
  //     'desc':
  //     'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
  //     'temp': '23°C',
  //     'date': DateTime(2025, 3, 26, 9, 30),
  //   },
  //   {
  //     'title': 'Chicken Teriyaki',
  //     'desc':
  //     'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
  //     'temp': '23°C',
  //     'date': DateTime(2025, 3, 27, 10, 0),
  //   },
  // ];

  @override
  Widget build(BuildContext context) {

    final List<OnCHistoryCommonCard> OnCHistoryList = [
      OnCHistoryCommonCard(
        title: 'Toilets',area: "Back Office",
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',

        date: DateTime(2025, 3, 25, 8, 30),
      ),
      OnCHistoryCommonCard(
        title: 'Floor',area: "Washroom",
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',

        date: DateTime(2025, 3, 26, 9, 30),
      ),
      OnCHistoryCommonCard(
        title: 'Prep Tables',area: "Kitchen",
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',

        date: DateTime(2025, 3, 27, 10, 0),
      ),
    ];



    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          // Header/AppBar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(color: litegray, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: black),
                ),
                Spacer(),
                commonText(
                  text: 'Opening & Closing Checks ',
                  txtSize: 20,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),

              ],
            ),
          ),
          const SizedBox(height: 16),
          // History List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: OnCHistoryList.length,
              itemBuilder: (context, index) {
                final card = OnCHistoryList[index];
                return  OnCcommonCardForHistory(OnCHistoryCommonCard(title: card.title,
                    date: card.date,area: card.area,description: card.description));
                // commonCardForSubFragmentPage(
                //   HistoryCommonCard(
                //     imagePath: card.imagePath,
                //     titalText: card.titalText,
                //     subText: card.subText,
                //     temp: card.temp,
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder:
                //               (context) => CookingDetails(
                //             title: card.titalText,
                //             description: card.subText,
                //             imagePath: card.imagePath,
                //             temperature: card.temp,
                //           ),
                //         ),
                //       );
                //     } ,
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}



















class OnCHistoryCommonCard {
  final String title;
  final String area;
  final String description;


  final DateTime date;
  final VoidCallback? onTap;

  OnCHistoryCommonCard({
    required this.title,
    required this.area,
    required this.description,


    required this.date,
    this.onTap,
  });
}



Widget OnCcommonCardForHistory(OnCHistoryCommonCard item) {
  return GestureDetector(
    onTap: item.onTap,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 12),
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

            // commonText(
            //   text: item.title,
            //   txtSize: 16,
            //   color: black,
            //   fontWeight: FontWeight.w600,
            // ),
            commonText(
                text: item.description.length > 45
                    ? '${item.description.substring(0, 45)}...'
                    : item.description,
                txtSize: 14,
              color: black
            ),

            // const SizedBox(height: 4+8+4),
            // Row(children:[ SvgPicture.asset(Assets.iconsLocation),
            //   commonText(text: "  Location: ", txtSize: 12,fontWeight: FontWeight.w600,color: graycol),
            //   commonText(text: item.area, txtSize: 12,fontWeight: FontWeight.w600,color: green)
            //
            //
            //
            // ]),
            const SizedBox(height: 8+4),
            Row(
              children: [
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
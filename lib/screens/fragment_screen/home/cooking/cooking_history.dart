import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import '../../../../core/Constrants/color.dart';
import '../../../widget/card.dart';
import '../../../widget/common_filter.dart';
import '../../../widget/text.dart';
import 'package:intl/intl.dart';


class CookingHistory extends StatefulWidget {
  const CookingHistory({Key? key}) : super(key: key);

  @override
  State<CookingHistory> createState() => _CookingHistoryState();
}

class _CookingHistoryState extends State<CookingHistory> {
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

    final List<HistoryCommonCard> CookingHistoryList = [
      HistoryCommonCard(
        title: 'Spaghetti Carbonara',
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
        temp: '23°C',
        date: DateTime(2025, 3, 25, 8, 30),
      ),
      HistoryCommonCard(
        title: 'Grilled Salmon with Lemon Butter',
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
        temp: '23°C',
        date: DateTime(2025, 3, 26, 9, 30),
      ),
      HistoryCommonCard(
        title: 'Chicken Teriyaki',
        description: 'Used for baking cheesecakes, roasting meats, and broiling French onion soup...',
        temp: '23°C',
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
                  text: 'Cooking History',
                  txtSize: 20,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () async {
                    await CommonFilterModal(context: context);
                  },
                  child: Container(
                    height: 28,
                    width: 28,
                    child: SvgPicture.asset(
                      Assets.iconsFilter,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // History List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: CookingHistoryList.length,
              itemBuilder: (context, index) {
                final card = CookingHistoryList[index];
                return  commonCardForHistory(HistoryCommonCard(title: card.title, description: card.description,
                    temp: card.temp, date: card.date));
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

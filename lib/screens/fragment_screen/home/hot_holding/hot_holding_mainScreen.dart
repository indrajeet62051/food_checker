import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../../utils/navigator.dart';
import '../../../widget/text.dart';

import 'add_Hot_Holding/add_hot_holding.dart';
import 'hot_holding_history.dart';
import 'hotholding_details.dart';

class HotHoldingMainscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => hotholdingMainScreen();
}

class hotholdingMainScreen extends State<HotHoldingMainscreen> {
  get profileItems => null;

  List<fragmentCommCard> hotHoldingCardList = [
    fragmentCommCard(
      imagePath: 'assets/images/bydefault_user.jpg',
      titalText: 'oven',
      subText:
      "An oven is a kitchen appliance used for baking, roasting, and heating food. It operates by generating and maintaining heat within an enclosed space, ensuring even cooking. Ovens can be powered by electricity, gas, or even wood in traditional setups.",
      temp: '12°C',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> hotHolding = [
      {
        "title": "oven",
        "description": "Used for storing dairy...",
        "image": "assets/images/bydefault_user.jpg",
        "temp": "12",
      },
      {
        "title": "grill",
        "description": "Used for storing dairy...",
        "image": "assets/images/bydefault_user.jpg",
        "temp": "12",
      },
    ];

    // List<fragmentCommCard> hotHolding = [
    //   fragmentCommCard(imagePath: 'assets/images/bydefault_user.jpg',
    //       titalText: "oven", subText: "Used for storing dairy...", temp: "12"),
    //   fragmentCommCard(imagePath: 'assets/images/bydefault_user.jpg',
    //       titalText: "grill", subText: "Used for storing dairy...", temp: "22"),
    //
    // ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 90,
              width: ScreenWight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: graycol.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 110),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        commonText(
                          text: "Hot Holding",
                          txtSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotHoldingHistory(),
                              ),
                            );
                          },
                          child: SvgPicture.asset('assets/icons/history.svg'),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            GridView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 0.76, // Adjust as needed
              ),
              itemCount: hotHoldingCardList.length,
              itemBuilder: (context, index) {
                final card = hotHoldingCardList[index];
                return commonCardForSubFragmentPage(
                  fragmentCommCard(
                    imagePath: card.imagePath,
                    titalText: card.titalText,
                    subText: card.subText,
                    temp: card.temp,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Hotholding_detail(
                            tital: card.titalText,
                            description: card.subText,
                            imagePath: card.imagePath,
                            temperature: card.temp,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHotHolding()),
          );
          if (result != null && result is fragmentCommCard) {
            setState(() {
              hotHoldingCardList.add(result);
            });
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SvgPicture.asset('assets/icons/add_button.svg'),
      ),
    );
  }
}

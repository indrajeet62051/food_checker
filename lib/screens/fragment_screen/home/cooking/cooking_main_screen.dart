import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/fragment_screen/home/cooking/cooking_details.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../../utils/navigator.dart';
import '../../../widget/text.dart';
import 'add cooking/add_cooking.dart';

class CookingMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => cookingScreen();
}

class cookingScreen extends State<CookingMainScreen> {
  // Dynamic list for cooking cards
  List<fragmentCommCard> _cookingCards = [];

  @override
  void initState() {
    super.initState();
    // Insert initial cards for testing
    _cookingCards.addAll([
      fragmentCommCard(
        imagePath: 'assets/images/bydefault_user.jpg',
        titalText: 'delam',
        subText: 'nn',
        temp: '12',
      ),
      fragmentCommCard(
        imagePath: 'assets/images/byDefaultFemaleUser.jpg',
        titalText: 'delam',
        subText:
        'Cook spaghetti in boiling water (100°C). In a pan, cook pancetta until crispy (medium heat, 160°C). Mix eggs, parmesan, and black pepper, then combine with hot pasta off the heat. Stir quickly to create a creamy sauce. Serve with extra cheese.',
        temp: '20',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
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
                          padding: const EdgeInsets.only(right: 120),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        commonText(
                          text: "Cooking",
                          txtSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/icons/history.svg'),
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
              itemCount: _cookingCards.length,
              itemBuilder: (context, index) {
                final card = _cookingCards[index];
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
                              (context) => CookingDetails(
                            title: card.titalText,
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
            MaterialPageRoute(builder: (context) => AddCooking()),
          );
          if (result != null && result is fragmentCommCard) {
            setState(() {
              _cookingCards.add(result);
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

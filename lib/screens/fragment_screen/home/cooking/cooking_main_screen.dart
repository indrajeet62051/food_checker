import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../../utils/navigator.dart';
import '../../../widget/text.dart';

class CookingMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => cookingScreen();

}

class cookingScreen extends State<CookingMainScreen>{
  get profileItems => null;



  @override
  Widget build(BuildContext context) {


    List<Map<String, String>> data = [
      {
        "title": "delam",
        "description": "nn",
        "image": "assets/images/bydefault_user.jpg",
        "temp": "12"
      },
      {
        "title": "delam",
        "description": "ned jnr",
        "image": "assets/images/bydefault_user.jpg",
        "temp": "20"
      },
    ];

    List<fragmentCommCard> fragcard = [
      fragmentCommCard(imagePath: 'assets/images/bydefault_user.jpg',
        titalText: "delam", subText: "nn", temp: "12",onTap: () {
          Navigate_helper.NavigateToCookingDetails(context);
        },),
      fragmentCommCard(imagePath: 'assets/images/bydefault_user.jpg',
          titalText: "delam", subText: "ned jnr", temp: "12",onTap: () {
            Navigate_helper.NavigateToCookingDetails(context);
          }),
    ];

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
                      padding: const EdgeInsets.only(right: 120),
                      child: GestureDetector(onTap: (){Navigator.pop(context );},
                          child: Icon(Icons.arrow_back)),
                    ),
                     commonText(text: "Cooking", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                    Spacer(),
                    SvgPicture.asset('assets/icons/history.svg', ),

                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),




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
            itemCount: fragcard.length,
            itemBuilder: (context, index) {
              final itemData = data[index];
              return commonCardForSubFragmentPage(
                fragmentCommCard(
                  titalText: itemData["title"]!,
                  subText: itemData["description"]!,
                  imagePath: itemData["image"]!,
                  temp: itemData["temp"]!,
                  onTap: Navigate_helper.navigationCallback(
                    context,
                    'cooking',
                  ),
                ),
              );
            },
          ),





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



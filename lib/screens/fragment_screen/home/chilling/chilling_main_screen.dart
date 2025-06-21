import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/fragment_screen/home/chilling/chilling_detail.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../../utils/navigator.dart';
import '../../../widget/text.dart';
import '../cooking/cooking_history.dart';
import 'chilling_history.dart';

class ChillingMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => chillingMainScreen();

}

class chillingMainScreen extends State<ChillingMainScreen>{
  get profileItems => null;



  @override
  Widget build(BuildContext context) {
    
    List<fragmentCommCard> chillingCardList =[
      fragmentCommCard(imagePath: "assets/images/bydefault_user.jpg", titalText: "delam", subText: "nm", temp: "25")
    ]   ;  
    
    
    // List<Map<String, String>> data = [
    //   {
    //     "title": "delam",
    //     "description": "nn",
    //     "image": "assets/images/bydefault_user.jpg",
    //     "temp": "12"
    //   },
    //   {
    //     "title": "delam",
    //     "description": "ned jnr",
    //     "image": "assets/images/bydefault_user.jpg",
    //     "temp": "12"
    //   },
    // ];

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
                  commonText(text: "Chilling", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                  Spacer(),
                  GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChillingHistory()));
                  },
                      child: SvgPicture.asset('assets/icons/history.svg', )),

                ]),
                SizedBox(height: 15),
              ],
            ),
          ),),




        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.76,
          ),
          itemCount: chillingCardList.length,
          itemBuilder: (context, index) {
            final card = chillingCardList[index];
            return commonCardForSubFragmentPage(
              fragmentCommCard(
                titalText: card.titalText,
                subText: card.subText,
                imagePath: card.imagePath,
                temp: card.temp,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChillingDetails(
                    title: card.titalText,
                    description: card.subText,
                    imagePath: card.imagePath,
                    temperature: card.temp,

                  )));
                },
                // onTap: Navigate_helper.navigationCallback(
                //   context,
                //   'chilling',
                // ),
              ),
            );
          },
        )






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



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/fragment_screen/home/cooking/cooking_main_screen.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';
import 'cleaning_details.dart';
import 'cleaning_history.dart';

class CleaningScheduleMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => cleaningScheduleMainScreen();

}

class cleaningScheduleMainScreen extends State<CleaningScheduleMainScreen>{




  @override

  List<cleaningCard> cleaningCardList = [cleaningCard(imagePath: 'assets/images/dish.png', allocation: "Floor",
      shedule: "Daily", area: "customer Area"),
    cleaningCard(imagePath: Assets.imagesWomanFridge, allocation: "Kitchen", shedule: "Monthaly", area: "back kitchen")

  ];


  Widget build(BuildContext context) {
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
                    commonText(text: "Cleaning", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                    Spacer(),
                    GestureDetector(onTap: () {
                      
                    },
                        child: GestureDetector(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CleaningHistory()));
                        },
                            child: SvgPicture.asset('assets/icons/history.svg', ))),

                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),




         GridView.builder(shrinkWrap: true,
             padding: EdgeInsets.all(20),
             physics: NeverScrollableScrollPhysics(),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.75,crossAxisSpacing: 5 ,mainAxisSpacing: 5),
            itemCount: cleaningCardList.length,
             itemBuilder: (context,index){
           final card = cleaningCardList[index];
           return  commonCardCleaningMain(cleaningCard(imagePath: card.imagePath,allocation: card.allocation,area: card.area,shedule: card.shedule
               ,navigator: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>CleaningDetails(title: card.allocation,imagePath: card.imagePath , Requirment: card.shedule  , Location: card.area)));
               },));


             }





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

class cleaningCard{


  final String imagePath;
  final String allocation;
  final String shedule;
  final String area;
  final VoidCallback ? navigator;

  cleaningCard({

    required this.imagePath,
    required this.allocation,
    required this.shedule,
    required this.area,
    this.navigator,

});
}

Widget commonCardCleaningMain(cleaningCard item){

  return   GestureDetector(
    onTap: item.navigator,
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
                text: item.allocation,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Row(
                children: [
                  commonText(
                    text: "Requirement : ",
                    txtSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  commonText(
                    text: item.shedule,
                    txtSize: 11,
                    color: green,
                    fontWeight: FontWeight.w600,
                  ),


                ]),
            Row(
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                commonText(
                  text: " Location: ",
                  txtSize: 11,
                  color: liteDarkgrey,
                ),
                commonText(
                  text: item.area,
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
  )
    ;

}



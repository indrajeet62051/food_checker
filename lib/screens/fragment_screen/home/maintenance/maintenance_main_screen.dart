import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';
import 'maintenance_history.dart';

class MaintenanceMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => maintenanceMainScreen();

}

class maintenanceMainScreen extends State<MaintenanceMainScreen>{




  @override
  Widget build(BuildContext context) {

    List<MaintenanceCard> maintenanceItem =[
      MaintenanceCard(mainTitle: "Water Filter Replacement", date: "05-Apr-2025", time: "06:32 Pm", requirementDuration: "daily", status: "panding",),
      MaintenanceCard(mainTitle: "Exhaust Fan Cleaning", date: "04-Apr-2025", time: "06:30 AM", requirementDuration: "Weekly", status: "Pending",imagePath: Assets.imagesByDefaultFemaleUser,userName: "Nikhil"),
      MaintenanceCard(mainTitle: "Water Filter Replacement", date: "05-Apr-2025", time: "06:30 AM - 07:00 AM", requirementDuration: "Monthly", status: "Completed",userName: "Nikhi",imagePath:'assets/images/userAvtar.jpg',description: "Ensure toilets are thoroughly cleaned and sanitized tomaintain hygiene and prevent the spread of germs. This includes scrubbing toilet bowls, cleaning seats,wiping down flush handles.")
    ];


    return Scaffold(
      body: Column(children: [
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
                    padding: const EdgeInsets.only(right: 0),
                    child: GestureDetector(onTap: (){Navigator.pop(context );},
                        child: Icon(Icons.arrow_back)),
                  ),
                  Spacer(),
                  commonText(text: "Maintenance", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                  Spacer(),
                  GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MaintenanceHistory()));
                  },
                      child: SvgPicture.asset('assets/icons/history.svg', )),

                ]),
                SizedBox(height: 15),
              ],
            ),
          ),), //app bar
        Expanded(
          child: ListView.builder(
            itemCount: maintenanceItem.length,
            padding: const EdgeInsets.symmetric(vertical: 24),
            itemBuilder: (context,index){
            return commonMaintenance(maintenanceItem[index]);

          },),
        )
        
      ],),
      floatingActionButton: FloatingActionButton(onPressed: (){
      },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: SvgPicture.asset('assets/icons/add_button.svg')),
    );
  }


}

class MaintenanceCard {
  final String mainTitle;
  final String date;
  final String time;
  final String requirementDuration;
  final String status;
  final String? imagePath;
  final String? userName;
  final String? description;

  MaintenanceCard({
    required this.mainTitle,
    required this.date,
    required this.time,
    required this.requirementDuration,
    required this.status,
    this.imagePath,
    this.userName,
    this.description,

  });
}

Widget commonMaintenance(
    MaintenanceCard item
    ){
  return Padding(
    padding: const EdgeInsets.only(right: 15,left: 15),
    child: Container(width: ScreenWight*0.93,margin:EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: whiteColor,
            boxShadow:[BoxShadow(color: graycol.withOpacity(0.3),blurRadius: 2,offset: Offset(0, 1))],
            borderRadius:BorderRadius.circular(12)

        ),
        child: Column(
          children: [
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                color: green
            ),
              child: Padding(
                padding: const EdgeInsets.only(right: 16,left: 16,top: 11,bottom: 11),
                child: Row(children: [
                  commonText(text: item.mainTitle, txtSize: 16,fontWeight: FontWeight.w600,color: whiteColor),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(onTap: () => {},
                        child: SvgPicture.asset(Assets.iconsEditMaintanance,)),
                  ),
                  GestureDetector(onTap: () {},
                      child: SvgPicture.asset(Assets.iconsDeleteMaintanace))
                ],),
              ),) , //title tab for maintenance
            Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: litegray,width: 2))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children:[ Row(children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(text: "Date", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                        Row(children: [
                          SvgPicture.asset(Assets.iconsCalendar),
                          Text(" "),
                          commonText(text: item.date, txtSize: 14,fontWeight: FontWeight.w600)

                        ],),
                        SizedBox(height: 20,),
                        commonText(text: "Time", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                        Row(children: [
                          SvgPicture.asset(Assets.iconsClock),
                          Text(" "),
                          commonText(text: item.date, txtSize: 14,fontWeight: FontWeight.w600)
                        ],),
                      ],), // left side date time and inspection
                      SizedBox(width: ScreenWight*0.1511,),


                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(text: "Requirement", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                          Row(children: [
                            SvgPicture.asset(Assets.iconsArrowSync),
                            Text(" "),
                            commonText(text: item.requirementDuration, txtSize: 14,fontWeight: FontWeight.w600)

                          ],),

                          SizedBox(height: 20,),
                          commonText(text: "Status", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                          Row(children: [
                            commonText(text: item.status, txtSize: 14,fontWeight: FontWeight.w600,color: redColor)
                          ],),
                        ],), //Right side Requirement and Status


                    ],),

                      Padding(
                        padding: const EdgeInsets.only(top: 16,bottom: 6),
                        child: commonText(text: "Inspected By", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                      ),
                      Row(
                          children:[ Row(
                              children:[ Container(
                                decoration: BoxDecoration(color: Colors.black.withOpacity(0.03),
                                    borderRadius: BorderRadius.circular(50),border:Border.all( color: Colors.black.withOpacity(0.1))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10,left: 5,top: 5,bottom: 5),
                                  child: Row(children: [
                                    Container(height: 35,width: 35,
                                      decoration: BoxDecoration(shape: BoxShape.circle),
                                      child: ClipOval(child: Image.asset(item.imagePath ?? Assets.imagesBydefaultUser,fit: BoxFit.cover,)),
                                      margin:EdgeInsets.only(right: 5),

                                    ),
                                    commonText(text: item.userName ??"User Name", txtSize: 14,color: black)
                                  ],),
                                ),
                              ),

                              ]),Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: GestureDetector(
                                onTap: () {},
                                child: Column(children:[ commonText(text: "View", txtSize: 16,color: green,fontWeight: FontWeight.w700),
                                  Container(height: 2,color: green,width: 40,)
                                ]),
                              ),
                            ),
                          ]) //user Avtar
                    ]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 24),
              child: Container(width: ScreenWight*0.8372,
                child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    commonText(text: "Description", txtSize: 14,fontWeight: FontWeight.w600,color: black),
                    commonText(text: item.description ??"Havent Entered any Description", txtSize: 14,fontWeight: FontWeight.w600)


                  ],),
              ),
            )


          ],)
    ),
  );
}



























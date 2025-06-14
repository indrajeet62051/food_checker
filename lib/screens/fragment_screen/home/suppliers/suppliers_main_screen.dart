import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/text.dart';

class SuppliersMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => suppliersMainScreen();

}

class suppliersMainScreen extends State<SuppliersMainScreen>{
  get profileItems => null;



  @override
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
                    commonText(text: "Suppliers", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
                    Spacer(),
                    SvgPicture.asset('assets/icons/history.svg', ),

                  ]),
                  SizedBox(height: 15),
                ],
              ),
            ),),




          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.76, // You can tweak this value
            children: <Widget>[
              Card(
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
                            image: AssetImage('assets/images/dish.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 0),
                        child: commonText(
                          text: "Dish Name",
                          txtSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      commonText(
                        text: "Cook spaghetti in b... ",
                        txtSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          commonText(
                            text: "Temp.: ",
                            txtSize: 11,
                            color: liteDarkgrey,
                          ),
                          commonText(
                            text: "19",
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
              commonCardForSubFragmentPage(imagePath: 'assets/images/bydefault_user.jpg',
                  titalText: "delam", subText: "nn", temp: "12"),
              commonCardForSubFragmentPage(imagePath: 'assets/images/bydefault_user.jpg',
                  titalText: "delam", subText: "ned jnr", temp: "12"),
            ],
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



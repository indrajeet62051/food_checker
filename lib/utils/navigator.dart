// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:food_checker/screens/fragment_screen/home/chilling/chilling_detail.dart';
// import 'package:food_checker/screens/fragment_screen/home/hot_holding/hotholding_details.dart';
// import 'package:food_checker/screens/fragment_screen/home/suppliers/supplier_details.dart';
//
// import '../screens/fragment_screen/home/cooking/cooking_details.dart';
// import '../screens/fragment_screen/home/hot_holding/hot_holding_mainScreen.dart';
//
// class Navigate_helper{
//
//   static void NavigateToCookingDetails(
//   BuildContext context,){
// Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context)=>cookin_details())
// );
//   }
//
//   static void NavigateToHotHoldingDetails(
//       BuildContext context,){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>hotholding_detail())
//     );
//   }
//
//   static void NavigateToChilling(
//       BuildContext context){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>chilling_detail()));
//   }
//
//
//   static VoidCallback navigationCallback(
//     BuildContext  context,
//       String ScreeType
//
// ){
//     return(){
//       switch(ScreeType){
//
//         case'chilling':
//           NavigateToChilling(context);
//
//           break;
//         case'hotholding':
//           NavigateToHotHoldingDetails(context);
//           break;
//         case'cooking' :
//           NavigateToCookingDetails(context);
//           break;
//         default:
//           print('Unknown screen type: $ScreeType');
//
//       }
//     };
//
//
//   }
//
//
//
//
//
// }
//

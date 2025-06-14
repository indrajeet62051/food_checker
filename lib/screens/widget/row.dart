import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_checker/screens/widget/text.dart';

import '../../core/Constrants/color.dart';
import '../fragment_screen/profile/profile_screen2.dart';
import 'card.dart';

// Widget commonRowForProfile({
//   required String imagePath,
//   required String rowText,
//
// }){
//   return  Container(
//     decoration: BoxDecoration(
//       color: whiteColor,
//
//
//     ),
//     child: Padding(
//       padding: const EdgeInsets.only(top:24,bottom: 2,left: 20),
//       child: SizedBox(height: 28,width: ScreenWight*0.813,
//         child: Row(children: [
//           SvgPicture.asset(imagePath),
//           Padding(
//             padding: const EdgeInsets.only(left: 16),
//             child: commonText(text: rowText, txtSize: 14,color: black),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: SvgPicture.asset('assets/icons/rightarrow_black.svg'),
//           )
//
//         ],),
//       ),
//     ),
//   );
//
// }


Widget commonRowForProfile(ProfileItem item) {
  return GestureDetector(
    onTap: item.onTap,
    child: Container(
      decoration: BoxDecoration(color: whiteColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 2, left: 20),
        child: SizedBox(
          height: 28,
          width: ScreenWight * 0.813,
          child: Row(
            children: [
              SvgPicture.asset(item.imagePath),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: commonText(text: item.rowText, txtSize: 14, color: black),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset('assets/icons/rightarrow_black.svg'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

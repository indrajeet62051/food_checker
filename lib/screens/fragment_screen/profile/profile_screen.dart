// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:food_checker/core/Constrants/color.dart';
// import 'package:food_checker/screens/widget/text.dart';
// import 'package:food_checker/screens/widget/row.dart';
//
// class ProfileScreen2 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => Profile_screen();
// }
//
// class Profile_screen extends State<ProfileScreen2> {
//   bool isSwitch = true;
//
//   List<ProfileItem> profileItems = [
//     ProfileItem(imagePath: 'assets/icons/Edit_pencil.svg', rowText: 'Edit Profile'),
//     ProfileItem(imagePath: 'assets/icons/changePassword.svg', rowText: 'Change Password'),
//     ProfileItem(imagePath: 'assets/icons/language.svg', rowText: 'Language'),
//     ProfileItem(imagePath: 'assets/icons/Subscription.svg', rowText: 'Subscription'),
//     ProfileItem(imagePath: 'assets/icons/Export.svg', rowText: 'Export'),
//     ProfileItem(imagePath: 'assets/icons/delete_profile.svg', rowText: 'Delete Account'),
//     ProfileItem(imagePath: 'assets/icons/SignOut.svg', rowText: 'Log Out'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final double ScreenWight = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(children: [
//             Container(
//               height: 90, width: ScreenWight,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [ BoxShadow(
//                   color: graycol.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 4),
//                 )
//                 ],),
//               child: Center(
//                 child: Column(mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     commonText(text: "Staff", txtSize: 20, color: black, fontWeight: FontWeight.w600,),
//                     SizedBox(height: 15),
//                   ],),
//               ),),
//             Padding(
//               padding: const EdgeInsets.only(top: 38, bottom: 16),
//               child: Stack(children: [
//                 Container(
//                   width: 120, height: 120,
//                   decoration: BoxDecoration(color: green, shape: BoxShape.circle),
//                   child: Center(child: CircleAvatar(radius: 56,
//                     backgroundImage: AssetImage('assets/images/bydefault_user.jpg'),
//                   ),
//                   ),),
//                 Positioned(
//                   bottom: 0, right: 0,
//                   child: Container(
//                     width: 38, height: 38,
//                     decoration: BoxDecoration(color: green, shape: BoxShape.circle),
//                     child: Icon(Icons.camera_alt, color: whiteColor),
//                   ),
//                 ),
//               ],
//               ),
//             ),
//             commonText(
//               text: "Brew & Bite",
//               txtSize: 20,
//               fontWeight: FontWeight.w700,
//               color: black,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 0,
//                   child: Column(
//                     children: profileItems.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       ProfileItem item = entry.value;
//
//                       List<Widget> widgets = [commonRowForProfile(item)];
//                       if (index == 1) {
//                         widgets.add(
//                           Padding(
//                             padding: const EdgeInsets.only(top: 24, bottom: 2, ),
//                             child: SizedBox(
//                               height: 28,
//                               width: ScreenWight * 0.813,
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset('assets/icons/notification_profile.svg'),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 16),
//                                     child: commonText(text: "Notification Setting", txtSize: 14, color: black),
//                                   ),
//                                   Expanded(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Switch(
//                                           value: isSwitch,
//                                           onChanged: (value) {
//
//                                           },
//                                           activeColor: Colors.white,
//                                           activeTrackColor: Colors.green,
//                                           inactiveThumbColor: Colors.white,
//                                           inactiveTrackColor: Colors.grey,
//                                         )
//                                       ],),
//                                   )
//                                 ],),
//                             ),),);
//                       }
//                       return Column(children: widgets);
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Model
// class ProfileItem {
//   final String imagePath;
//   final String rowText;
//   final VoidCallback? onTap;
//
//   ProfileItem({
//     required this.imagePath,
//     required this.rowText,
//     this.onTap,
//   });
// }

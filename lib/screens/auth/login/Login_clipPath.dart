// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
//
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Avoid default padding
//       body: Stack(
//         children: [
//           // Top semi-circle background
//           ClipPath(
//             clipper: TopSemiCircleClipper(),
//             child: Container(
//               height: 300, // Adjust as needed
//               width: double.infinity,
//               color: Colors.lightGreen,
//             ),
//           ),
//
//           // Logo + Text inside the curve
//           Positioned(
//             top: 100, // Adjust to control vertical placement
//             left: 0,
//             right: 0,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // 🟢 Your logo here
//                 Icon(Icons.explore, size: 60, color: Colors.white),
//
//                 SizedBox(height: 16),
//
//                 // 🟢 Your text
//                 Text(
//                   "Log in now to continue exploring",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class TopSemiCircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//
//     // Circle rect that starts above the visible screen
//     final rect = Rect.fromLTWH(0, -size.height, size.width, size.height * 2);
//
//     // Draw top semi-circle (180° arc)
//     path.addArc(rect, 0, math.pi);
//
//     // Close to top-left
//     path.lineTo(0, 0);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

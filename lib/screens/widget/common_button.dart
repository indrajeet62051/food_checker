// import 'package:flutter/material.dart';
//
// Widget commonButton({
//   BuildContext? context,
//   required String text,
//   double txtSize = 16.0,
//   Color buttonColor = Colors.green,
//   Color textColor = Colors.white,
//   Color borderColor = Colors.transparent,
//   double borderWidth = 0.0,
//   Widget? navigateTo,
//   // New parameter for custom shape
//   OutlinedBorder? buttonShape, // Use OutlinedBorder for common shapes
// }) {
//   return ElevatedButton(
//     onPressed: () {
//       if (navigateTo != null) {
//         Navigator.push(
//           context!,
//           MaterialPageRoute(builder: (context) => navigateTo),
//         );
//       }
//     },
//     style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all(buttonColor),
//       shape: WidgetStateProperty.all<OutlinedBorder>(
//         buttonShape ?? // Use the provided shape, or default to RoundedRectangleBorder
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               side: BorderSide(color: borderColor, width: borderWidth),
//             ),
//       ),
//     ),
//     child: Text(
//       text,
//       style: TextStyle(
//         fontFamily: 'PlusJakartaSans',
//         fontSize: txtSize,
//         fontWeight: FontWeight.w700,
//         color: textColor,
//       ),
//     ),
//   );
// }


import 'package:flutter/material.dart';


// Your commonButton function definition (as provided in your prompt)
Widget commonButton({
  BuildContext? context,
  required String text,
  double txtSize = 16.0,
  Color buttonColor = Colors.green,
  Color textColor = Colors.white,
  Color borderColor = Colors.transparent,
  double borderWidth = 0.0,
  Widget? navigateTo,
  OutlinedBorder? buttonShape,
  double? elevation,
}) {
  return ElevatedButton(
    onPressed: () {
      if (navigateTo != null) {
        Navigator.push(
          context!,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      }
    },
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(buttonColor),
      elevation: WidgetStateProperty.all(elevation),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        buttonShape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: borderColor, width: borderWidth),
            ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: txtSize,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
    ),
  );
}


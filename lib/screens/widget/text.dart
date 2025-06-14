import 'package:flutter/cupertino.dart';

import '../../core/Constrants/color.dart';

Widget commonText({
  required String text,
  required double txtSize,
  String? fontFamily,
  Color? color,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: txtSize,
      fontFamily: fontFamily ?? 'PlusJakartaSans',
      color: color ?? graycol,
      fontWeight: fontWeight ?? FontWeight.w500,
    ),
  );
}

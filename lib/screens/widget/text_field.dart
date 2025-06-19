import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/Constrants/color.dart';

Widget commonTextField({
required String hintText,
   String? Svg_Path,
  TextEditingController ? controller,
}){
  return TextField(

    controller: controller,

    decoration: InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: graycol,fontWeight: FontWeight.w600,fontSize: 16),
    prefixIcon: Svg_Path != null
        ? Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 18,right: 0),
      child: SvgPicture.asset(
        Svg_Path,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    )
        : null,

    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: graycol,
        )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.green, // border when focused
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),


  );
}




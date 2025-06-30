import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/Constrants/color.dart';

Widget commonTextField({
  String ? hintText,
  String? Svg_Path,
  TextEditingController? controller,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
   bool ? readOnly,
  bool ? autofocus,
  bool ? obsecure,

}) {
  return TextField(
    obscureText: obsecure ?? false,
    autofocus: autofocus ?? false,

    readOnly: readOnly ?? false,
    // initialValue: InitialValue,
    controller: controller,
    keyboardType: keyboardType,
    // validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: graycol, fontWeight: FontWeight.w600, fontSize: 16),
      prefixIcon: Svg_Path != null
          ? Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 18),
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
        borderSide: BorderSide(color: graycol.withOpacity(0.3),width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.green, width: 2.0),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}





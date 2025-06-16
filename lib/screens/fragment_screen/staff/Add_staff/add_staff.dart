import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../core/Constrants/color.dart';
import '../../../widget/card.dart';
import '../../../widget/text.dart';
import 'add_staff_controller.dart';
import '../staff_screen.dart';

class AddStaff extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => add_staff();
}

class add_staff extends State<AddStaff> {
  late final add_staff_controller _controller;
  bool isCheck = false, isCheck2 = false, isCheck3 = false;

  @override
  void initState() {
    super.initState();
    _controller = add_staff_controller();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (BuildContext context) => SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await _controller.pickImage(ImageSource.gallery);
                setState(() {});
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                await _controller.pickImage(ImageSource.camera);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addStaff() {
    if (_controller.isValid) {
      // Get the selected branch name
      String selectedBranch = "";
      if (isCheck) selectedBranch = "Uttran";
      if (isCheck2) selectedBranch = "Vesu";
      if (isCheck3) selectedBranch = "Adajan";

      final newStaff = StaffItem(
        staffName:
        "${_controller.first_name.text} ${_controller.last_Name.text}",
        designation: _controller.role.text,
        allocation: _controller.department.text,
        kitchen_Location: selectedBranch,
        image_path:
        _controller.uploadedImage != null
            ? _controller.uploadedImage!.path
            : Assets.imagesBydefaultUser,
      );

      Navigator.pop(context, newStaff);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select a branch')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: ScreenWight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: graycol.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 115),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        commonText(
                          text: "Add Staff",
                          txtSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(text: "Image", txtSize: 14),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: _pickImage,
                    child: DottedBorder(
                      color: green,
                      strokeWidth: 1.5,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      dashPattern: [8, 4],
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:
                        _controller.uploadedImage == null
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: green,
                              size: 30,
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Add Image",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _controller.uploadedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: ScreenWight * 0.637,
                    child: Row(
                      children: [
                        commonText(text: "First Name", txtSize: 14),
                        Spacer(),
                        commonText(text: "Last Name", txtSize: 14),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenWight * 0.420,
                        height: 55,
                        child: TextField(
                          controller: _controller.first_name,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: green, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: ScreenWight * 0.420,
                        height: 55,
                        child: TextField(
                          controller: _controller.last_Name,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: green, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  commonText(text: "Email", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextField(
                      controller: _controller.email,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: green, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  commonText(text: "Role", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextField(
                      controller: _controller.role,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: green, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  commonText(text: "Department", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextField(
                      controller: _controller.department,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: green, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  commonText(text: "Select Branch", txtSize: 14),
                  SizedBox(
                    width: ScreenWight * 0.906,
                    child: Card(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 13,
                          bottom: 13,
                          right: 18,
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsLocation),
                                    commonText(
                                      text: " Uttran",
                                      txtSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: commonText(
                                    text:
                                    "2464 Royal Ln. Mesa, New Jersey 45463",
                                    txtSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCheck = !isCheck;
                                  _controller.toggleBranch(0);
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCheck ? green : Colors.transparent,
                                  border: Border.all(color: green, width: 2),
                                ),
                                child:
                                isCheck
                                    ? Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenWight * 0.906,
                    child: Card(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 13,
                          bottom: 13,
                          right: 18,
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsLocation),
                                    commonText(
                                      text: " Vesu",
                                      txtSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: commonText(
                                    text:
                                    "2464 Royal Ln. Mesa, New Jersey 45463",
                                    txtSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCheck2 = !isCheck2;
                                  _controller.toggleBranch(1);
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCheck2 ? green : Colors.transparent,
                                  border: Border.all(color: green, width: 2),
                                ),
                                child:
                                isCheck2
                                    ? Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenWight * 0.906,
                    child: Card(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 13,
                          bottom: 13,
                          right: 18,
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsLocation),
                                    commonText(
                                      text: " Adajan",
                                      txtSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: black,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: commonText(
                                    text:
                                    "2464 Royal Ln. Mesa, New Jersey 45463",
                                    txtSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCheck3 = !isCheck3;
                                  _controller.toggleBranch(2);
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCheck3 ? green : Colors.transparent,
                                  border: Border.all(color: green, width: 2),
                                ),
                                child:
                                isCheck3
                                    ? Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 40),
                    child: SizedBox(
                      width: ScreenWight * 0.936,
                      height: 60,
                      child: commonButton(text: "Add Staff",onPress: _addStaff),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

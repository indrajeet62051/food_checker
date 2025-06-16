import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'dart:io';

import 'Add_staff/add_staff.dart';

class StaffScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Staff_Screen();
}

class Staff_Screen extends State<StaffScreen> {
  List<StaffItem> staffItems = [
    StaffItem(
      staffName: "Nikhil",
      designation: "Flutter Developer",
      allocation: "Desk",
      kitchen_Location: "Uttran",
      image_path: Assets.imagesBydefaultUser,
    ),
    StaffItem(
      staffName: "Indrajeet",
      designation: "Animater",
      allocation: "Desk",
      kitchen_Location: "Adajan",
      image_path: Assets.imagesByDefaultFemaleUser,
    ),
  ];

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        shadowColor: litegray,
        backgroundColor: whiteColor,
        title: Center(
          child: commonText(
            text: "Staff",
            txtSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: staffItems.length,
        padding: EdgeInsets.symmetric(vertical: 24),
        itemBuilder: (context, index) {
          return _buildStaffCard(staffItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStaff()),
          );

          if (result != null && result is StaffItem) {
            setState(() {
              staffItems.add(result);
            });
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SvgPicture.asset('assets/icons/add_button.svg'),
      ),
    );
  }

  Widget _buildStaffCard(StaffItem item) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.906,
        height: 102,
        child: Card(
          margin: EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              _buildStaffImage(item),
              _buildStaffDetails(item),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaffImage(StaffItem item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircleAvatar(
          backgroundColor: green,
          child: SizedBox(
            height: 67,
            width: 67,
            child: ClipOval(
              child:
              item.image_path.startsWith('assets/')
                  ? Image.asset(item.image_path, fit: BoxFit.cover)
                  : Image.file(File(item.image_path), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStaffDetails(StaffItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Row(
            children: [
              commonText(
                text: item.staffName,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: black,
              ),
              commonText(
                text: " (",
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
              commonText(
                text: item.designation,
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
              commonText(
                text: ") ",
                txtSize: 14,
                fontWeight: FontWeight.w600,
                color: green,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: commonText(text: item.allocation, txtSize: 12),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/location.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: commonText(
                text: item.kitchen_Location,
                txtSize: 12,
                color: black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset('assets/icons/Edit.svg'),
            ),
            SvgPicture.asset('assets/icons/delete.svg'),
          ],
        ),
      ),
    );
  }
}

class StaffItem {
  final String staffName;
  final String designation;
  final String allocation;
  final String kitchen_Location;
  final String image_path;

  StaffItem({
    required this.staffName,
    required this.designation,
    required this.allocation,
    required this.kitchen_Location,
    required this.image_path,
  });
}

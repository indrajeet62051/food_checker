import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/text.dart';

import '../../widget/card.dart';
import 'Add_staff/add_staff.dart';
import 'staff_details.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
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
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemBuilder: (context, index) {
          return CommonStaffCard(
            item: staffItems[index],
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StaffDetailsScreen(

                  ),
                ),
              );
            },
            onEditTap: () {
              // Handle edit action
            },
            onDeleteTap: () {
              // Handle delete action
            },
          );
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
}

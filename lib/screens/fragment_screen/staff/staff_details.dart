import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:food_checker/screens/widget/card.dart';

class StaffDetailsScreen extends StatelessWidget {
  final StaffItem staff;
  const StaffDetailsScreen({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: commonText(
          text: 'Staff Detail',
          fontWeight: FontWeight.w600,
          txtSize: 20,
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21.33),
            child: SvgPicture.asset(Assets.iconsActivityLog, height: 26, width: 26),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.asset(staff.image_path, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: staff.staffName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: black,
                                  ),
                                ),
                                TextSpan(
                                  text: " (${staff.designation})",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          commonText(
                            text: staff.allocation,
                            color: Colors.grey,
                            txtSize: 16,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(Assets.iconsEdit, height: 40, width: 40),
                      const SizedBox(width: 25),
                      SvgPicture.asset(
                        Assets.iconsDelete,
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  commonText(
                    text: 'Location',
                    fontWeight: FontWeight.w500,
                    txtSize: 14,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: black.withOpacity(0.06)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: green),
                        SizedBox(width: 8),
                        commonText(
                          text: staff.kitchen_Location,
                          fontWeight: FontWeight.w600,
                          txtSize: 16,
                          color: black,
                        ),
                      ],
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

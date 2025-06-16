import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/text.dart';

import '../../../widget/common_button.dart';

void Export2(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      // Controllers for date fields
      TextEditingController _startDateController = TextEditingController();
      TextEditingController _endDateController = TextEditingController();

      return StatefulBuilder(
        builder: (context, setModalState) {
          Future<void> _selectDate(TextEditingController controller) async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              setModalState(() {
                controller.text =
                    "${picked.day}/${picked.month}/${picked.year}";
              });
            }
          }

          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0.3,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        commonText(
                          text: "Export Data",
                          txtSize: 18,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Export Data"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 20),
                          child: SizedBox(
                            height: 60,
                            width: ScreenWight * 0.9069,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: graycol.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                ),
                                child: Row(
                                  children: [
                                    commonText(
                                      text: "Custom Data ",
                                      txtSize: 14,
                                      color: black,
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_downward),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            commonText(text: "Start Date", txtSize: 14),
                            SizedBox(width: ScreenWight * 0.304),
                            commonText(text: "End Date", txtSize: 14),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: ScreenWight * 0.420,
                              height: 60,
                              margin: EdgeInsets.only(top: 8, bottom: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: graycol.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: GestureDetector(
                                  onTap:
                                      () => _selectDate(
                                    _startDateController,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _startDateController,
                                          readOnly: true,

                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "__ select __",
                                            border: InputBorder.none,
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.calendar_month, color: green),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: ScreenWight * 0.420,
                              height: 60,
                              margin: EdgeInsets.only(top: 8, bottom: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: graycol.withOpacity(0.2),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: GestureDetector(
                                  onTap:
                                      () =>
                                      _selectDate(_endDateController),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _endDateController,
                                          readOnly: true,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "__ select __",
                                            border: InputBorder.none,
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.calendar_month, color: green),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: ScreenWight * 0.420,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: greenColor,
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: greenColor.withOpacity(0.1),
                                        ),
                                        child: Center(
                                          child: commonText(
                                            text: "Cancel",
                                            txtSize: 16,
                                            color: greenColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: ScreenWight * 0.023),
                                  SizedBox(
                                    height: 60,
                                    width: ScreenWight * 0.420,
                                    child: commonButton(
                                      text: "Export",
                                      onPress: () {
                                        Navigator.pop(context);
                                      },
                                      textColor: whiteColor,
                                      txtSize: 16,
                                      buttonShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ), //buttons
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
}

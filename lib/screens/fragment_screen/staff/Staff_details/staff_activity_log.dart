import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:intl/intl.dart';

import '../../../../core/Constrants/color.dart';
import '../../../../generated/assets.dart';
import '../../../widget/text.dart';

class ActivityLogData {
  final String title;
  final DateTime date;
  final String startTime;
  final String? endTime;

  ActivityLogData({
    required this.title,
    required this.date,
    required this.startTime,
    this.endTime,
  });
}

class ActivityLog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => activityLog();
}

class activityLog extends State<ActivityLog> {
  final List<ActivityLogData> _activityLogs = [
    ActivityLogData(
      title: "Oven Temperature Calibration",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
      endTime: "09:30 PM",
    ),
    ActivityLogData(
      title: "Refrigerator Temperature Monitor",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
    ),
    ActivityLogData(
      title: "Deep Cleaning - Coffee Machine",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
      endTime: "11:30 PM",
    ),
    ActivityLogData(
      title: "Kitchen Hood Cleaning",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
      endTime: "10:00 AM",
    ),
    ActivityLogData(
      title: "HVAC System Inspection",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
    ),
    ActivityLogData(
      title: "Guest Room Sanitation",
      date: DateTime(2025, 3, 25),
      startTime: "08:30 AM",
      endTime: "10:30 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: commonText(
          text: 'Activity Logs',
          fontWeight: FontWeight.w600,
          txtSize: 20,
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21.33),
            child: GestureDetector(
              onTap: () async {
                await FilterModalForStaffDetail(context: context);
              },
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset(Assets.iconsFilter),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: _activityLogs.length,
          itemBuilder: (context, index) {
            final log = _activityLogs[index];
            return ActivityLogItem(
              tital: log.title,
              date: log.date,
              startTime: log.startTime,
              endTime: log.endTime,
            );
          },
        ),
      ),
    );
  }
}

Widget ActivityLogItem({
  required String tital,
  required DateTime date,
  required String startTime,
  String? endTime,
}) {
  final isCompleted = endTime != null;
  final timeText = isCompleted ? '$startTime - ${endTime!}' : '$startTime - /';
  final statusText = isCompleted ? 'Completed' : 'Pending';
  final StatusContainerColor =
  isCompleted ? black.withOpacity(0.02) : redColor.withOpacity(0.06);
  final borderColor =
  isCompleted ? black.withOpacity(0.06) : redColor.withOpacity(0.15);
  final statusColor = isCompleted ? green : Colors.red;
  final statusBgColor =
  isCompleted ? green.withOpacity(0.15) : Colors.red.withOpacity(0.10);

  return Padding(
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: StatusContainerColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    text: tital,
                    txtSize: 14,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsCalanderIcon,
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(width: 10),
                        commonText(
                          text: DateFormat('dd-MMM-yyyy').format(date),
                          txtSize: 10,
                          fontWeight: FontWeight.w600,
                          color: graycol,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconsClock,
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(width: 10),
                      commonText(
                        text: timeText,
                        txtSize: 10,
                        fontWeight: FontWeight.w600,
                        color: graycol,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: commonText(
                  text: statusText,
                  txtSize: 10,
                  fontWeight: FontWeight.w700,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//Filter model

Future<void> FilterModalForStaffDetail({required BuildContext context}) async {
  DateTime? selectedDate;
  String? selectedFilterOption = 'Last 7 Days';
  final List<String> filterOptions = [
    'Last 7 Days',
    'Last Month',
    'Last 3 Month',
  ];

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.60,
        minChildSize: 0.59,
        maxChildSize: 0.60,
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setState) {
              Future<void> _pickDate() async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() => selectedDate = picked);
                }
              }

              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    // Header
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        // const SizedBox(width: 16),
                        Expanded(
                          child: Center(
                            child: commonText(
                              text: "Filter",
                              txtSize: 18,
                              fontWeight: FontWeight.w600,
                              color: black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Date picker
                    commonText(
                      text: "Date",
                      txtSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _pickDate, // This opens your date picker
                      child: Container(
                        height: 60,
                        width: ScreenHeight * 0.9606,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: graycol.withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDate == null
                                  ? '_ _ Select _ _'
                                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                selectedDate == null
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.iconsCalanderIcon,
                              height: 18,
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Filter By
                    commonText(
                      text: "Filter By",
                      txtSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 12),
                    ...filterOptions.map((option) {
                      return Container(
                        height: 60,
                        width: ScreenWight * 0.9606,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: graycol.withOpacity(0.2),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap:
                              () =>
                              setState(() => selectedFilterOption = option),
                          child: Row(
                            children: [
                              Expanded(
                                child: commonText(
                                  text: option,
                                  txtSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                ),
                              ),
                              Radio<String>(
                                activeColor: Colors.green,
                                value: option,
                                groupValue: selectedFilterOption,
                                onChanged: (value) {
                                  setState(() => selectedFilterOption = value);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 28),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                selectedDate = null;
                                selectedFilterOption = 'Last 7 Days';
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.green),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              'Clear',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // You can return or use the values here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}

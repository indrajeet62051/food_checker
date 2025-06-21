import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:intl/intl.dart';

import '../../../../core/Constrants/color.dart';

import 'package:flutter/material.dart';

import '../../widget/text.dart';

class Notification_screen extends StatefulWidget {
  @override
  State<Notification_screen> createState() => notification_screen();
}

class notification_screen extends State<Notification_screen> {
  final List<NotificationModel> notificationList = [
    NotificationModel(
      image: Assets.imagesByDefaultFemaleUser,
      title: 'Management resolved your report.',
      title_prefix: 'Report:',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo...',
      time: '1h',
      is_report: true,
    ),
    NotificationModel(
      image: 'assets/images/woman_fridge.jpg',
      title: 'A new task has been assigned to you.',
      description: '',
      time: '3h',
      is_report: false,
    ),
    NotificationModel(image: Assets.imagesBydefaultUser, title: "A new task has been assigned to you.", description: "", time: "4h", is_report: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          // Header/AppBar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: litegray,
                  blurRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: black),
                ),
                Spacer(),
                commonText(
                  text: 'Notification',
                  txtSize: 20,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: notificationList.length,
              separatorBuilder:
                  (context, index) =>
                  Divider(height: 20, color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final notification = notificationList[index];
                return commNotificationItem(notification);
              },
            ),
          ),
        ],
      ),
    );
  }

}

class NotificationModel {
  final String image;
  final String title;
  final String? title_prefix;
  final String description;
  final String time;
  final bool is_report;

  NotificationModel({
    required this.image,
    required this.title,
    this.title_prefix,
    required this.description,
    required this.time,
    required this.is_report,
  });
}



Widget commNotificationItem(NotificationModel notification) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(notification.is_report ? 50 : 10),
          child: Image.asset(
            notification.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          if (notification.is_report)
                            TextSpan(
                              text: '${notification.title_prefix} ',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          TextSpan(
                            text: notification.title,
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (notification.description.isNotEmpty) ...[
                    SizedBox(width: 8),
                    commonText(
                      text: notification.time,
                      txtSize: 14,
                      color: Colors.grey,
                    ),
                  ],
                ],),
              if (notification.description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: commonText(
                    text: notification.description,
                    txtSize: 12,
                    color: Colors.grey,
                  ),
                )
              else ...[
                SizedBox(height: 4),
                commonText(
                  text: notification.time,
                  txtSize: 14,
                  color: Colors.grey,
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

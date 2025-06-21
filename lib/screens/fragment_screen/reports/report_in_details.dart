import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/widget/card.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:food_checker/screens/widget/text_field.dart';

class ReportScreen_details extends StatefulWidget {
  final ReportCardModel data;

  const ReportScreen_details({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Report_Screen_details();
}

class Report_Screen_details extends State<ReportScreen_details> {
  @override
  Widget build(BuildContext context) {
    final ScreenWight = MediaQuery.of(context).size.width;
    final ScreenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                        Spacer(),
                        commonText(
                          text: "Report in Details",
                          txtSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                      commonText(text: "Report :  ", txtSize: 18, color: greenColor, fontWeight: FontWeight.w600,),
                      Expanded(
                        child: commonText(text: widget.data.reportTitle, txtSize: 18, fontWeight: FontWeight.w600, color: black,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    child: commonText(text: widget.data.reportDetail, txtSize: 14,),
                  ),
                  commonText(text: "Task", txtSize: 14),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                        left: 8,
                        right: 8,
                      ),
                      child: commonText(
                        text: widget.data.taskText,
                        txtSize: 14,
                        color: black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 430 * 0.501,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              left: 4,
                              right: 6,
                            ),
                            child: CircleAvatar(
                              child: Image.asset(widget.data.userAvatarPath),
                            ),
                          ),
                          Expanded(
                            child: commonText(
                              text: widget.data.reporterName,
                              txtSize: 14,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 1, color: black.withOpacity(0.1)),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.asset(
                                Assets.imagesByDefaultFemaleUser,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.64),
                        commonText(
                          text: "Brew & Bite",
                          txtSize: 14,
                          color: black,
                        ),
                        commonText(text: "  . 1d ago", txtSize: 14),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      child: commonText(
                        text:
                        "Investigation isInvestigation is in progress. A technician has been called to inspect and"
                            " resolve the issue.Investigation is in progress. A technician has been called to inspect and"
                            " resolve the lvlve the issue.Investigation is in progress. A technician has been called to inspect and"
                            " resolve the issue. in progress. A technician has been called to inspect and",
                        txtSize: 14,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.05),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Comment",
                            hintStyle: const TextStyle(
                              color: graycol,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                bottom: 10,
                                right: 20,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/send_arrow.svg',
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: greenColor,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: ScreenWight * 0.4441,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: green.withOpacity(0.5),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: litegreen.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: commonText(
                                    text: "Closed",
                                    txtSize: 16,
                                    color: greenColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 50,
                              width: ScreenWight * 0.4441,
                              child: commonButton(
                                text: "Resolve",
                                textColor: whiteColor,
                                txtSize: 16,
                                buttonShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

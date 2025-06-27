import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/core/Constrants/color.dart';
import 'package:food_checker/screens/fragment_screen/profile/profile_screen.dart';
import 'package:food_checker/screens/fragment_screen/profile/profile_screen2.dart';
import 'package:food_checker/screens/fragment_screen/reports/report_screen2.dart';
import 'package:food_checker/screens/fragment_screen/staff/staff_screen.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login/login.dart';
import 'home/home_screen.dart';
import 'home/home_screen2.dart';


class FragmentScreen extends StatefulWidget {
  @override
  _FragmentExampleState createState() => _FragmentExampleState();
}

class _FragmentExampleState extends State<FragmentScreen> {


  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // or prefs.remove('isLoggedIn');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Signin()),
          (route) => false,
    );
  }


  int _currentIndex = 0;

  final List<Widget> _fragments = [
    HomeScreen(),
    ReportScreen2(),
    StaffScreen(),
    ProfileScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _fragments,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.green),
        unselectedLabelStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: graycol,),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg',
                color: _currentIndex == 0 ? greenColor : graycol),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/report.svg',
                color: _currentIndex == 1 ? greenColor : graycol),
            label:_currentIndex == 1 ? "Report" : "Report",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/staff.svg',
                color: _currentIndex == 2 ? greenColor : graycol),
            label: _currentIndex == 2 ? "Staff": "Staff",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg',
                color: _currentIndex == 3 ? greenColor : graycol),
            label:_currentIndex == 3 ? "Profile":"Profilr",
          ),
        ],
      )
      ,
    );
  }
}







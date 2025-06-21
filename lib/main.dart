import 'package:flutter/material.dart';
import 'package:food_checker/screens/OnBoardingScreen/into_screen.dart';
import 'package:food_checker/screens/OnBoardingScreen/intro_sscreen2.dart';
import 'package:food_checker/screens/OnBoardingScreen/onBoarding_screen1.dart';
import 'package:food_checker/screens/OnBoardingScreen/on_boarding.dart';
import 'package:food_checker/screens/auth/forgot_password/forgot_password.dart';
import 'package:food_checker/screens/auth/login/Login_clipPath.dart';
import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/auth/sign_up/sign_up.dart';
import 'package:food_checker/screens/fragment_screen/fragment_screen.dart';
import 'package:food_checker/screens/fragment_screen/home/cooking/add%20cooking/add_cooking.dart';
import 'package:food_checker/screens/fragment_screen/home/cooking/cooking_details.dart';
import 'package:food_checker/screens/fragment_screen/home/home_screen.dart';
import 'package:food_checker/screens/fragment_screen/home/maintenance/maintenance_main_screen.dart';
import 'package:food_checker/screens/fragment_screen/profile/profile_screen2.dart';
import 'package:food_checker/screens/fragment_screen/reports/report_in_details.dart';
import 'package:food_checker/screens/fragment_screen/staff/Add_staff/add_staff.dart';
import 'package:food_checker/screens/spash_screen/spash_screen.dart';


void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: into_screen(),
// initialRoute: '/',
// routes: {
// '/': (context) => SplashScreen(),
// '/home': (context) => Signin(),}
));

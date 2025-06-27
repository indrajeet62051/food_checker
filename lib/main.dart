import 'package:flutter/material.dart';
import 'package:food_checker/screens/OnBoardingScreen/into_screen.dart';
import 'package:food_checker/screens/auth/login/login.dart';
import 'package:food_checker/screens/auth/sign_up/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  into_screen(),
    );
  }
}
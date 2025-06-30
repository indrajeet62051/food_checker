import 'package:flutter/material.dart';
import 'package:food_checker/screens/OnBoardingScreen/into_screen.dart';
import 'package:food_checker/screens/fragment_screen/fragment_screen.dart';
import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/change%20Password/change_password.dart';
import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/edit%20profile/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? FragmentScreen() : Change_Password(),
    );
  }
}

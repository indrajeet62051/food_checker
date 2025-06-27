import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/screens/auth/login/login_controller.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/login/logIn_Service.dart';
import '../../../core/Constrants/color.dart';
import '../../fragment_screen/fragment_screen.dart';
import '../../fragment_screen/home/home_screen.dart';
import '../forgot_password/forgot_password.dart';
import '../sign_up/sign_up.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<Signin> {
  Future<void> login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => FragmentScreen()),
      (route) => false,
    );
  }

  bool isLoading = false;

  late final LoginController loginController;

  @override
  void initState() {
    super.initState();
    loginController = LoginController();
    ;
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/appLogo.svg'),
                      SizedBox(height: 16),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'PlusJakartaSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Log in now to continue exploring",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PlusJakartaSans',
                          color: graycol,
                        ),
                      ),
                      SizedBox(height: 90),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'PlusJakartaSans',
                            color: graycol,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: loginController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your Email Id",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'assets/icons/Mail.svg',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // rounded corners
                            borderSide: BorderSide(
                              color:
                                  Colors.grey, // grey border when not focused
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: green, // border when focused
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'PlusJakartaSans',
                            color: graycol,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: loginController.passwordController,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'assets/icons/Lockcheck.svg',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // rounded corners
                            borderSide: BorderSide(
                              color:
                                  Colors.grey, // grey border when not focused
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: green, // border when focused
                              width: 2.0,
                            ),
                          ),
                          // Optional: if you want to apply default border to all states
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPass(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'PlusJakartaSans',
                              fontWeight: FontWeight.w600,
                              color: black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: Size(0, 0),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 60,
                        width: 390,
                        child: commonButton(
                          text: "Log In",
                          txtSize: 18,
                          context: context,
                          onPress: () async {
                            final validationError = loginController.validateInput();
                            if (validationError != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(validationError)),
                              );
                              return;
                            }

                            setState(() => isLoading = true);
                            final user = await LoginService().loginUser(
                              email: loginController.emailController.text,
                              password: loginController.passwordController.text,
                            );
                            setState(() => isLoading = false);

                            if (user != null && user.status == 1) {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('isLoggedIn', true);
                              await prefs.setString('fullName', user.data?.fullName ?? '');
                              // await prefs.setString('lastName', user.data?.lastName ?? '');
                              // Optional: Save full name or auth token if needed
                              // await prefs.setString('authToken', user.data?.authToken ?? '');

                              if (!mounted) return;
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => FragmentScreen()),
                                    (Route<dynamic> route) => false,
                              );
                            } else {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(user?.msg ?? "Login Fail")),
                              );
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 40),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Rectangle_27.svg'),
                          SizedBox(width: 10),
                          Text(
                            "OR",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                              color: graycol,
                            ),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset('assets/images/Rectangle_27.svg'),
                        ],
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Sign in With",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: graycol,
                        ),
                      ),
                      SizedBox(height: 40),
                      SvgPicture.asset(
                        'assets/images/google_apple_facebook.svg',
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(width: 70.5),
                          Text(
                            "Are you new to Food Hygiene?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: graycol,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup(),
                                ),
                              );
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),

          if (isLoading)
            Center(
              child: Container(
                color: Colors.white.withOpacity(
                  0.2,
                ), // semi-transparent background
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

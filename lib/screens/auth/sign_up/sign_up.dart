import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_checker/screens/auth/sign_up/sign_up_controller.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/Services/registation_service.dart';
import '../../../core/Constrants/color.dart';
import '../../fragment_screen/fragment_screen.dart';
import '../../widget/text_field.dart';
import '../login/login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() => Sign_up();
}

class Sign_up extends State<Signup> {
  bool isLoading = false;


  late final RegisterController registationController;

  @override
  void initState() {
    super.initState();
    registationController = RegisterController();
  }

  @override
  void dispose() {
    registationController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body:
         Stack(
           children:[ SingleChildScrollView(
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Center(
                child: Column(
                    children: [
                      SvgPicture.asset('assets/images/appLogo.svg'),
                      SizedBox(height: 16,),
                      Text("Get Started", style: TextStyle(fontSize: 24,
                          fontFamily: 'PlusJakartaSans',
                          fontWeight: FontWeight.w700),),
                      SizedBox(height: 4,),
                      Text("Create an account to get all features ",
                        style: TextStyle(fontSize: 16,
                            fontFamily: 'PlusJakartaSans',
                            color: graycol),),
                      SizedBox(height: 90,),
                      Row(children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(alignment: Alignment.centerLeft,
                                child: Text("First Name", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlusJakartaSans',
                                    color: graycol),),),
                              SizedBox(height: 8,),
                              commonTextField(hintText: "First Name",
                                  Svg_Path: 'assets/icons/User.svg',
                                  controller: registationController
                                      .firstNameController,
                              keyboardType: TextInputType.name) // First Name
                            ],),
                        ), //First Name
                        SizedBox(width: 16,), // Space betwn first and lst nm
                        Expanded(
                          child: Column(
                            children: [
                              Align(alignment: Alignment.centerLeft,
                                child: Text("Last Name", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlusJakartaSans',
                                    color: graycol),),),
                              SizedBox(height: 8,),
                              commonTextField(hintText: "Last Name",
                                  Svg_Path: 'assets/icons/User.svg',
                                  controller: registationController
                                      .lastNameController,
                              keyboardType: TextInputType.name) // Last Name
                            ],),
                        ), //Last name
                      ]),
                      SizedBox(height: 8,),
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Email", style: TextStyle(fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                              color: graycol,
                              fontWeight: FontWeight.w500))),
                      SizedBox(height: 8,),
                      commonTextField(hintText: "Enter your email",
                        Svg_Path: 'assets/icons/Mail.svg',
                        controller: registationController.emailController,
                      keyboardType: TextInputType.emailAddress), // Email id
                      SizedBox(height: 12,),
                      Align(alignment: Alignment.centerLeft,
                        child: Text("Password", style: TextStyle(fontSize: 14,
                            fontFamily: 'PlusJakartaSans',
                            color: graycol,
                            fontWeight: FontWeight.w500),),),
                      SizedBox(height: 8,),
                      commonTextField(hintText: "Enter your Password",
                          Svg_Path: 'assets/icons/Lockcheck.svg',
                          controller: registationController.passwordController,
                        obsecure: true
                      ), // Password
                      SizedBox(height: 12,),
                      Align(alignment: Alignment.centerLeft,
                          child: Text("Confirm Password", style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'PlusJakartaSans',
                              color: graycol,
                              fontWeight: FontWeight.w500),)),
                      SizedBox(height: 8,),
                      commonTextField(hintText: "Re-enter Password",
                          obsecure: true,
                          Svg_Path: 'assets/icons/Lockcheck.svg',
                          controller: registationController
                              .confirmPasswordController), // Conf Password
                      SizedBox(height: 48,),
                      SizedBox(height: 60, width: 390,
                          child: commonButton(
                            text: "Register", txtSize: 18, context: context,
                            onPress: () async {
                              final validationError = registationController.validateInput();
                              if (validationError != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(validationError)),
                                );
                                return null;
                              }

                              setState(() => isLoading = true);
                              final user = await RegisterService().registerUser(
                                firstName: registationController
                                    .firstNameController.text,
                                lastName: registationController
                                    .lastNameController.text,
                                email: registationController.emailController
                                    .text,
                                password: registationController
                                    .passwordController.text,
                              );
                              setState(() => isLoading = false);

                              if (user != null && user.status == 1) {

                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setBool('isLoggedIn', true);
                                await prefs.setString('fullName', user.data?.fullName ?? '');
                                await prefs.setString('email', user.data?.email ?? '');
                                await prefs.setString('auth_token', user.data?.authToken ?? '');


                                if (!mounted) return;
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => FragmentScreen()));
                              } else {
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(user?.msg ?? 'Registration failed')),
                                );
                              }
                            },)),
                      SizedBox(height: 40,),
                      Row(children: [
                        SvgPicture.asset('assets/images/Rectangle_27.svg'),
                        SizedBox(width: 10,),
                        Text("OR", style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'PlusJakartaSans',
                            color: graycol),),
                        SizedBox(width: 10,),
                        SvgPicture.asset('assets/images/Rectangle_27.svg')
                      ],),
                      SizedBox(height: 40,),
                      Text("Sign in With", style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: graycol),),
                      SizedBox(height: 40,),
                      SvgPicture.asset('assets/images/google_apple_facebook.svg'),
                      SizedBox(height: 40,),
                      Row(children: [
                        SizedBox(width: screenWidth * 0.3348,),
                        Text("Existing User?", style: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: graycol),),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("LogIn", style: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black,
                            decoration: TextDecoration.underline,
                            decorationColor: black,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 1.5),), style: TextButton
                            .styleFrom(
                            padding: EdgeInsets.zero, minimumSize: Size(0, 0)),)

                      ]),
                      SizedBox(height: 43,),


                    ],
                  ),
                ),
              ),
            )),



             if (isLoading)
               Center(
                 child: Container(
                   color: Colors.white.withOpacity(0.2), // semi-transparent background
                   child: const Center(
                     child: CircularProgressIndicator(
                       color: Colors.green,
                       backgroundColor: Colors.transparent,
                     ),
                   ),
                 ),
               ),
         ]),
        )
    ;
  }
// Widget commonTextField(){
//   return Sca;
//
// }

}
import 'package:flutter/cupertino.dart';

class ForgotPassController {
  final emailController = TextEditingController();
  // final passwordController = TextEditingController();


  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? validateInput() {
    if (emailController.text.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(emailController.text)) {
      return 'Enter a valid email';
    }
    // if (passwordController.text.isEmpty) {
    //   return 'Password is required';
    // }
    // final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    // if (!passwordRegex.hasMatch(passwordController.text)) {
    //   return "Password needs a capital, number, symbol, and be 6+ characters";
    // }
    return null;
  }

  void dispose() {

    emailController.dispose();

  }

  void clear() {

    emailController.clear();
  }
}

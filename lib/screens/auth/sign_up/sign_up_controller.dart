import 'package:flutter/cupertino.dart';

class RegisterController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool get isValid =>
      firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      isValidEmail(emailController.text) &&
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty &&
      passwordController.text == confirmPasswordController.text;

  String? validateInput() {
    if (firstNameController.text.isEmpty) {
      return 'First name is required';
    }
    if (lastNameController.text.isEmpty) {
      return 'Last name is required';
    }
    if (emailController.text.isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(emailController.text)) {
      return 'Enter a valid email';
    }
    if (passwordController.text.isEmpty) {
      return 'Password is required';
    }
    // final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    // if (!passwordRegex.hasMatch(passwordController.text)) {
    //   return "Password needs a capital, number, symbol, and be 6+ characters";
    // }
    if (confirmPasswordController.text.isEmpty) {
      return 'Please confirm your password';
    }
    if (passwordController.text != confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_profile.dart';

class EditProfileController {
  File? uploadedImage;
  final ImagePicker picker = ImagePicker();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  // bool isValidEmail(String email) {
  //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
  //   return emailRegex.hasMatch(email);
  // }
  bool isValidName(String email) {
    final nameRegExp = RegExp(r'^[A-Za-z]+(?:\s[A-Za-z]+)?$');

    return nameRegExp.hasMatch(email);
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(source: source);
    if (picked != null) {
      uploadedImage = File(picked.path);
    }
  }

  String? validateInput() {
    if (!isValidName(nameController.text)) {
      return 'Enter first name followed by a space and last name, or just enter a space after the first name.';
    }
    if (emailController.text.isEmpty) {
      return 'Email is required';
    }
    if (emailController.text != email_) {
      return 'Email didnt match with the email you loged in';
    }
    // Image upload is now optional - removed the validation
    return null;
  }

  void dispose() {
    emailController.dispose();
    nameController.dispose();
  }

  void clear() {
    emailController.clear();
    nameController.clear();
  }
}

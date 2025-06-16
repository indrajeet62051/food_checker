import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class add_staff_controller {
  File ? uploadedImage;
  final ImagePicker picker = ImagePicker();
  final first_name = TextEditingController();
  final last_Name = TextEditingController();
  final email = TextEditingController();
  final role = TextEditingController();
  final department = TextEditingController();
  List<bool> branch =[false,false,false];



  bool get isValid =>
      first_name.text.isNotEmpty &&
          last_Name.text.isNotEmpty &&
          email.text.isNotEmpty &&
          role.text.isNotEmpty &&
          department.text.isNotEmpty &&
          uploadedImage != null &&
          branch.contains(true);


  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(source: source);
    if (picked != null) {
      uploadedImage = File(picked.path);
    }
  }

  void toggleBranch(int index) {
    if (index >= 0 && index < branch.length) {
      branch[index] = !branch[index];
    }
  }



  void resetForm() {
    first_name.clear();
    last_Name.clear();
    email.clear();
    role.clear();
    department.clear();
    uploadedImage = null;
    for (int i = 0; i < branch.length; i++) {
      branch[i] = false;
    }
  }

  void dispose() {
    first_name.dispose();
    last_Name.dispose();
    email.dispose();
    role.dispose();
    department.dispose();
  }

}
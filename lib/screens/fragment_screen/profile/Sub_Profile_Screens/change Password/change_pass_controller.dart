import 'package:flutter/cupertino.dart';

class ChangePassController{
  final CurrentPassController = TextEditingController();
  final NewPassController = TextEditingController();
  final ConfPassController = TextEditingController();

 Validation()
  {
    if(CurrentPassController.text.isEmpty){
      return 'Current Password is required.' ;
    }
    if(NewPassController.text.isEmpty){
      return 'New Password is required.' ;
    }
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    if (!passwordRegex.hasMatch(NewPassController.text)) {
      return "Password needs a capital, number, symbol, and be 6+ characters";
    }
    if(ConfPassController.text.isEmpty){
      return 'Please Confirm the new Password ' ;
    }
    if (NewPassController.text != ConfPassController.text) {
      return "New Passwords didn't matched with Confirm Password.";
    }
    return null;
  }



  void dispose(){
    CurrentPassController.dispose();
    NewPassController.dispose();
    ConfPassController.dispose();
  }

  void clear(){
    CurrentPassController.clear();
    NewPassController.clear();
    ConfPassController.clear();
  }


}
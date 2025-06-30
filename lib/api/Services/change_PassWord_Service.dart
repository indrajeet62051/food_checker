import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/edit%20profile/edit_profile.dart';

import '../data_mode_post.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ChangePassWordService{
  final String baseUrl ="https://codonnier.tech/flutterapp/food_hygine/dev/Service.php?Service=changePassword&show_error=true";


  Future<User?> ChangePassUser({
    required String OldPass,
    required String NewPass,

  }) async {
    try {
      final responce = await http.post(
        Uri.parse(baseUrl),headers: {
        'Content-Type':'application/json',
        'App-Track-Version':'v1',
        'App-Device-Type':'iOS',
        'App-Store-Version':'1.1',
        'App-Device-Model':'iPhone 8',
        'App-Os-Version':'iOS 11',
        'App-Store-Build-Number':'1.1',
        'App-Secret':'FoodHygine@2025',
        'Auth-Token':'$auth_Token_'
      },
        body: jsonEncode({
          'old_password' : OldPass,
          'new_password' : NewPass,

        })
      );


      if(responce.statusCode == 200){
        final jsonBody =  jsonDecode(responce.body);
        if(jsonBody['status'] == 1){

          return User.fromJson(jsonBody);
        }else{
          debugPrint('Api Error : ${jsonBody['msg']}');
        }

      }
      else {
        debugPrint('HTTP Error Login Fail ${responce.statusCode}: ${responce.body}');
        return null;
      }
    }catch (e) {
      debugPrint('Network error: $e');
      return null;
    }
  }
}
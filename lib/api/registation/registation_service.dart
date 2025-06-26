import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../data_mode_post.dart';

class RegisterService {
  final String baseUrl =
      'http://codonnier.tech/flutterapp/food_hygine/dev/Service.php?Service=registration&show_error=true';

  Future<User?> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          // 'Content-Type':'application/json',
          'App-Track-Version': 'v1',
          'App-Device-Type': 'iOS',
          'App-Store-Version': '1.1',
          'App-Device-Model': 'iPhone 8',
          'App-Os-Version': 'iOS 11',
          'App-Store-Build-Number': '1.1',
          'App-Secret': 'FoodHygine@2025',
          //Auth-Token:{{auth_token}}
        },
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "login_type": "email",
          // "confirm_password": confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);


        if (jsonBody["status"] == 1) {
          return User.fromJson(jsonBody); // success
        } else {
          debugPrint('API Error: ${jsonBody["msg"]}');
          return User.fromJson(jsonBody);
        }
      }else {
        debugPrint('HTTP Error ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Network Error: $e');
      return null;
    }
  }
}





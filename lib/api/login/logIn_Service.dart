import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../data_mode_post.dart';


class LoginService {
  final String baseUrl = 'https://codonnier.tech/flutterapp/food_hygine/dev/Service.php?Service=login&show_error=true';

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type':'application/json',
          'App-Track-Version':'v1',
          'App-Device-Type':'iOS',
          'App-Store-Version':'1.1',
          'App-Device-Model':'iPhone 8',
          'App-Os-Version':'iOS 11',
         'App-Store-Build-Number':'1.1',
          'App-Secret':'FoodHygine@2025'
//Auth-Token:{{auth_token}}
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'login_type': 'email',
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

      } else {
        debugPrint('HTTP Error Login Fail ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Network error: $e');
      return null;
    }
  }
}

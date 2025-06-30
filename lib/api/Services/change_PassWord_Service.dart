import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/edit%20profile/edit_profile.dart';

import '../../screens/fragment_screen/profile/Sub_Profile_Screens/change Password/change_password.dart';
import '../data_mode_post.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ChangePassWordService {
  // final auth = auth_Token_;
  final String baseUrl =
      "https://codonnier.tech/flutterapp/food_hygine/dev/Service.php?Service=changePassword&show_error=true";

  Future<Map<String, dynamic>?> ChangePassUser({
    required String OldPass,
    required String NewPass,
  }) async {
    try {
      final responce = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'App-Track-Version': 'v1',
          'App-Device-Type': 'iOS',
          'App-Store-Version': '1.1',
          'App-Device-Model': 'iPhone 8',
          'App-Os-Version': 'iOS 11',
          'App-Store-Build-Number': '1.1',
          'App-Secret': 'FoodHygine@2025',
          'Auth-Token': '$auth_Token_C',
        },
        body: jsonEncode({'old_password': OldPass, 'new_password': NewPass}),
      );

      if (responce.statusCode == 200) {
        final jsonBody = jsonDecode(responce.body);
        return jsonBody;
      } else {
        debugPrint(
          'HTTP Error Login Fail ${responce.statusCode}: ${responce.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('Network error: $e');
      return null;
    }
  }
}

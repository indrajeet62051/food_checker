import 'dart:convert';
import 'dart:io';
import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/edit%20profile/edit_profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../data_mode_post.dart';

class EditProfileService {
  final String baseUrl =
      'https://codonnier.tech/flutterapp/food_hygine/dev/Service.php?Service=updateUserDetails&show_error=true';

  Future<User?> EditProfileUser({
    required String firstName,
    required String lastName,
    File? profileimage,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      request.fields['first_name'] = firstName;
      request.fields['last_name'] = lastName;
      //request.fields['auth_token'] = '300ffbcc68e36f99d07746c85af26e778ff2868d8a8384e404a8d0fde8f380865bd300';

      if (profileimage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profile_images',
            profileimage.path,
          ),
        );
      }

      request.headers.addAll({
        'Accept': 'application/json',
        'App-Track-Version': 'v1',
        'App-Device-Type': 'iOS',
        'App-Store-Version': '1.1',
        'App-Device-Model': 'iPhone 8',
        'App-Os-Version': 'iOS 11',
        'App-Store-Build-Number': '1.1',
        'App-Secret': 'FoodHygine@2025',
        'Auth-Token': '$auth_Token_',
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        if (jsonBody["status"] == 1) {
          return User.fromJson(jsonBody); // success
        } else {
          debugPrint('API Error: ${jsonBody["msg"]}');
          return User.fromJson(jsonBody);
        }
      } else {
        debugPrint('HTTP Error: ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Network Error: $e');
      return null;
    }
  }
}

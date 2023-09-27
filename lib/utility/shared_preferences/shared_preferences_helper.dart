import 'dart:convert';

import 'package:seventyfivehard/models/user_model.dart';
import 'package:seventyfivehard/utility/shared_preferences/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static Future<void> setUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedKeys.userId, userId);
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString(SharedKeys.userId) ?? '';
    return userId;
  }

  static Future<void> setUserDetails(UserModel userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      SharedKeys.userDetails,
      json.encode(userDetails.toMap()),
    );
  }

  static Future<UserModel> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDetailsString = prefs.getString(SharedKeys.userDetails) ?? '';
    UserModel userModel = UserModel.fromMap(json.decode(userDetailsString));
    return userModel;
  }

  static clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

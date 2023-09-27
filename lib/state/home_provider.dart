import 'package:flutter/material.dart';
import 'package:seventyfivehard/models/challenge_model.dart';
import 'package:seventyfivehard/models/user_model.dart';
import 'package:seventyfivehard/services/database.dart';
import 'package:seventyfivehard/utility/shared_preferences/shared_preferences_helper.dart';

class HomeProvider with ChangeNotifier {
  UserModel _userDetails = UserModel();
  List<ChallengeModel> _challenges = [];

  UserModel get userDetails => _userDetails;
  List<ChallengeModel> get challenges => _challenges;

  void initHomeScreen() async {
    await Future.wait([
      getUserDetails(),
      getUserChallenges(),
    ]);
  }

  Future<void> getUserDetails() async {
    _userDetails = await SharedPreferenceHelper.getUserDetails();
    notifyListeners();
  }

  Future<void> getUserChallenges() async {
    String userId = await SharedPreferenceHelper.getUserId();
    try {
      _challenges = await DatabaseService().getChallengeList(userId);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}

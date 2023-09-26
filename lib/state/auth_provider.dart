import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seventyfivehard/models/user.dart';
import 'package:seventyfivehard/services/database.dart';
import 'package:seventyfivehard/utility/shared_preferences/shared_preferences_helper.dart';

class AuthProvider with ChangeNotifier {
  String? _userId;

  String? get userId => _userId;

  /// Triggers Google authentication flow
  Future<void> googleLogIn() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    final GoogleSignInAccount? googleUser = GoogleSignIn().currentUser ??
        await GoogleSignIn(scopes: <String>['email'])
            .signIn()
            .onError((error, stackTrace) {
          throw Exception(error);
        });

    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User? user = (await FirebaseAuth.instance
            .signInWithCredential(credential)
            .onError((error, stackTrace) {
      throw Exception(error);
    }))
        .user;
    setUserId(userId: user!.uid);
    storeUserDataInCollection(
      userData: UserModel(
        name: user.displayName,
        gmailId: user.email,
      ),
      docId: user.uid,
    );
    notifyListeners();
  }

  /// Store user data in the [FirebaseFirestore]
  Future<bool> storeUserDataInCollection({
    required UserModel userData,
    required String docId,
  }) async {
    try {
      await DatabaseService()
          .setUserData(
            userData: userData.toMap(),
            docId: docId,
          )
          .onError(
            (error, stackTrace) => throw Exception(error),
          );
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// Save the [_userId] after authentication in [SharedPreferences]
  /// and in [AuthProvider]
  void setUserId({required String? userId}) async {
    _userId = userId;
    await SharedPreferenceHelper.setUserId(userId ?? '');
  }
}

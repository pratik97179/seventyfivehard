import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seventyfivehard/models/user_model.dart';
import 'package:seventyfivehard/services/database.dart';
import 'package:seventyfivehard/utility/shared_preferences/shared_preferences_helper.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthProvider with ChangeNotifier {
  /// Triggers Google authentication flow
  Future<void> googleLogIn() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

    try {
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

      UserModel userDetails = UserModel(
        name: user!.displayName,
        gmailId: user.email,
      );

      setUserData(
        userDetails: userDetails,
        userId: user.uid,
      );

      storeUserDataInCollection(
        userData: userDetails,
        docId: user.uid,
      );
    } catch (e) {
      print(e);
    }
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

  /// Triggers Apple authentication flow
  Future<void> appleLogin() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    ).onError((error, stackTrace) {
      throw Exception('$error');
    });

    print(
        "Apple credential ===>\nEmail - ${credential.email}\nid_Token - ${credential.identityToken}\nAuthorization code - ${credential.authorizationCode}\nUser identifier - ${credential.userIdentifier}");
  }

  /// Cache the user details after authentication in [SharedPreferences]
  /// and in [AuthProvider]
  void setUserData({
    required UserModel userDetails,
    required String userId,
  }) async {
    await SharedPreferenceHelper.setUserId(userId);
    await SharedPreferenceHelper.setUserDetails(userDetails);
  }
}

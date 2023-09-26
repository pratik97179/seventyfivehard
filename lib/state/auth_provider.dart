import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  /// Triggers Google authentication flow
  Future<void> googleLogIn(BuildContext context) async {
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
    // setUserId(userId: user!.uid);
    // if ((await DatabaseService().checkUserExists(uid: user.uid)) == false) {
    //   storeUserDataInCollection(
    //     context: context,
    //     userData: UserModel(
    //       name: user.displayName,
    //       gmailId: user.email,
    //       id: user.uid,
    //     ),
    //     docId: user.uid,
    //   );
    // }
    notifyListeners();
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  FirebaseAuth _auth;
  GoogleSignIn _googleSignIn;

  GoogleAuth() {
    _googleSignIn = GoogleSignIn();
    _auth = FirebaseAuth.instance;
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User currentUser = _auth.currentUser;
        assert(user.uid == currentUser.uid);

        // debugPrint('signInWithGoogle succeeded: $user');
        return user;
      }
    } catch (e) {
      //TODO:: 에러처리 (메시지 박스)
      log('################### apple login error ${e}');
      return null;
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

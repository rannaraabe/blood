import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Logic for when we click in the button to log in with google sign in
class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  // Get method to get the google sign in account
  GoogleSignInAccount get user => _user!;

  Future googleLogIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Use user credentials to sign in in firebase auth
    await FirebaseAuth.instance.signInWithCredential(credential);

    // To update our UI
    notifyListeners();
  }
}

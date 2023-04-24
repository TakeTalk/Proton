

import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
      await prefs.setString('name', reslut.displayName.toString());
      await prefs.setString('email', reslut.email.toString());


    } catch (error) {
      print(error);
    }
  }
  //   googl() async {
  //   print("googleLogin method Called");
  //   GoogleSignIn _googleSignIn = GoogleSignIn();
  //   try {
  //     var reslut = await _googleSignIn.signIn();
  //     if (reslut == null) {
  //       return "";
  //     }
  //
  //     return await reslut.displayName.toString();
  //     print(reslut.email);
  //     print(reslut.photoUrl);
  //     // Obtain shared preferences.
  //
  //
  //   } catch (error) {
  //     print(error);
  //   }
  // }

}
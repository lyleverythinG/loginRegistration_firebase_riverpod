import 'package:flutter/material.dart';

class Constants {
  static const kFirebaseWithRiverpod = 'Firebase with Riverpod';
  static const kRegisterScreen = 'Register Screen';
  static const kEnterValidEmail = 'Please enter valid email';
  static const kEmail = 'Email';
  static const kPasswordRule = 'Password must be at least 8 digits long';
  static const kPassword = 'Password';
  static const kConfirmPassword = 'Confirm Password';
  static const kRegister = 'Register';
  static const kLogin = 'Login';
  static const kLogOut = 'Log out';
  static ThemeData aTheme = ThemeData(
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blueAccent,
    appBarTheme: const AppBarTheme()
        .copyWith(backgroundColor: const Color.fromRGBO(18, 26, 28, 1)),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
  );
}

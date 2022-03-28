import 'package:flutter/material.dart';

abstract class AlertDialogTheme {
  static TextStyle get appBarTextStyle {
    return const TextStyle(
      fontFamily: 'ABeeZee',
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get buttonTextStyle {
    return const TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w200,
      color: Colors.black,
    );
  }

  static TextStyle get titleTextStyle {
    return const TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 16,
    );
  }

  static TextStyle get textFieldStyle {
    return const TextStyle(
      fontFamily: 'ABeeZee',
      color: Colors.black,
      fontSize: 12,
    );
  }
}
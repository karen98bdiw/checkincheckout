import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Gray6 = Color(0xFFF2F2F2);
const Gray1 = Color.fromRGBO(51, 51, 51, 1);
const Gray2 = Color.fromRGBO(79, 79, 79, 1);
const Gray3 = Color.fromRGBO(189, 189, 189, 1);
const Gray5 = Color.fromRGBO(224, 224, 224, 1);
const Gray4 = Color.fromRGBO(189, 189, 189, 1);

const InputBorderColor = Color.fromRGBO(112, 112, 112, 1);

//*---DEPRECATED---*
const mainBlue = Colors.blue;
const mainOrange = Colors.orange;
const mainGrey = Colors.grey;
const smallTextColor = Colors.grey;
const smallTextSize = 14.0;
const smallTextWeight = FontWeight.w400;
const midiumTextColor = Colors.grey;
const midiumTextSize = 18.0;
const midiumTextWeight = FontWeight.w700;
const hintTextColor = Colors.grey;
const hintTextSize = 16.0;
const hintTextWeight = FontWeight.w400;
const appBarTitleColor = Colors.grey;

var mainButtonTextSize = 16.0;
var mainButtonTextColor = Color.fromRGBO(242, 242, 242, 1);
var mainBottonTextWeight = FontWeight.w700;

var appBarIconColor = Colors.orange;

var defaultPaddingProcent = 0.1;

var passwordRestoreText =
    "Enter the email address you used during registration and we will send a new password";

var mainBorderColor = Colors.grey;
//*---DEPRECATED---*

class FontFamily {
  static const TTNorms = 'Roboto';
}

ThemeData buildLightTheme() {
  return ThemeData(
    primarySwatch: mainBlue,
    accentColor: mainOrange,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonColor: mainOrange,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: appBarIconColor, size: 40),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: hintTextColor,
        fontSize: hintTextSize,
        fontWeight: hintTextWeight,
      ),
    ),
    textTheme: TextTheme(
      headline2: TextStyle(
          fontSize: midiumTextSize,
          color: midiumTextColor,
          fontWeight: midiumTextWeight),
      headline3: TextStyle(
          fontSize: smallTextSize,
          color: smallTextColor,
          fontWeight: smallTextWeight),
      button: TextStyle(
          fontSize: mainButtonTextSize,
          color: mainButtonTextColor,
          fontWeight: mainBottonTextWeight),
      headline1: TextStyle(
          fontSize: midiumTextSize,
          color: midiumTextColor,
          fontWeight: midiumTextWeight),
    ),
  );
}

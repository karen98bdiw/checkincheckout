import 'package:flutter/material.dart';

import './utils/const.dart';

import './screens/intro_screens/intro_screen.dart';
import './screens/intro_screens/intro.dart';
import './screens/intro_screens/singUp_screens/signUp_screen.dart';
import './screens/intro_screens/singUp_screens/payment_info_screen.dart';
import './screens/intro_screens/singUp_screens/payment_plan_screen.dart';
import './screens/intro_screens/signIn_screens/signIn_screen.dart';
import './screens/intro_screens/signIn_screens/restore_password_screen.dart';

import './screens/main_screens/screens/rootScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: mainBlue,
        accentColor: mainOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: mainOrange,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: appBarIconColor, size: 40),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: midiumTextSize,
                fontWeight: midiumTextWeight,
                color: appBarTitleColor,
              ),
            )),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.grey[900],
            ),
          ),
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
      ),
      initialRoute: Intro.routeName,
      routes: {
        IntroScreen.routeName: (ctx) => IntroScreen(),
        Intro.routeName: (ctx) => Intro(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        PaymentInfoScreen.routeName: (ctx) => PaymentInfoScreen(),
        PaymentPlanScreen.routeName: (ctx) => PaymentPlanScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        RestorPasswordScreen.routeName: (ctx) => RestorPasswordScreen(),
        MainRootScreen.routeName: (ctx) => MainRootScreen(),
      },
    );
  }
}

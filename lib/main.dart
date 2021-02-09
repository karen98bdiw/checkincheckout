import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/pages/intro_screen.dart';
import 'package:checkincheckout/pages/payment_plan_screen.dart';
import 'package:checkincheckout/pages/signIn_screen.dart';
import 'package:flutter/material.dart';

import 'pages/payment_info_screen.dart';
import 'pages/restore_password_screen.dart';
import 'pages/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin Checkout',
      theme: buildLightTheme(),
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (ctx) => IntroScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        PaymentInfoScreen.routeName: (ctx) => PaymentInfoScreen(),
        PaymentPlanScreen.routeName: (ctx) => PaymentPlanScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        RestorPasswordScreen.routeName: (ctx) => RestorPasswordScreen(),
      },
    );
  }
}

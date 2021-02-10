import 'package:auto_route/auto_route.dart';
import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin Checkout',
      theme: buildLightTheme(),
      builder: ExtendedNavigator.builder<AppRouter>(
          router: AppRouter(),
          initialRoute: '/',
          builder: (ctx, extendedNav) => Theme(
                data: buildLightTheme(),
                child: extendedNav,
              )),
    );
  }
}

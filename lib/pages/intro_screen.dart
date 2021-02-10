import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/logo_widget.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:flutter/material.dart';

import '../router.gr.dart';

class IntroScreen extends StatelessWidget {
  static final routeName = "IntroScreen";

  MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (query.size.width * defaultPaddingProcent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              LogoWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ornare enim leo enim urna netus quam sit mattis eget quisque eu",
                style: TextStyle(color: Gray6, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              MainButton(
                text: "SIGN IN",
                callBack: () {
                  Navigator.of(context).pushNamed(Routes.signInScreen);
                },
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                text: "REGISTER",
                callBack: () {
                  Navigator.of(context).pushNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

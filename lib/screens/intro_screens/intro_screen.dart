import 'package:flutter/material.dart';

import '../../utils/const.dart';

import '../widgets/mainButton.dart';
import '../widgets/logo_widget.dart';

import './singUp_screens/signUp_screen.dart';
import './signIn_screens/signIn_screen.dart';

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
                introText,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 10,
              ),
              MainButton(
                text: "Sign In",
                callBack: () {
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                text: "Register",
                callBack: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

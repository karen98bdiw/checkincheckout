import 'package:flutter/material.dart';

import '../../utils/const.dart';

import '../widgets/mainButton.dart';

import './singUp_screens/signUp_screen.dart';

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
              _logo(context: context),
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
                callBack: () {},
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

  Widget _logo({BuildContext context}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/mainLogo.png",
          ),
        ),
      ),
    );
  }
}

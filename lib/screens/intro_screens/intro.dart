import 'package:flutter/material.dart';

import '../../utils/const.dart';

import './intro_screen.dart';

import '../widgets/logo_widget.dart';

class Intro extends StatelessWidget {
  static final routeName = "Intro";

  MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    Future.delayed(Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacementNamed(IntroScreen.routeName));
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: (query.size.width * defaultPaddingProcent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ],
          ),
        ),
      ),
    );
  }
}

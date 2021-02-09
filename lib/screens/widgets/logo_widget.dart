import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

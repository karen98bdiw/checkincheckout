import 'package:flutter/material.dart';
import '../constants/theme.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PoorAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final BuildContext context;
  final Function onBackButtonPressed;

  PoorAppBar(
      {@required this.title, @required this.context, this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 20,
        left: 25,
        right: 25,
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Gray1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
              child: GestureDetector(
                  onTap: () {
                    onBackButtonPressed == null
                        ? Navigator.of(context).pop()
                        : onBackButtonPressed();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: mainOrange,
                    size: 50,
                  )),
              left: 0,
              bottom: -8)
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).viewPadding.top + 40);
}

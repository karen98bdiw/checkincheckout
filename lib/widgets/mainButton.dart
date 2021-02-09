import 'package:checkincheckout/constants/theme.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function callBack;

  MainButton({
    @required this.text,
    @required this.callBack,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Text(text, style: TextStyle(color: Gray6, fontSize: 18)),
      color: Theme.of(context).buttonColor,
      onPressed: callBack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}

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
      child: Text(text, style: Theme.of(context).textTheme.button),
      color: Theme.of(context).buttonColor,
      onPressed: callBack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}

import 'package:checkincheckout/constants/theme.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function callBack;
  final isOutlined;

  MainButton({
    @required this.text,
    @required this.callBack,
    this.isOutlined,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Text(text,
          style: TextStyle(
              color:
                  isOutlined == null || isOutlined == true ? Gray6 : mainOrange,
              fontSize: 18)),
      color: isOutlined == null || isOutlined == true
          ? Theme.of(context).buttonColor
          : Colors.transparent,
      onPressed: callBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: isOutlined == null || isOutlined == true
            ? BorderSide.none
            : BorderSide(color: mainOrange),
      ),
    );
  }
}

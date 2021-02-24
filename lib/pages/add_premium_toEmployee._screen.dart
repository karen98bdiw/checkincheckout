import 'package:checkincheckout/router.gr.dart';
import 'package:checkincheckout/widgets/outlined_text_field.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;

import '../constants/theme.dart';
import '../widgets/mainButton.dart';

class AddEmployeePremiumScreen extends StatefulWidget {
  @override
  _AddEmployeePremiumScreen createState() => _AddEmployeePremiumScreen();
}

class _AddEmployeePremiumScreen extends State<AddEmployeePremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Add Premium", context: context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topView(context: context),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: _input(),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  defaultPaddingProcent, //cant set cross axis to strech
            ),
            width: MediaQuery.of(context).size.width,
            child: MainButton(
                text: "ADD PREMIUM",
                callBack: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }

  Widget _input() {
    return OutlinedTextField(
      hintText: "Premium \$",
    );
  }

  Widget _topView({@required BuildContext context}) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 6),
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(196, 196, 196, 1),
              image: DecorationImage(
                image: AssetImage("assets/images/profilePic.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Brian Smith",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Gray1,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "Manager",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Gray2,
          ),
        ),
      ],
    ));
  }
}

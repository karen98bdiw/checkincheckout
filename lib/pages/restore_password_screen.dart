import 'package:checkincheckout/constants/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/logo_widget.dart';
import '../widgets/mainButton.dart';
import '../widgets/poor_appbar.dart';
import '../widgets/outlined_text_field.dart';

class RestorPasswordScreen extends StatefulWidget {
  static final routeName = "RestorePasswordScreen";

  @override
  _RestorPasswordScreenState createState() => _RestorPasswordScreenState();
}

class _RestorPasswordScreenState extends State<RestorPasswordScreen> {
  var _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        backgroundColor: mainBlue,
        appBar: PoorAppBar(
          context: context,
          title: "",
        ),
        body: LayoutBuilder(
          builder: (ctx, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.only(
                  top: 85,
                  bottom: _bottomInsets > 0 ? _bottomInsets : 41,
                  left:
                      MediaQuery.of(context).size.width * defaultPaddingProcent,
                  right:
                      MediaQuery.of(context).size.width * defaultPaddingProcent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LogoWidget(),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Enter the email address you used during registration and we will send a new password",
                          style: TextStyle(
                              fontSize: 14,
                              color: Gray6,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _input(),
                      ],
                    ),
                    MainButton(
                        text: "RESTORE PASSWORD",
                        callBack: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _input() {
    return OutlinedTextField(
      filled: true,
      fillColor: Colors.white,
      inputType: TextInputType.emailAddress,
      controller: _emailController,
      hintText: "Email",
    );
  }
}

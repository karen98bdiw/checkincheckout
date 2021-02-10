import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/logo_widget.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

import '../router.gr.dart';

class SignInScreen extends StatelessWidget {
  static final routeName = "SignInScreen";

  var _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: mainBlue,
        appBar: PoorAppBar(
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
                  top: 100,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30,
                  left:
                      MediaQuery.of(context).size.width * defaultPaddingProcent,
                  right:
                      MediaQuery.of(context).size.width * defaultPaddingProcent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LogoWidget(),
                    _inputForm(context: context),
                    MainButton(text: "SIGN IN", callBack: () {}),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _inputForm({@required context}) {
    return Form(
      key: _formState,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Email",
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Password",
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.restorPasswordScreen);
            },
            child: Text(
              "Forgot Password?",
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../../widgets/mainButton.dart';
import '../../widgets/logo_widget.dart';

import './restore_password_screen.dart';

import '../../../utils/const.dart';

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
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              border: Theme.of(context)
                  .inputDecorationTheme
                  .border
                  .copyWith(borderSide: BorderSide.none),
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
              border: Theme.of(context)
                  .inputDecorationTheme
                  .border
                  .copyWith(borderSide: BorderSide.none),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RestorPasswordScreen.routeName);
            },
            child: Text(
              "Forgot Password?",
              style: Theme.of(context).inputDecorationTheme.hintStyle.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

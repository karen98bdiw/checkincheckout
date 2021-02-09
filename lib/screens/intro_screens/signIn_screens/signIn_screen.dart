import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../../widgets/mainButton.dart';
import '../../widgets/logo_widget.dart';

import './restore_password_screen.dart';
import '../../main_screens/screens/rootScreen.dart';

import '../../../utils/const.dart';

class SignInScreen extends StatefulWidget {
  static final routeName = "SignInScreen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _formState = GlobalKey<FormState>();

  var _showPassword = false;

  void _toogleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  String _email;

  String _password;

  void _validateForm() {
    _formState.currentState.validate() ? _saveForm() : print("wrong");
  }

  void _saveForm() {
    _formState.currentState.save();
    print(_email + ":" + _password);
    Navigator.of(context).pushNamed(MainRootScreen.routeName);
  }

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
                  top: 50,
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
                    MainButton(
                      text: "SIGN IN",
                      callBack: _validateForm,
                    ),
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
            validator: (value) => value.isEmpty ? "Please write email" : null,
            onSaved: (newValue) => _email = newValue,
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
          Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                obscureText: _showPassword,
                validator: (value) =>
                    value.isEmpty ? "Please write password" : null,
                onSaved: (newValue) => _password = newValue,
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
              Positioned(
                child: InkWell(
                  onTap: _toogleShowPassword,
                  child: Icon(
                    _showPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: mainOrange,
                  ),
                ),
                right: 10,
                top: 10,
              ),
            ],
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

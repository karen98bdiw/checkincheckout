import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/pages/employee_personal_profile/employe_presonal_profile_screen.dart';
import 'package:checkincheckout/widgets/logo_widget.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/outlined_text_field.dart';
import '../constants/theme.dart';

import '../router.gr.dart';

class SignInScreen extends StatefulWidget {
  static final routeName = "SignInScreen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _formState = GlobalKey<FormState>();

  String _email;

  String _password;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  bool _showPassword = false;

  void _tooglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (!_formState.currentState.validate()) {
      return;
    }

    _formState.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    var _bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
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
                top: _bottomInsets > 0 ? 10 : 85,
                bottom: _bottomInsets > 0 ? _bottomInsets : 41,
                left: MediaQuery.of(context).size.width * defaultPaddingProcent,
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
                    callBack: () {
                      Navigator.of(context).pushNamed(Routes.mainScreensRoot);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputForm({@required context}) {
    return Form(
      key: _formState,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedTextField(
            controller: _emailController,
            filled: true,
            fillColor: Colors.white,
            borderEnabled: false,
            titleColor: Gray6,
            title: "Email",
            focusNode: _emailNode,
            onSubmitted: (v) {
              _passwordNode.requestFocus();
            },
            action: TextInputAction.next,
          ),
          Stack(
            children: [
              OutlinedTextField(
                obscureText: _showPassword,
                controller: _passwordController,
                focusNode: _passwordNode,
                filled: true,
                fillColor: Colors.white,
                borderEnabled: false,
                titleColor: Gray6,
                title: "Password",
                onSubmitted: (v) {
                  _passwordNode.unfocus();
                },
              ),
              Positioned(
                right: 13,
                top: 49,
                child: GestureDetector(
                  child: Icon(
                    _showPassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: Color.fromRGBO(252, 168, 61, 1),
                    size: 20,
                  ),
                  onTap: _tooglePassword,
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.restorPasswordScreen);
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Gray6,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}

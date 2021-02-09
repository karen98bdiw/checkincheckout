import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../../widgets/logo_widget.dart';
import '../../widgets/mainButton.dart';

import '../../../utils/const.dart';

class RestorPasswordScreen extends StatelessWidget {
  static final routeName = "RestorePasswordScreen";

  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                left: MediaQuery.of(context).size.width * defaultPaddingProcent,
                right:
                    MediaQuery.of(context).size.width * defaultPaddingProcent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      LogoWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        passwordRestoreText,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _emailController,
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
                    ],
                  ),
                  MainButton(text: "SIGN IN", callBack: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

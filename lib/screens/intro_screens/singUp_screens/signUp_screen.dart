import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../../../utils/const.dart';

class SignUpScreen extends StatelessWidget {
  static final routeName = "SignUpScreen";

  final firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Register"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width * defaultPaddingProcent,
              vertical: 10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _fomrFieldTitle(text: "First Name", context: context),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                    hintText: "First Name",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fomrFieldTitle(
      {@required String text, @required BuildContext context}) {
    return Text(text, style: Theme.of(context).textTheme.headline2);
  }
}

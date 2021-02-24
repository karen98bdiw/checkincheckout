import 'package:checkincheckout/pages/payroll_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/mainButton.dart';
import '../widgets/poor_appbar.dart';
import '../widgets/outlined_text_field.dart';
import '../constants/theme.dart';

class CalculatePayrollScreen extends StatefulWidget {
  static final routeName = "CalculatePayrollScreen";

  @override
  _CalculatePayrollScreenState createState() => _CalculatePayrollScreenState();
}

class _CalculatePayrollScreenState extends State<CalculatePayrollScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _fromFocusNode = FocusNode();
  final _toFocuseNode = FocusNode();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _fromFocusNode.dispose();
    _toFocuseNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(
        title: "Calculate Payroll",
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * defaultPaddingProcent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Period",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Gray1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            OutlinedTextField(
              hintText: "From, MM/DD/YYYY",
            ),
            SizedBox(
              height: 7,
            ),
            OutlinedTextField(
              hintText: "To, MM/DD/YYYY",
            ),
            SizedBox(
              height: 12,
            ),
            MainButton(
                text: "CALCULATE",
                callBack: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => PayrollScreen()));
                })
          ],
        ),
      ),
    );
  }
}

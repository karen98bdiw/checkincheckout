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
              style: TextStyle(
                color: Gray1,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "From, MM/DD/YYYY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Gray1,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              controller: _fromController,
              focusNode: _fromFocusNode,
              textInputAction: TextInputAction.next,
              enabled: true,
              maxLines: 1,
              style: TextStyle(
                  //TODO:;
                  ),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 13,
                  bottom: 14,
                ),
                hintStyle: TextStyle(
                  color: Gray5,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: InputBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onSubmitted: (v) {
                _toFocuseNode.requestFocus();
              },
            ),
            SizedBox(
              height: 9,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "To, MM/DD/YYYY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Gray1,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              controller: _toController,
              focusNode: _toFocuseNode,
              textInputAction: TextInputAction.done,
              enabled: true,
              maxLines: 1,
              style: TextStyle(
                  //TODO:;
                  ),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 13,
                  bottom: 14,
                ),
                hintStyle: TextStyle(
                  color: Gray5,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: InputBorderColor, width: 1),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onSubmitted: (v) {
                _toFocuseNode.unfocus();
              },
            ),
            SizedBox(
              height: 12,
            ),
            MainButton(text: "CALCULATE", callBack: () {})
          ],
        ),
      ),
    );
  }
}

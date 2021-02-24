import 'package:checkincheckout/pages/payroll_screen.dart';
import 'package:checkincheckout/pages/view_employee_payroll_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/mainButton.dart';
import '../widgets/poor_appbar.dart';
import '../widgets/outlined_text_field.dart';
import '../constants/theme.dart';

class EmployeeCalculatePayrollScreen extends StatefulWidget {
  static final routeName = "EmployeeCalculatePayrollScreen";

  @override
  _EmployeeCalculatePayrollScreenState createState() =>
      _EmployeeCalculatePayrollScreenState();
}

class _EmployeeCalculatePayrollScreenState
    extends State<EmployeeCalculatePayrollScreen> {
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
        padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * defaultPaddingProcent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _topView(context: context),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => ViewEmployeePayrollScreen()));
                })
          ],
        ),
      ),
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
                image: AssetImage("assets/images/eProfPic.png"),
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

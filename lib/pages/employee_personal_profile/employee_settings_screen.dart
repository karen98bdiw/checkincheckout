import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_switch.dart';
import '../../constants/theme.dart';

class EmployeeSettingsScreen extends StatefulWidget {
  @override
  _EmployeeSettingsScreenState createState() => _EmployeeSettingsScreenState();
}

class _EmployeeSettingsScreenState extends State<EmployeeSettingsScreen> {
  bool pushNotes = false;
  bool emailNotes = false;
  bool smsNotes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Settings", context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width * defaultPaddingProcent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Notifications",
              style: TextStyle(
                  color: Gray2, fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 23,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Push notifications",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: pushNotes,
                  onChanged: (bool val) {
                    setState(() {
                      pushNotes = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "E-Mail notifications",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: emailNotes,
                  onChanged: (bool val) {
                    setState(() {
                      emailNotes = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SMS notifications",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                CustomSwitch(
                  value: smsNotes,
                  onChanged: (bool val) {
                    setState(() {
                      smsNotes = val;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

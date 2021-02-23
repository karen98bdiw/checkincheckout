import 'package:flutter/material.dart';

import '../constants/theme.dart';

import '../widgets/mainButton.dart';
import '../widgets/outlined_text_field.dart';
import '../widgets/poor_appbar.dart';

class AddEmployeeScreen extends StatefulWidget {
  static final routeName = "AddEmployeeScreen";
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String _workDayStartTimeType = "AM";
  String _workDayEndTimeType = "AM";

  void _workStartTimeSetter({@required String type}) {
    setState(() {
      _workDayStartTimeType = type;
    });
  }

  void _workEndTimeSetter({@required String type}) {
    setState(() {
      _workDayEndTimeType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PoorAppBar(title: "Add Employee", context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width * defaultPaddingProcent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainBlue,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 3,
                      child: GestureDetector(
                        onTap: () {
                          print("adddddd");
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainOrange,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                _form(),
                SizedBox(
                  height: 28,
                ),
                MainButton(
                    text: "ADD EMPLOYEE",
                    callBack: () {
                      Navigator.of(context).pop();
                    }),
                SizedBox(height: 22),
              ],
            ),
          ),
        ));
  }

  Widget _form() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedTextField(
                  title: "First Name",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: OutlinedTextField(
                  title: "Middle Name",
                ),
              ),
            ],
          ),
          OutlinedTextField(
            title: "Last Name",
          ),
          OutlinedTextField(
            title: "Company Name",
          ),
          OutlinedTextField(
            title: "Email",
          ),
          OutlinedTextField(
            title: "Phone",
          ),
          OutlinedTextField(
            title: "Position",
          ),
          OutlinedTextField(
            title: "Salary, \$ per hour",
          ),
          OutlinedTextField(
            title: "Date of employment, MM/DD/YYYY",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: OutlinedTextField(
                  hintText: "Start of the workday, 00:00",
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 2,
                child: _timeTypePicker(
                  typeSetter: _workStartTimeSetter,
                  value: _workDayStartTimeType,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: OutlinedTextField(
                  hintText: "End of the workday, 00:00",
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 2,
                child: _timeTypePicker(
                  typeSetter: _workEndTimeSetter,
                  value: _workDayEndTimeType,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeTypePicker(
      {@required Function typeSetter, @required String value}) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: mainBorderColor,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            minWidth: 0,
            alignedDropdown: true,
            child: DropdownButton(
              isDense: true,
              hint: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  child: Text("AM"),
                  value: "AM",
                  onTap: () {},
                ),
                DropdownMenuItem(
                  child: Text("PM"),
                  value: "PM",
                  onTap: () {},
                )
              ],
              onChanged: (v) {
                typeSetter(type: v);
              },
            ),
          ),
        ),
      ),
    );
  }
}

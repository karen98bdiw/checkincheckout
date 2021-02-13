import 'package:flutter/material.dart';

import '../widgets/poor_appbar.dart';
import '../constants/theme.dart';
import '../widgets/outlined_text_field.dart';
import '../widgets/custom_switch.dart';

class EditProfileScreen extends StatelessWidget {
  static final routeName = "EditProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(
        title: "Edit Profile",
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 6.0,
            left: MediaQuery.of(context).size.width * defaultPaddingProcent,
            right: MediaQuery.of(context).size.width * defaultPaddingProcent,
            bottom: 29,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(context: context),
              _form(),
              Notifications(),
              _breaks(),
              _currentSubrscription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header({@required BuildContext context}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: mainOrange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(196, 196, 196, 1),
              image: DecorationImage(
                image: AssetImage("assets/images/profilePic.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: mainOrange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Padding(
      padding: EdgeInsets.only(top: 39),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedTextField(
            title: "Company Name",
          ),
          OutlinedTextField(
            title: "Email",
          ),
          OutlinedTextField(
            title: "Position",
          ),
          OutlinedTextField(
            title: "Street",
          ),
          OutlinedTextField(
            title: "City",
          ),
          OutlinedTextField(
            title: "State",
          ),
          OutlinedTextField(
            title: "Zip Code",
          ),
        ],
      ),
    );
  }

  Widget _breaks() {
    return Padding(
      padding: EdgeInsets.only(top: 50.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dinner time,",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Gray2,
                      ),
                    ),
                    TextSpan(
                      text: " " + "minutes \n per day",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 74,
                height: 46,
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                child: Text(
                  "60",
                  style: TextStyle(
                    color: Gray2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Personal breaks,",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Gray2,
                      ),
                    ),
                    TextSpan(
                      text: " " + "minutes \n per day",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 74,
                height: 46,
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                child: Text(
                  "30",
                  style: TextStyle(
                    color: Gray2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              )
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Absence Penalty,",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Gray2,
                      ),
                    ),
                    TextSpan(
                      text: " " + "minutes \n per day",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 74,
                height: 46,
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                child: Text(
                  "10",
                  style: TextStyle(
                    color: Gray2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(112, 112, 112, 1),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _currentSubrscription() {
    return Padding(
      padding: EdgeInsets.only(top: 89),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var _enabledPushNotes = true;
  var _enabledEmailNotes = true;
  var _enabledSMSNotes = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Notidications",
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
                value: _enabledPushNotes,
                onChanged: (bool val) {
                  setState(() {
                    _enabledPushNotes = val;
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
                value: _enabledEmailNotes,
                onChanged: (bool val) {
                  setState(() {
                    _enabledEmailNotes = val;
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
                value: _enabledPushNotes,
                onChanged: (bool val) {
                  setState(() {
                    _enabledPushNotes = val;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

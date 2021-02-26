import 'package:checkincheckout/router.gr.dart';
import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../../constants/theme.dart';
import '../../widgets/outlined_text_field.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/payment_method_widget.dart';
import '../../widgets/mainButton.dart';

class EditParkingProfileScreen extends StatelessWidget {
  static final routeName = "EditProfileScreen";

  Widget _parkingCost() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 61),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Parking Cost,",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Gray2,
                    )),
                TextSpan(
                    text: "\$ per hour",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Gray2,
                    ))
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
    );
  }

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
              _parkingCost(),
              _subscriptions(context: context),
              _paymentMethod(),
              SizedBox(
                height: 55,
              ),
              MainButton(
                text: "CANCEL",
                isOutlined: true,
                callBack: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 12,
              ),
              MainButton(
                text: "SAVE",
                callBack: () {
                  Navigator.of(context).pop();
                },
              ),
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

  Widget _subscriptions({@required BuildContext context}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Curent subscription",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(34, 49, 66, 1)),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "PRO",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Color.fromRGBO(45, 156, 219, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\$119.9",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(45, 156, 219, 1)),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "per month",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$714.34",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "one-time payment per month \nfor a 6 month subscription,",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(189, 189, 189, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Subscription is active",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: mainOrange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "480\$ SAVE",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Gray6,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            "Next payment in February 10,debited",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(189, 189, 189, 1)),
          ),
          Text(
            "\$719.94",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(189, 189, 189, 1)),
          ),
          SizedBox(
            height: 11,
          ),
          MainButton(
            text: "UNSUBSCRIBE",
            callBack: () {},
            isOutlined: true,
          ),
          SizedBox(
            height: 12,
          ),
          MainButton(
            text: "CHANGE PLAN",
            callBack: () {
              Navigator.of(context).pushNamed(Routes.paymentPlanScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget _paymentMethod() {
    return Padding(
        padding: EdgeInsets.only(top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                PaymnetMethodWidget(
                    title: "Master Card",
                    cardNumber: "**1234",
                    asset: "assets/images/mCard.png")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Add Payment Method",
                style: TextStyle(
                  color: Color.fromRGBO(45, 156, 219, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ));
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
                key: UniqueKey(),
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
                key: UniqueKey(),
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
                key: UniqueKey(),
                value: _enabledSMSNotes,
                onChanged: (bool val) {
                  setState(() {
                    _enabledSMSNotes = val;
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

import 'package:checkincheckout/pages/add_employee_screen.dart';
import 'package:checkincheckout/pages/add_premium_toEmployee._screen.dart';
import 'package:checkincheckout/pages/edit_empolee_screen.dart';
import 'package:checkincheckout/pages/employee_monitoring_screen.dart';
import 'package:checkincheckout/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;

import '../constants/theme.dart';
import '../widgets/mainButton.dart';

class ViewEmployeProfileScreen extends StatefulWidget {
  @override
  _ViewEmployeProfileScreen createState() => _ViewEmployeProfileScreen();
}

class _ViewEmployeProfileScreen extends State<ViewEmployeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _topView(context: context),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width *
                    defaultPaddingProcent, //cant set cross axis to strech
                right: MediaQuery.of(context).size.width *
                    defaultPaddingProcent, //cant set cross axis to strech
                top: 15,
                bottom: 33,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _info(context: context),
                  SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      text: "ADD PREMIUM",
                      callBack: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => AddEmployeePremiumScreen()));
                      }),
                  SizedBox(
                    height: 13,
                  ),
                  MainButton(
                      text: "CALCULATE PAYROLL",
                      callBack: () {
                        Navigator.of(context).pushNamed(Routes.payrollScreen);
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  MainButton(
                      text: "MONITORING",
                      callBack: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => EmployeeMonitoringScreen()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _info({@required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        SizedBox(
          height: 4,
        ),
        Text(
          "+1(111)-11-111",
          style: TextStyle(
            color: Gray2,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Date of employment",
                style: TextStyle(
                  color: Gray2,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: " 21/21/21",
                style: TextStyle(color: Gray2, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Salary",
                style: TextStyle(
                  color: Gray2,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: " 800\$ per moth",
                style: TextStyle(color: Gray2, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Start of the work day",
                style: TextStyle(
                  color: Gray2,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: " 9:00AM",
                style: TextStyle(color: Gray2, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "End of the work day",
                style: TextStyle(
                  color: Gray2,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: " 5:00PM",
                style: TextStyle(color: Gray2, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _topView({@required BuildContext context}) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: ClipPath(
              clipper: MyClipper(context: context),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 375 / 2,
                color: mainBlue,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop("deleteEmployee");
                    },
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
                      image: AssetImage("assets/images/eProfPic.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(EditEmpoleeScreen.routeName);
                  },
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
          ),
          Positioned(
            top: 15,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: mainOrange,
                size: 50,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final BuildContext context;

  MyClipper({@required this.context});

  @override
  Path getClip(Size size) {
    print("${size.height}this is path size");
    var path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, 0),
        width: MediaQuery.of(context).size.width,
        height: 375,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

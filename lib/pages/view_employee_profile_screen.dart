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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topView(context: context),
          SizedBox(
            height: 11,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  defaultPaddingProcent, //cant set cross axis to strech
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 13,
                ),
                MainButton(
                    text: "ADD PREMIUM",
                    callBack: () {
                      Navigator.of(context).pushNamed(Routes.payrollScreen);
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
                MainButton(text: "MONITORING", callBack: () {})
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _info({@required BuildContext context}) {
    return Container();
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
                      Navigator.of(context).pushNamed(Routes.introScreen);
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
                          Icons.arrow_back_ios,
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
                    Navigator.of(context).pushNamed(Routes.editProfileScreen);
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

import 'package:checkincheckout/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;

import '../constants/theme.dart';
import '../widgets/mainButton.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showLocations = false;

  void _toogleShowLocations() {
    setState(() {
      _showLocations = !_showLocations;
    });
  }

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
          _locations(context: context),
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
                    text: "CALCULATE PAYROLL",
                    callBack: () {
                      Navigator.of(context).pushNamed(Routes.payrollScreen);
                    }),
                SizedBox(
                  height: 12,
                ),
                MainButton(
                    text: "ADD NEW LOCATION",
                    callBack: () {
                      Navigator.of(context)
                          .pushNamed(Routes.addNewLocationScreen);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topView({@required BuildContext context}) {
    return Stack(
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
                    Navigator.of(context).pop();
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
                    image: AssetImage("assets/images/profilePic.png"),
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
      ],
    );
  }

  Widget _locations({@required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.63,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.25),
      padding: EdgeInsets.only(
        left: 12,
        top: 4,
        right: 7.5,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: mainBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: _toogleShowLocations,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Company Name",
                  style: TextStyle(
                    color: Gray6,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/dropDown.svg",
                  width: 14,
                  height: 9,
                ),
              ],
            ),
          ),
          _showLocations
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (ctx, i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          "Location $i",
                          style: TextStyle(
                              color: Gray6,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    itemCount: 3,
                  ),
                )
              : Container(),
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

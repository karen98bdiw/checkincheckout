import 'package:checkincheckout/pages/parking/parking_cameras_screen.dart';
import 'package:checkincheckout/pages/parking/parking_monitoring_screen.dart';
import 'package:checkincheckout/pages/parking/parking_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/theme.dart';

class ParkingScreensRoot extends StatefulWidget {
  static final routeName = "ParkingScreensRoot";

  @override
  _ParkingScreensRootState createState() => _ParkingScreensRootState();
}

class _ParkingScreensRootState extends State<ParkingScreensRoot> {
  var _currentIndex = 0;

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    print("$index");
  }

  List<Widget> _screens = [
    ParkingProfileScreen(),
    ParkingMonitoringScreen(),
    ParkingCamerasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ParkingBottomBar(
        changeScreen: changeScreen,
      ),
    );
  }
}

class ParkingBottomBar extends StatefulWidget {
  final Function changeScreen;

  ParkingBottomBar({@required this.changeScreen});

  @override
  _ParkingBottomBarState createState() => _ParkingBottomBarState();
}

class _ParkingBottomBarState extends State<ParkingBottomBar> {
  var currentIndex = 0;
  void setCurentIndex(index) {
    if (currentIndex == null) {
      return;
    }
    setState(() {
      currentIndex = index;
      widget.changeScreen(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        color: mainBlue,
        padding: EdgeInsets.only(
          right: 32,
          left: 27,
          top: 7,
          bottom: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomAppBarItem(
                asset: "assets/icons/profile.svg",
                title: "Profile",
                onTap: setCurentIndex,
                curentIndex: currentIndex,
                index: 0),
            BottomAppBarItem(
                asset: "assets/icons/monitoring.svg",
                title: "Monitoring",
                onTap: setCurentIndex,
                curentIndex: currentIndex,
                index: 1),
            BottomAppBarItem(
                asset: "assets/icons/cameras.svg",
                title: "Cameras",
                onTap: setCurentIndex,
                curentIndex: currentIndex,
                index: 2),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  final String title;
  final String asset;
  final Function onTap;
  final int index;
  final int curentIndex;

  BottomAppBarItem({
    @required this.asset,
    @required this.title,
    @required this.onTap,
    @required this.curentIndex,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            asset,
            color: curentIndex == index ? Colors.black : Colors.white,
            height: curentIndex == index ? 25 : 20,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            title,
            style: TextStyle(
              color: curentIndex == index ? Gray2 : Gray6,
              fontWeight:
                  curentIndex == index ? FontWeight.w700 : FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

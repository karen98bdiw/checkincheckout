import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../constants/theme.dart';

class BottomBar extends StatefulWidget {
  final Function changeScreen;

  BottomBar({@required this.changeScreen});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
            BottomAppBarItem(
                asset: "assets/icons/profile.svg",
                title: "Stuff",
                onTap: setCurentIndex,
                curentIndex: currentIndex,
                index: 3),
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

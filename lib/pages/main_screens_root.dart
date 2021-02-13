import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

import './profile_screen.dart';

class MainScreensRoot extends StatefulWidget {
  static final routeName = "MainScreenRoot";

  @override
  _MainScreensRootState createState() => _MainScreensRootState();
}

class _MainScreensRootState extends State<MainScreensRoot> {
  var _currentIndex = 0;

  void changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    print("$index");
  }

  List<Widget> _screens = [
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomBar(
        changeScreen: changeScreen,
      ),
    );
  }
}

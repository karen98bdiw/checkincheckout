import 'package:flutter/material.dart';

class MainRootScreen extends StatefulWidget {
  static final routeName = "MainRootScreen";

  @override
  _MainRootScreenState createState() => _MainRootScreenState();
}

class _MainRootScreenState extends State<MainRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("root"),
      ),
    );
  }
}

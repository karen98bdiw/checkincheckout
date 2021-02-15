import 'package:flutter/material.dart';

import '../constants/theme.dart';

class MonitoringScreen extends StatelessWidget {
  static final routeName = "MonitoringScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }

  Widget _listTitle({@required BuildContext context}) {
    return Container(
      color: mainBlue,
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: SingleChildScrollView(
        child: Row(
          children: [],
        ),
      ),
    );
  }
}

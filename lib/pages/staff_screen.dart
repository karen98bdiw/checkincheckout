import 'package:flutter/material.dart';

import './staff_screen_base_view.dart';

import './add_employee_screen.dart';
import './edit_empolee_screen.dart';

class StaffScreen extends StatelessWidget {
  Widget _view = StaffBaseView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          print("on generate route called");
          _view = StaffBaseView();
          if (settings.name == AddEmployeeScreen.routeName) {
            _view = AddEmployeeScreen();
          } else {
            if (settings.name == EditEmpoleeScreen.routeName) {
              _view = EditEmpoleeScreen();
            }
          }

          return MaterialPageRoute(builder: (context) => _view);
        },
      ),
    );
  }
}

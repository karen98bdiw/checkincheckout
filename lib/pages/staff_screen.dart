import 'package:flutter/material.dart';

import './staff_screen_base_view.dart';

import './add_employee_screen.dart';
import './edit_empolee_screen.dart';

class StaffScreen extends StatelessWidget {
  Widget _view = StaffBaseView();
  static BuildContext baseScreenContext;
  @override
  Widget build(BuildContext context) {
    baseScreenContext = context;
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          print("on generate route called");
          _view = StaffBaseView();
          print("settings route ${settings.name}");
          if (settings.name == AddEmployeeScreen.routeName) {
            print("add employee openning");
            _view = AddEmployeeScreen();
          } else {
            if (settings.name == EditEmpoleeScreen.routeName) {
              print("edit Employe screen openning");
              _view = EditEmpoleeScreen();
            }
          }

          return MaterialPageRoute(builder: (context) => _view);
        },
      ),
    );
  }
}

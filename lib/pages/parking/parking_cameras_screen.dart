import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import '../../widgets/mainButton.dart';
import '../../widgets/outlined_text_field.dart';

enum ViewState {
  ShowCameras,
  AddCamera,
}

class ParkingCamerasScreen extends StatefulWidget {
  static final routeName = "ParkingCamerasScreen";

  @override
  _ParkingCamerasScreenState createState() => _ParkingCamerasScreenState();
}

class _ParkingCamerasScreenState extends State<ParkingCamerasScreen> {
  int count = 8;
  List<Widget> children = [];

  var _viewState = ViewState.ShowCameras;

  void _showCamerasView() {
    setState(() {
      _viewState = ViewState.ShowCameras;
    });
  }

  @override
  Widget build(BuildContext context) {
    children = [];
    for (var i = 0; i < count; i++) {
      children.add(_camItem(index: i, date: "1.14.2021", time: "7:23 AM"));
    }
    print(children.length);
    //TODO:remove after create model
    return Scaffold(
      appBar: _viewState == ViewState.AddCamera
          ? PoorAppBar(
              title: "Add Camera",
              context: context,
              onBackButtonPressed: _showCamerasView,
            )
          : null,
      body: _viewState == ViewState.AddCamera ? _addCamView() : _shooCamView(),
    );
  }

  Widget _shooCamView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 36,
          right: 36,
          top: 17 + MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
            SizedBox(
              height: 53,
            ),
            MainButton(
                text: "ADD CAMERA",
                callBack: () {
                  setState(() {
                    _viewState = ViewState.AddCamera;
                  });
                }),
            SizedBox(
              height: 53,
            ),
          ],
        ),
      ),
    );
  }

  Widget _addCamView() {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.15,
        left: MediaQuery.of(context).size.width * defaultPaddingProcent,
        right: MediaQuery.of(context).size.width * defaultPaddingProcent,
        bottom: 23,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedTextField(
            title: "Link",
          ),
          MainButton(
              text: "ADD CAMERA",
              callBack: () {
                setState(() {
                  _viewState = ViewState.ShowCameras;
                });
              })
        ],
      ),
    );
  }

  Widget _camItem({
    @required int index,
    @required String date,
    @required String time,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 31),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Camera $index",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/camView.png",
                height: 180,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 17, right: 12),
                color: Color.fromRGBO(51, 51, 51, 0.7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("tracking");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Tracking",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Gray6,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.play_circle_fill,
                            color: mainOrange,
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$date",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Gray6,
                          ),
                        ),
                        Text(
                          "$time",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Gray6,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:flutter/material.dart';

import '../widgets/poor_appbar.dart';

class EmployeeMonitoringScreen extends StatefulWidget {
  static final routeName = "EmplyeeMonitoringScreen";
  @override
  _EmployeeMonitoringScreen createState() => _EmployeeMonitoringScreen();
}

class _EmployeeMonitoringScreen extends State<EmployeeMonitoringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PoorAppBar(
          title: "Brian Smith",
          context: context,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 17,
              ),
              PaginatidList(
                itemsCount: 250,
                dividerStep: 25,
                height: MediaQuery.of(context).size.height * 0.60,
              ),
            ],
          ),
        ));
  }
}

class PaginatidList extends StatefulWidget {
  final int itemsCount;
  final int dividerStep;
  final double height;
  final List<PayrollItem> items;

  PaginatidList(
      {@required this.itemsCount, this.dividerStep, this.height, this.items});

  @override
  _PaginatidListState createState() => _PaginatidListState();
}

class _PaginatidListState extends State<PaginatidList> {
  List<PayrollItem> allItemsList = [];

  List<PayrollItem> inShowList = [];
  var index = 0;
  var enableNumbersCount;
  List<int> enableNumbersList = [];
  List<int> inShowNumbersList = [];

  void next() {
    setState(() {
      if (index > enableNumbersList.length - 2) {
        return;
      }
      index++;
    });
  }

  void scrollEnd() {
    setState(() {
      index = enableNumbersCount - 1;
    });
  }

  void prev() {
    setState(() {
      if (index < 1) {
        return;
      }
      index--;
    });
  }

  @override
  void initState() {
    if (widget.items != null) {
      allItemsList = widget.items;
      return;
    }
    for (var _i = 0; _i <= widget.itemsCount; _i++) {
      allItemsList.add(
        PayrollItem(employee: "john smith", period: "20/20/20", hours: _i),
      );
    }
    super.initState();
  }

  void scrollStart() {
    setState(() {
      index = 0;
    });
  }

  void fillEnabledList() {
    enableNumbersCount = (widget.itemsCount / widget.dividerStep).ceil();
    enableNumbersList = [];
    for (var _i = 1; _i <= enableNumbersCount; _i++) {
      enableNumbersList.add(_i);
    }
    if (index * widget.dividerStep + widget.dividerStep >=
        allItemsList.length) {
      inShowList =
          allItemsList.sublist(index * widget.dividerStep, allItemsList.length);
    } else {
      inShowList = allItemsList.sublist(index * widget.dividerStep,
          index * widget.dividerStep + widget.dividerStep);
    }
  }

  void setIndex({int newIndex}) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    fillEnabledList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _listTitle(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 23,
                            top: 15,
                            bottom: 19,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                inShowList[i].employee,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                inShowList[i].period,
                                style: TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${inShowList[i].hours}",
                                style: TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: Color.fromRGBO(231, 232, 234, 1),
                        ),
                      ],
                    );
                  },
                  itemCount: inShowList.length,
                ),
              ),
            ],
          ),
        ),
        _paginations(),
      ],
    );
  }

  Widget _listTitle() {
    return Container(
      color: mainBlue,
      padding: EdgeInsets.only(top: 20, left: 11, bottom: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Employee",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Period",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Hours",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _paginations() {
    return Container(
      padding: EdgeInsets.only(
        left: 23,
        top: 31,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: mainOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    scrollStart();
                  }),
              SizedBox(
                width: 9,
              ),
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: mainOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    prev();
                  }),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 5,
                right: 17,
              ),
              height: 30,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return PaginationItem(
                      curentIndex: index,
                      itemIndex: enableNumbersList[i],
                      callback: setIndex);
                },
                itemCount: enableNumbersList.length,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: mainOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    next();
                  }),
              SizedBox(
                width: 9,
              ),
              GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: mainOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    scrollEnd();
                  }),
              SizedBox(
                width: 13,
              ),
              Text(
                "${inShowList.length} of ${widget.itemsCount}",
                style: TextStyle(
                  color: Color.fromRGBO(74, 74, 74, 1),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaginationItem extends StatelessWidget {
  final curentIndex;
  final itemIndex;
  final Function callback;

  PaginationItem(
      {@required this.curentIndex,
      @required this.itemIndex,
      @required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback(newIndex: itemIndex - 1);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 17, bottom: 0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            "$itemIndex",
            style: TextStyle(
              color: itemIndex == curentIndex + 1
                  ? mainOrange
                  : Color.fromRGBO(74, 74, 74, 1),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class PayrollItem {
  final String employee;
  final String period;
  final int hours;

  PayrollItem({
    @required this.employee,
    @required this.period,
    @required this.hours,
  });
}

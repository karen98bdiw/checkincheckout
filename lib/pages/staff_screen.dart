import 'package:flutter/material.dart';

import '../constants/theme.dart';
import '../widgets/mainButton.dart';

class StaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 46, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _searchBar(context: context),
          ],
        ),
      ),
    );
  }

  Widget _searchBar({@required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).size.width * defaultPaddingProcent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Search",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Gray1,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: InputBorderColor, width: 1),
                borderRadius: BorderRadius.circular(18),
              ),
              suffix: Icon(
                Icons.search,
                color: Gray2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaginatidList extends StatefulWidget {
  final int itemsCount;
  final int dividerStep;
  final double height;
  final List<EmployeItem> items;

  PaginatidList(
      {@required this.itemsCount, this.dividerStep, this.height, this.items});

  @override
  _PaginatidListState createState() => _PaginatidListState();
}

class _PaginatidListState extends State<PaginatidList> {
  List<EmployeItem> allItemsList = [];

  List<EmployeItem> inShowList = [];
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
        EmployeItem(employee: "john smith", period: "20/20/20", hours: _i),
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
                                allItemsList[i].employee,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                allItemsList[i].period,
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

class EmployeItem {
  final String employee;
  final String period;
  final int hours;

  EmployeItem({
    @required this.employee,
    @required this.period,
    @required this.hours,
  });
}

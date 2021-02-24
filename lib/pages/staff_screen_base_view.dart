import 'package:checkincheckout/pages/add_employee_screen.dart';
import 'package:checkincheckout/pages/edit_empolee_screen.dart';
import 'package:checkincheckout/pages/staff_screen.dart';
import 'package:checkincheckout/pages/view_employee_profile_screen.dart';
import 'package:checkincheckout/widgets/outlined_text_field.dart';
import 'package:flutter/material.dart';

import '../constants/theme.dart';
import '../widgets/mainButton.dart';

class StaffBaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 46, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _searchBar(context: context),
          Padding(
            padding: EdgeInsets.only(left: 22, right: 27),
            child: PaginatidList(
              itemsCount: 250,
              height: MediaQuery.of(context).size.height * 0.47,
              dividerStep: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 22, right: 27),
            child: MainButton(
              text: "ADD EMPLOYEE",
              callBack: () {
                Navigator.pushNamed(context, AddEmployeeScreen.routeName);
              },
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
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
          OutlinedTextField(
            hintText: "Search",
            suffixIcon: Icon(Icons.search),
          )
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
  void openEmployeProfile() {
    Navigator.of(StaffScreen
            .baseScreenContext) //call function with staff screen global context fro going out staff screen
        .push(MaterialPageRoute(builder: (c) => ViewEmployeProfileScreen()))
        .then((value) => print(value));
    //here i will got employee for delete;
  } //function set  empoyee

  void showEmployeDiolog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Gray6,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
              vertical: 24,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(ctx).pop(EditEmpoleeScreen.routeName);
                  },
                  child: Text(
                    "EDIT EMPLOYEE",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Gray1),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(ctx).pop("removeEmployeeScreen");
                  },
                  child: Text(
                    "REMOVE EMPLOYEE",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Gray1),
                  ),
                ),
              ],
            ),
          );
        }).then((value) {
      if (value == EditEmpoleeScreen.routeName) {
        Navigator.of(context).pushNamed(EditEmpoleeScreen.routeName);
      }
    });
  }

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
        EmployeItem(
            name: "John Smith",
            position: "Manager",
            asset: "assets/images/eProfPic.png"),
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
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(inShowList[i].asset),
                            )),
                      ),
                      title: Text(
                        inShowList[i].name,
                        style: TextStyle(
                          color: Gray1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        inShowList[i].position,
                        style: TextStyle(
                          color: Gray1,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: mainOrange,
                          size: 30,
                        ),
                        onPressed: () {
                          showEmployeDiolog();
                        },
                      ),
                      onTap: openEmployeProfile,
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
        top: 31,
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
  final String name;
  final String position;
  final String asset;

  EmployeItem({
    @required this.name,
    @required this.position,
    @required this.asset,
  });
}

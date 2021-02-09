import 'package:flutter/material.dart';

import '../../../utils/const.dart';

import '../signIn_screens/signIn_screen.dart';

class PaymentPlanItemWidget extends StatelessWidget {
  //stay statSess if favorite state will getted from statemanagment
  //convert to statefull if favorite status will getted from widget,

  BuildContext _buildContext;

  final String itemTitle;
  final double monthPrice;
  final double yearPrice;
  final double trialDuration;
  final double saveMoney;

  PaymentPlanItemWidget({
    @required this.itemTitle,
    @required this.monthPrice,
    @required this.saveMoney,
    @required this.trialDuration,
    @required this.yearPrice,
  });

  void _onItemSelect() {
    Navigator.of(_buildContext).pushNamed(SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _itemTop(context: context),
          _itemMiddle(context: context),
          _itemBottom(context: context),
        ],
      ),
    );
  }

  Widget _itemTop({@required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
          color: mainBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              child: Icon(
                Icons.star_border,
                color: Colors.white,
                size: 16,
              ),
              onTap: () {},
            ),
          ),
          Text(
            itemTitle,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.white,
                ),
          ),
          Positioned(
            right: 0,
            bottom: -40,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: mainOrange,
              child: Text(
                "${saveMoney}\$  SAVE",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemMiddle({@required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: mainBorderColor,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "\$ ${monthPrice.toStringAsFixed(2)}",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: mainBlue,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "per moth",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Text(
            "\$ ${yearPrice.toStringAsFixed(2)}",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  borderSide: BorderSide(color: mainBorderColor, width: 1),
                  onPressed: _onItemSelect,
                  child: Text(
                    "SELECT",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: mainGrey,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    // horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "one-time payment per month for",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: " per year",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: " per user",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemBottom({@required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          color: mainOrange,
          child: Text(
            "${trialDuration.toInt()} DAY TRIAL",
            style: TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 18,
          ),
          decoration: BoxDecoration(
              color: mainGrey,
              border: Border.all(
                color: mainBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
          child: Text(
            "PREMIUM",
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

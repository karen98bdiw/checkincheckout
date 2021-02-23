import 'package:checkincheckout/constants/theme.dart';
import 'package:flutter/material.dart';

import '../router.gr.dart';

class PaymentPlanItemWidget extends StatelessWidget {
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
    Navigator.of(_buildContext).pushNamed(Routes.mainScreensRoot);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
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
      color: mainBlue,
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 18,
      ),
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
            itemTitle.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Positioned(
            right: 19,
            top: 12,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: mainOrange,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: Text(
                "${saveMoney.toStringAsFixed(0)}\$  SAVE",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemMiddle({@required BuildContext context}) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 7,
        right: 7,
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
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Color.fromRGBO(48, 48, 48, 1),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "\$ ${yearPrice.toStringAsFixed(2)}",
            overflow: TextOverflow.clip,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(17, 34, 63, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
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
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 3,
                    bottom: 9,
                    left: 24,
                    right: 24,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.right,
                    // maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "one-time payment per month for a",
                          style: TextStyle(
                              color: Color.fromRGBO(162, 162, 162, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: " year's purchase",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: " per user",
                          style: TextStyle(
                            color: Color.fromRGBO(162, 162, 162, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
          padding: EdgeInsets.symmetric(vertical: 4),
          color: mainOrange,
          child: Text(
            "${trialDuration.toInt()} DAY TRIAL",
            style: TextStyle(
              fontSize: 12,
              color: Gray6,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: Color.fromRGBO(225, 225, 225, 1),
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Text(
            "PREMIUM",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(116, 116, 116, 1),
            ),
          ),
        )
      ],
    );
  }
}

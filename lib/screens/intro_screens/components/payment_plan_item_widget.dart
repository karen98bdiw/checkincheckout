import 'package:flutter/material.dart';

import '../../../utils/const.dart';

class PaymentPlanItemWidget extends StatelessWidget {
  final String itemTitle;
  final String mothPrice;
  final String yearPrice;
  final String trialDuration;
  final String saveProcent;

  PaymentPlanItemWidget({
    @required this.itemTitle,
    @required this.mothPrice,
    @required this.saveProcent,
    @required this.trialDuration,
    @required this.yearPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
                  "BEST PRICE",
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
                      "100% FREE",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                  "\$22.99",
                  textAlign: TextAlign.left,
                ),
                Text(
                  "per moth",
                  textAlign: TextAlign.left,
                ),
                Text(
                  "\$377.99",
                  textAlign: TextAlign.right,
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
                        borderSide:
                            BorderSide(color: mainBorderColor, width: 1),
                        onPressed: () {},
                        child: Text("SELECT"),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "one-time payment per month for a year's purchase per user",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: mainOrange,
            child: Text(
              "7 DAY TRIAL",
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
          ),
        ],
      ),
    );
  }
}

import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/payment_plan_item_widget.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

class PaymentPlanScreen extends StatelessWidget {
  static final routeName = "PaymentPlanString";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Select Plan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal:
                MediaQuery.of(context).size.width * defaultPaddingProcent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentPlanItemWidget(
                  itemTitle: "Best Price",
                  monthPrice: 29.99,
                  saveMoney: 100,
                  trialDuration: 7,
                  yearPrice: 379.88),
              SizedBox(
                height: 20,
              ),
              PaymentPlanItemWidget(
                  itemTitle: "Best Price",
                  monthPrice: 29.99,
                  saveMoney: 100,
                  trialDuration: 7,
                  yearPrice: 379.88),
              SizedBox(
                height: 20,
              ),
              PaymentPlanItemWidget(
                  itemTitle: "Best Price",
                  monthPrice: 29.99,
                  saveMoney: 100,
                  trialDuration: 7,
                  yearPrice: 379.88),
            ],
          ),
        ),
      ),
    );
  }
}

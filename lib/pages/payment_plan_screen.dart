import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/payment_plan_item_widget.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

class PaymentPlanScreen extends StatelessWidget {
  static final routeName = "PaymnetPlanScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(
        title: "Select Plan",
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 24,
              left: MediaQuery.of(context).size.width * defaultPaddingProcent,
              right: MediaQuery.of(context).size.width * defaultPaddingProcent,
              bottom: 42),
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

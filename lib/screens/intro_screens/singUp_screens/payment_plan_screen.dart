import 'package:flutter/material.dart';

import '../../widgets/poor_appbar.dart';
import '../components/payment_plan_item_widget.dart';

import '../../../utils/const.dart';

class PaymentPlanScreen extends StatelessWidget {
  static final routeName = "PaymentPlanString";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PoorAppBar(title: "Select Plan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: MediaQuery.of(context).size.width * defaultPaddingProcent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PaymentPlanItemWidget(
                  itemTitle: "Best Price",
                  mothPrice: "29.99",
                  saveProcent: "100",
                  trialDuration: "7",
                  yearPrice: "379.88"),
            ],
          ),
        ),
      ),
    );
  }
}

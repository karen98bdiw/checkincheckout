import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

import '../router.gr.dart';

class PaymentInfoScreen extends StatelessWidget {
  static final routeName = "PaymentInfoScreen";

  BuildContext _buildContext;

  String cardNumber, cardDuration, cardCVV;

  final _formState = GlobalKey<FormState>();

  void _validateForm() {
    _formState.currentState.validate() ? _saveForm() : print("wrong");
  }

  void _saveForm() {
    _formState.currentState.save();
    print(cardNumber + ":" + cardDuration + ":" + cardCVV);
    Navigator.of(_buildContext).pushNamed(Routes.paymentPlanScreen);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
        appBar: PoorAppBar(title: "Payment Information"),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal:
                  MediaQuery.of(context).size.width * defaultPaddingProcent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _fieldTitle(text: "Card Number", context: context),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: "555",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "1111 1111 1111 1111",
                      ),
                      validator: (value) =>
                          value.isEmpty ? "Please write Card Number" : null,
                      onSaved: (newValue) => cardNumber = newValue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            _fieldTitle(text: "Valit Until", context: context),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: "555",
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "MM/YY"),
                              validator: (value) => value.isEmpty
                                  ? "Please write Card Year"
                                  : null,
                              onSaved: (newValue) => cardDuration = newValue,
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            _fieldTitle(text: "CVV", context: context),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: "555",
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "111"),
                              validator: (value) => value.isEmpty
                                  ? "Please write Card CVV Code"
                                  : null,
                              onSaved: (newValue) => cardCVV = newValue,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              MainButton(
                text: "CONFIRM",
                callBack: _validateForm,
              ),
            ],
          ),
        ));
  }

  Widget _fieldTitle({
    @required String text,
    @required BuildContext context,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}

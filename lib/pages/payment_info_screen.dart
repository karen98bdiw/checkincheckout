import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/outlined_text_field.dart';

import '../router.gr.dart';

class PaymentInfoScreen extends StatefulWidget {
  static final routeName = "PaymentInfoScreen";

  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  final _cardNumberCont = TextEditingController();

  final _dateCont = TextEditingController();

  final _cvvCont = TextEditingController();

  final _cardNumberNode = FocusNode();

  final _dateNode = FocusNode();

  final _cvvNode = FocusNode();

  @override
  void dispose() {
    _cardNumberNode.dispose();
    _dateNode.dispose();
    _cvvNode.dispose();
    _cardNumberCont.dispose();
    _dateCont.dispose();
    _cvvCont.dispose();
    super.dispose();
  }

  BuildContext _buildContext;

  String cardNumber, cardDuration, cardCVV;

  final _formState = GlobalKey<FormState>();

  void _validateForm() {
    _formState.currentState.validate() ? _saveForm() : print("wrong");
  }

  void _saveForm() {
    _formState.currentState.save();
    Navigator.of(_buildContext).pushNamed(Routes.paymentPlanScreen);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    var _bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: PoorAppBar(title: "Payment Information", context: context),
      body: LayoutBuilder(
        builder: (ctx, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.only(
                top: 2,
                left: MediaQuery.of(context).size.width * defaultPaddingProcent,
                right:
                    MediaQuery.of(context).size.width * defaultPaddingProcent,
                bottom: _bottomInsets > 0 ? _bottomInsets : 41,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: _formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OutlinedTextField(
                          title: "Card Number",
                          hintText: "1111 1111 1111 1111",
                          controller: _cardNumberCont,
                          focusNode: _cardNumberNode,
                          onSubmitted: (v) {
                            _dateNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedTextField(
                                title: "Valid Until",
                                hintText: "MM/YY",
                                controller: _dateCont,
                                focusNode: _dateNode,
                                onSubmitted: (v) {
                                  _cvvNode.requestFocus();
                                },
                                action: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: OutlinedTextField(
                                title: "CVV",
                                hintText: "111",
                                controller: _cvvCont,
                                focusNode: _cvvNode,
                                onSubmitted: (v) {
                                  _cvvNode.unfocus();
                                },
                              ),
                            ),
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
            ),
          ),
        ),
      ),
    );
  }
}

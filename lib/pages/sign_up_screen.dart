import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/pages/payment_info_screen.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/outlined_text_field.dart';

import '../router.gr.dart';

class SignUpScreen extends StatefulWidget {
  static final routeName = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  BuildContext buildContext;

  var _formState = GlobalKey<FormState>();

  // Map<String, Object> _userDate = {};

  // String _userFirstName = "userFirstName";

  // String _userMiddleName = "userMiddleName";

  // String _userLastName = "userLastName";

  // String _company = "company";

  // String _email = "email";

  // String _phone = "phone";

  // String _position = "position";

  // String _street = "street";

  // String _city = "city";

  // String _state = "state";

  // String _zipCode = "zipCode";

  final _firstNameCont = TextEditingController();

  final _middleNameCont = TextEditingController();

  final _lastNameCont = TextEditingController();

  final _companyNameCont = TextEditingController();

  final _emailCont = TextEditingController();

  final _phoneCont = TextEditingController();

  final _positionCont = TextEditingController();

  final _streetCont = TextEditingController();

  final _cityCont = TextEditingController();

  final _stateCont = TextEditingController();

  final _zipCodeCont = TextEditingController();

  final _firstNameNode = FocusNode();

  final _middleNameNode = FocusNode();
  final _lastNameNode = FocusNode();

  final _companyNameNode = FocusNode();

  final _phoneNode = FocusNode();

  final _positionNode = FocusNode();

  final _cityNode = FocusNode();

  final _streetNode = FocusNode();

  final _stateNode = FocusNode();

  final _emailNode = FocusNode();

  final _zipNode = FocusNode();

  @override
  void dispose() {
    _firstNameCont.dispose();
    _middleNameCont.dispose();
    _lastNameCont.dispose();
    _companyNameCont.dispose();
    _positionCont.dispose();
    _emailCont.dispose();
    _streetCont.dispose();
    _cityCont.dispose();
    _zipCodeCont.dispose();
    _phoneCont.dispose();
    _stateCont.dispose();

    _middleNameNode.dispose();
    _firstNameNode.dispose();
    _lastNameNode.dispose();

    _companyNameNode.dispose();
    _positionNode.dispose();
    _emailNode.dispose();
    _streetNode.dispose();
    _cityNode.dispose();
    _zipNode.dispose();
    _phoneNode.dispose();
    _stateNode.dispose();

    super.dispose();
  }

  void validateForm() {
    _formState.currentState.validate() ? colectData() : print("wrong");
  }

  void colectData() {
    _formState.currentState.save();
    Navigator.of(buildContext).pushNamed(Routes.paymentInfoScreen);
  }

  String _firstNameValidator(v) {
    return null;
  }

  void _saveFormField(value) {
    print(value);
  } //fix

  var s = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (s.hasClients) {
      print("this is called${s.position.pixels}");

      setState(() {
        s.jumpTo(s.position.pixels + 70);
      });
    }
    buildContext = context;
    return Scaffold(
        appBar: PoorAppBar(
          title: "Registration",
          context: context,
        ),
        body: LayoutBuilder(builder: (ct, c) {
          print("bottom${MediaQuery.of(context).viewInsets.bottom}");
          return ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: c.maxWidth, minHeight: c.maxHeight),
              child: SingleChildScrollView(
                controller: s,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 2,
                    left: MediaQuery.of(context).size.width *
                        defaultPaddingProcent,
                    right: MediaQuery.of(context).size.width *
                        defaultPaddingProcent,
                    bottom: 30,
                  ),
                  child: Form(
                    key: _formState,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedTextField(
                                title: "First Name",
                                controller: _firstNameCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                onSubmitted: (v) {
                                  _middleNameNode.requestFocus();
                                },
                                focusNode: _firstNameNode,
                                action: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedTextField(
                                title: "Middle Name",
                                controller: _middleNameCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                focusNode: _middleNameNode,
                                onSubmitted: (v) {
                                  _lastNameNode.requestFocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        OutlinedTextField(
                          title: "Last Name",
                          controller: _lastNameCont,
                          validator: _firstNameValidator,
                          onSaved: _saveFormField,
                          inputType: TextInputType.text,
                          focusNode: _lastNameNode,
                          onSubmitted: (v) {
                            _companyNameNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        OutlinedTextField(
                          title: "Copmany Name",
                          controller: _companyNameCont,
                          validator: _firstNameValidator,
                          onSaved: _saveFormField,
                          inputType: TextInputType.text,
                          focusNode: _companyNameNode,
                          onSubmitted: (v) {
                            _emailNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        OutlinedTextField(
                          title: "Email",
                          controller: _emailCont,
                          validator: _firstNameValidator,
                          onSaved: _saveFormField,
                          inputType: TextInputType.text,
                          onChanged: _firstNameValidator,
                          focusNode: _emailNode,
                          onSubmitted: (v) {
                            _phoneNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        OutlinedTextField(
                          title: "Phone",
                          controller: _phoneCont,
                          validator: _firstNameValidator,
                          onSaved: _saveFormField,
                          inputType: TextInputType.text,
                          focusNode: _phoneNode,
                          onSubmitted: (v) {
                            _positionNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        OutlinedTextField(
                          title: "Position",
                          controller: _positionCont,
                          validator: _firstNameValidator,
                          onSaved: _saveFormField,
                          inputType: TextInputType.text,
                          focusNode: _positionNode,
                          onSubmitted: (v) {
                            _streetNode.requestFocus();
                          },
                          action: TextInputAction.next,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: OutlinedTextField(
                                title: "State",
                                controller: _stateCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                focusNode: _stateNode,
                                onSubmitted: (v) {
                                  _zipNode.requestFocus();
                                },
                                action: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 3,
                              child: OutlinedTextField(
                                title: "City",
                                controller: _cityCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                focusNode: _cityNode,
                                onSubmitted: (v) {
                                  _stateNode.requestFocus();
                                },
                                action: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: OutlinedTextField(
                                title: "Street",
                                controller: _streetCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                focusNode: _streetNode,
                                onSubmitted: (v) {
                                  _cityNode.requestFocus();
                                },
                                action: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: OutlinedTextField(
                                title: "Zip Code",
                                controller: _zipCodeCont,
                                validator: _firstNameValidator,
                                onSaved: _saveFormField,
                                inputType: TextInputType.text,
                                focusNode: _zipNode,
                                onSubmitted: (v) {
                                  _zipNode.unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MainButton(
                          text: "NEXT",
                          callBack: () {
                            Navigator.of(context)
                                .pushNamed(Routes.paymentInfoScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }
}

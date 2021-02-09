import 'package:checkincheckout/constants/theme.dart';
import 'package:checkincheckout/widgets/mainButton.dart';
import 'package:checkincheckout/widgets/poor_appbar.dart';
import 'package:flutter/material.dart';

import 'payment_info_screen.dart';

class SignUpScreen extends StatelessWidget {
  static final routeName = "SignUpScreen";

  BuildContext buildContext;

  var _formState = GlobalKey<FormState>();

  Map<String, Object> _userDate = {};

  //i create a string which will be the keys for my user data colection,every form
  //field will now which data he will collect(we will pas that key in constructor)
  //form in his on save method will add a new pair in userData map;
  //also i add a controller for future usage
  //every for will got a cutom validator for costom checking for every field` email,phone etc.
  //after validating and saving in the end we will have a map with colected user data
  //this format will be usable for creating user and saving in the cloud with JSON format;

  String _userFirstName = "userFirstName";
  String _userMiddleName = "userMiddleName";
  String _userLastName = "userLastName";
  String _company = "company";
  String _email = "email";
  String _phone = "phone";
  String _position = "position";
  String _street = "street";
  String _city = "city";
  String _state = "state";
  String _zipCode = "zipCode";

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

  void validateForm() {
    _formState.currentState.validate() ? colectData() : print("wrong");
  }

  void colectData() {
    _formState.currentState.save();
    _userDate.forEach((key, value) {
      print(key + ":" + value.toString());
    });
    Navigator.of(buildContext).pushNamed(PaymentInfoScreen.routeName);
  }

  bool _firstNameValidator({@required value}) {
    return true;
  }

  //TODO:add validators for every field;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: PoorAppBar(title: "Register"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width * defaultPaddingProcent,
              vertical: 10),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _formField(
                  fieldSetter:
                      _userFirstName, //the key for data that the field will colect;
                  text: "First Name",
                  context: context,
                  controller: _firstNameCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _userMiddleName,
                  text: "Middle Name",
                  context: context,
                  controller: _middleNameCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _userLastName,
                  text: "Last Name",
                  context: context,
                  controller: _lastNameCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _company,
                  text: "Company Name",
                  context: context,
                  controller: _companyNameCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                    fieldSetter: _email,
                    text: "Email",
                    context: context,
                    controller: _emailCont,
                    validator: _firstNameValidator,
                    inputType: TextInputType.emailAddress),
                _formField(
                  fieldSetter: _phone,
                  text: "Phone",
                  context: context,
                  controller: _phoneCont,
                  validator: _firstNameValidator,
                  inputType: TextInputType.phone,
                ),
                _formField(
                  fieldSetter: _position,
                  text: "Position",
                  context: context,
                  controller: _positionCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _street,
                  text: "Street",
                  context: context,
                  controller: _streetCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _city,
                  text: "City",
                  context: context,
                  controller: _cityCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _state,
                  text: "State",
                  context: context,
                  controller: _stateCont,
                  validator: _firstNameValidator,
                ),
                _formField(
                  fieldSetter: _zipCode,
                  text: "ZipCode",
                  context: context,
                  controller: _zipCodeCont,
                  validator: _firstNameValidator,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                MainButton(
                  text: "NEXT",
                  callBack: validateForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formField({
    @required String text,
    @required BuildContext context,
    @required TextEditingController controller,
    @required Function validator, //function for validate will return bool,
    @required String fieldSetter, //key for colecting
    TextInputType inputType,
  }) {
    controller.value = TextEditingValue(text: "sss");
    var inValidText = "Please Write" + " " + text;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: inputType == null ? TextInputType.text : inputType,
            onSaved: (newValue) => _userDate[fieldSetter] = newValue,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: text,
            ),
            validator: (value) {
              return value.isEmpty
                  ? inValidText
                  : validator(value: value) //custom validator for every field
                      ? null
                      : inValidText;
            },
          ),
        ],
      ),
    );
  }
}

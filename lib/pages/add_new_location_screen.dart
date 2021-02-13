import 'package:flutter/material.dart';

import '../widgets/mainButton.dart';
import '../widgets/outlined_text_field.dart';
import '../constants/theme.dart';
import '../widgets/poor_appbar.dart';

class AddNewLocationScreen extends StatefulWidget {
  static final routeName = "AddNewLocationScreen";
  @override
  _AddNewLocationScreenState createState() => _AddNewLocationScreenState();
}

class _AddNewLocationScreenState extends State<AddNewLocationScreen> {
  BuildContext buildContext;

  var _formState = GlobalKey<FormState>();

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
    Navigator.of(buildContext).pop();
  }

  String _firstNameValidator(v) {
    return null;
  }

  void _saveFormField(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: PoorAppBar(
        title: "Registration",
        context: context,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              top: 2,
              left: MediaQuery.of(context).size.width * defaultPaddingProcent,
              right: MediaQuery.of(context).size.width * defaultPaddingProcent,
              bottom: 31),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedTextField(
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
                OutlinedTextField(
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
                OutlinedTextField(
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
                OutlinedTextField(
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
                OutlinedTextField(
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
                OutlinedTextField(
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
                SizedBox(
                  height: 47,
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
}

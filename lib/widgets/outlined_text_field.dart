import 'package:flutter/material.dart';
import '../constants/theme.dart';

class OutlinedTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String errorText;
  final TextInputType inputType;
  final Function validator;
  final Function onSaved;
  final Function onSubmitted;
  final Function onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction action;
  final bool filled;
  final Color fillColor;
  final bool borderEnabled;
  final Color titleColor;
  final bool obscureText;

  OutlinedTextField({
    Key key,
    this.title,
    this.hintText,
    this.errorText,
    this.controller,
    this.inputType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.action,
    this.fillColor,
    this.filled,
    this.borderEnabled,
    this.titleColor,
    this.obscureText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var invalidText = errorText == null || errorText == ""
        ? title == null
            ? ""
            : "Please Write" + " " + title
        : errorText;
    print("invalidtext : $invalidText");

    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: titleColor != null ? titleColor : Gray1,
                  ),
                )
              : Container(),
          SizedBox(
            height: 7,
          ),
          TextFormField(
            obscureText: obscureText == null ? false : true,
            onFieldSubmitted: onSubmitted,
            textInputAction: action,
            enabled: true,
            maxLines: 1,
            style: TextStyle(
                //TODO:;
                ),
            keyboardType: inputType == null ? TextInputType.text : inputType,
            onSaved: (newValue) {
              onSaved != null ? onSaved(newValue) : print("not gived on save");
            },
            focusNode: focusNode,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: filled,
              fillColor: fillColor,
              contentPadding: EdgeInsets.only(
                top: 13,
                bottom: 14,
              ),
              hintText: hintText != null ? hintText : title,
              hintStyle: TextStyle(
                color: Gray5,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderSide: borderEnabled == null
                    ? BorderSide(color: InputBorderColor, width: 1)
                    : borderEnabled
                        ? BorderSide(color: InputBorderColor, width: 1)
                        : BorderSide.none,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            validator: (value) {
              return validator == null
                  ? value.isEmpty
                      ? invalidText
                      : null
                  : validator(value);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddTextField extends StatelessWidget {
  AddTextField({
    Key? key,
    this.insitialValue,
    required this.hinttext,
    this.onchange,
    required this.onSaved,
  }) : super(key: key);

  String? insitialValue;
  String hinttext;
  void Function(String?)? onchange;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: insitialValue,
      decoration: InputDecoration(
        hintText: hinttext,
        border: InputBorder.none,
      ),
      onChanged: onchange,
      onSaved: onSaved,
    );
  }
}

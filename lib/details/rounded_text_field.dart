import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udemy_sns/details/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.keybordType,
    required this.onChanged,
    required this.controller,
    required this.color,
    required this.borederColor,
    required this.shadowColor,
    required this.hintText
  }) : super(key: key);
  final TextInputType keybordType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Color color;
  final Color borederColor;
  final Color shadowColor;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borederColor: borederColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: keybordType,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(hintText: hintText, hintStyle: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

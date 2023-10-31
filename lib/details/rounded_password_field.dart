
import 'package:flutter/material.dart';
import 'package:flutter_udemy_sns/details/text_field_container.dart';

import 'package:flutter_udemy_sns/constants/strings.dart';

class RoundedPasswordField extends StatelessWidget {

  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.passwordEditingController,
    required this.obuscureText,
    required this.toggleObscureText,
    required this.color,
    required this.shadowColor,
    required this.borderColor,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController passwordEditingController;
  final bool obuscureText;
  final void Function()? toggleObscureText;
  final Color color, borderColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borederColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        controller: passwordEditingController,
        obscureText: obuscureText,
        decoration: InputDecoration(
            suffix: InkWell (
              child: obuscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              onTap: toggleObscureText,
            ),
          hintText: passwordText,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),
    );
  }
}
//flutter
import 'package:flutter/material.dart';

//packages


class TextFieldContainer extends StatelessWidget{
  const TextFieldContainer({Key? key, required this.color, required this.borederColor, required this.child, required this.shadowColor
  }) : super(key: key);
  final Color color;
  final Color borederColor;
  final Widget child;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: borederColor,
          ),
          boxShadow: [BoxShadow(
            color: shadowColor,
            blurRadius: 8.0,
            offset: Offset(0,0),
          )],
          color: color,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: child,
      ),
    );
  }
}
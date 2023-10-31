import 'package:flutter/cupertino.dart';
import 'package:flutter_udemy_sns/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(homeText),
    );
  }
}
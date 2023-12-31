
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//constants
import 'package:flutter_udemy_sns/constants/bottom_navigation_bar_elements.dart';
//model
import 'package:flutter_udemy_sns/models/sns_bottom_navigation_bar_model.dart';

class SNSBottomNavigationBar extends StatelessWidget {
  const SNSBottomNavigationBar({
    Key? key,
    required this.snsBottomNavigationBarModel
  }) : super(key: key);

  final SnsBottomNavigationBarModel snsBottomNavigationBarModel;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottonNavigationBarElementes,
      currentIndex: snsBottomNavigationBarModel.currentIndex,
      onTap: (index) => snsBottomNavigationBarModel.onTabTapped(index: index),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_udemy_sns/constants/strings.dart';

final List<BottomNavigationBarItem> bottonNavigationBarElementes = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: homeText
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: searchText
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: profileText
  ),
];
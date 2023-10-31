//flutter
import 'package:flutter/material.dart';
//packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_udemy_sns/details/sns_bottom_navigation_bar.dart';
//costants
import 'package:flutter_udemy_sns/constants/ints.dart';

final snsBottomNavigationBarProvider = ChangeNotifierProvider((ref) => SnsBottomNavigationBarModel());

class SnsBottomNavigationBarModel extends ChangeNotifier{
  int currentIndex = 0;
  late PageController pageController;

  SnsBottomNavigationBarModel() {
    init();
  }

  void init() {
    pageController = PageController(
      initialPage: currentIndex
    );
    print("===============loading3===============");
        notifyListeners();
  }

  void onPageChange({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped({required int index}) {
    pageController.animateToPage(
        index,
        duration: Duration(microseconds: pageAnimationDuration),
        curve: Curves.easeIn,
    );
  }

  void setPageController () {
    pageController = PageController(
      initialPage: currentIndex
    );
    notifyListeners();
  }

}
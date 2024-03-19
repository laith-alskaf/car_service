import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomNavigationEnum { parking, billing, home,history,repair }

class MainController extends GetxController {
  // RxInt lengthList = 0.obs;
  // RxInt currentIndex = 1.obs;
  var selected = BottomNavigationEnum.home.obs;
  PageController pageViewController = PageController(initialPage: 2);

  void animatedToPage(selectedEnum, pageNumber) {
    if(selected.value!=selectedEnum){
      pageNumber;
      pageViewController.animateToPage(
        pageNumber,
        duration: const Duration(
          microseconds: 500,
        ),
        curve: Curves.bounceIn,
      );

      selected.value = selectedEnum;
    }

  }
}

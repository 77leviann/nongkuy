part of '../widgets/custom_bottom_navigation_bar_widget.dart';

class CustomBottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
}

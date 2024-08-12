import 'package:ecom/features/authentications/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///varidables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///update current index when page scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  ///jump to specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }


  ///update current index and jump to next page
  void nextPage() {
    // int nextPageIndex = currentPageIndex.value + 1;
    // if (nextPageIndex < 3) {
    //   currentPageIndex.value = nextPageIndex;
    //   pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    // } else {
    //   Get.offAll(const LoginScreen());
    // }
    if(currentPageIndex.value == 2){
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    }

    else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///update current index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(2 , duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}

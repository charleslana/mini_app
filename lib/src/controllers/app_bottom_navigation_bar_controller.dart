import 'package:get/get.dart';

class AppBottomNavigationBarController extends GetxController {
  RxInt currentIndex = 2.obs;

  void changeView(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
    }
  }
}

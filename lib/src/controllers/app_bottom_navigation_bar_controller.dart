import 'package:get/get.dart';
import 'package:mini_app/src/controllers/collection_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';

class AppBottomNavigationBarController extends GetxController {
  RxInt currentIndex = 2.obs;
  CollectionController collectionController = Get.put(CollectionController());
  LandingController landingController = Get.find();

  void changeView(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
      if (index == 0) {
        collectionController.tabController.index = 0;
        clearTabHero();
        clearTabMinis();
      }
    }
  }

  void clearTabHero() {
    if (landingController.filterHeroList.length !=
        landingController.appModel.heroes.length) {
      collectionController.heroTextEditingController.clear();
      landingController.filterHeroList
        ..clear()
        ..addAll(landingController.appModel.heroes);
    }
  }

  void clearTabMinis() {
    if (landingController.filterMiniList.length !=
        landingController.appModel.minis.length) {
      collectionController
        ..miniTextEditingController.clear()
        ..filterIndex.value = 0;
      landingController.filterMiniList
        ..clear()
        ..addAll(landingController.appModel.minis);
    }
  }
}

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
    if (landingController.filterHeroesList.length !=
        landingController.miniModel.heroes.length) {
      collectionController.heroTextEditingController.clear();
      landingController.filterHeroesList
        ..clear()
        ..addAll(landingController.miniModel.heroes);
    }
  }

  void clearTabMinis() {
    if (landingController.filterMinisList.length !=
        landingController.miniModel.minis.length) {
      collectionController
        ..miniTextEditingController.clear()
        ..filterIndex.value = 0;
      landingController.filterMinisList
        ..clear()
        ..addAll(landingController.miniModel.minis);
    }
  }
}

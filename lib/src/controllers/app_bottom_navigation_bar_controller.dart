import 'package:get/get.dart';
import 'package:mini_app/src/controllers/collection_controller.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';

class AppBottomNavigationBarController extends GetxController {
  RxInt currentIndex = 2.obs;
  CollectionController collectionController = Get.put(CollectionController());
  FavoritesController favoritesController = Get.put(FavoritesController());

  void changeView(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
      if (index == 0) {
        collectionController.tabController.index = 0;
        collectionController
          ..clearTabHero()
          ..clearTabMinis();
      }
      if (index == 2) {
        favoritesController.tabController.index = 0;
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';

class HeroDetailsController extends GetxController {
  RxInt currentLevel = 1.obs;
  int maxLevel = 10;
  LandingController landingController = Get.find();
  FavoritesController favoritesController = Get.put(FavoritesController());
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fecthFavorites();
    super.onInit();
  }

  void changeLevel(int level) {
    if (level != currentLevel.value) {
      currentLevel.value = level;
    }
  }

  void fecthFavorites() {
    favoritesController.existFavorite(FavoriteMinisModel(
        index: landingController.heroIndex.value, type: TypeFavorite.hero));
  }

  void scrollToUp() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }
}

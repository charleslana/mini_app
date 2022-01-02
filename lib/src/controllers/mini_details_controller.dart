import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';

class MiniDetailsController extends GetxController {
  RxInt currentStar = 0.obs;
  int maxStar = 3;
  LandingController landingController = Get.find();
  FavoritesController favoritesController = Get.put(FavoritesController());
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchFavorites();
    super.onInit();
  }

  void changeStar(int star) {
    if (star != currentStar.value) {
      currentStar.value = star;
    }
  }

  void fetchFavorites() {
    favoritesController.existFavorite(FavoriteMinisModel(
        index: landingController.miniIndex.value, type: TypeFavorite.mini));
  }

  void scrollToUp() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class FavoritesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollControllerDecks = ScrollController();
  final ScrollController scrollControllerMinis = ScrollController();
  FavoriteService favoriteService = FavoriteService();
  List<FavoriteMiniModel> listMinisFavorites = <FavoriteMiniModel>[].obs;
  List<FavoriteDeckModel> listDecksFavorites = <FavoriteDeckModel>[].obs;
  RxBool isMiniFavorite = false.obs;
  LandingController landingController = Get.find();

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
    fecthFavorites();
    super.onInit();
  }

  bool existFavorite(FavoriteMiniModel favorite) {
    final List<FavoriteMiniModel> existFavorite = listMinisFavorites
        .where((element) =>
            element.type == favorite.type && element.index == favorite.index)
        .toList();
    if (existFavorite.isNotEmpty) {
      isMiniFavorite.value = true;
      return true;
    }
    isMiniFavorite.value = false;
    return false;
  }

  void fecthFavorites() {
    final FavoriteModel loadFavorite = favoriteService.loadFromBox();
    listMinisFavorites.addAll(loadFavorite.favorites);
  }

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          scrollToUp(scrollControllerDecks);
          break;
        case 1:
          scrollToUp(scrollControllerMinis);
          break;
      }
    }
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void toggleFavorite(FavoriteMiniModel favorite) {
    if (existFavorite(favorite)) {
      final int index = listMinisFavorites.indexWhere((element) =>
          element.type == favorite.type && element.index == favorite.index);
      listMinisFavorites.removeAt(index);
      isMiniFavorite.value = false;
      favoriteService.saveToBox(FavoriteModel(favorites: listMinisFavorites));
      return;
    }
    listMinisFavorites.add(favorite);
    favoriteService.saveToBox(FavoriteModel(favorites: listMinisFavorites));
    isMiniFavorite.value = true;
  }
}

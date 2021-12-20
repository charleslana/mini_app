import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class FavoritesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController decksScrollController = ScrollController();
  final ScrollController minisScrollController = ScrollController();
  FavoriteService favoriteService = FavoriteService();
  List<FavoriteMiniModel> listMinisFavorites = <FavoriteMiniModel>[].obs;
  List<FavoriteDeckModel> listDecksFavorites = <FavoriteDeckModel>[].obs;
  RxBool isMiniFavorite = false.obs;

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

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          scrollToUp(decksScrollController);
          break;
        case 1:
          scrollToUp(minisScrollController);
          break;
      }
    }
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
    listDecksFavorites.addAll(loadFavorite.favoritesDeck);
  }

  void removeFavorite(FavoriteMiniModel favorite) {
    final int index = listMinisFavorites.indexWhere((element) =>
        element.type == favorite.type && element.index == favorite.index);
    listMinisFavorites.removeAt(index);
    isMiniFavorite.value = false;
    saveAllFavorite();
  }

  void removeFavoriteDeck(int index) {
    listDecksFavorites.removeAt(index);
    saveAllFavorite();
  }

  void saveAllFavorite() {
    favoriteService.saveToBox(FavoriteModel(
      favorites: listMinisFavorites,
      favoritesDeck: listDecksFavorites,
    ));
  }

  void saveFavoriteDeck(FavoriteDeckModel favoriteDeckModel) {
    listDecksFavorites.add(favoriteDeckModel);
    saveAllFavorite();
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void toggleFavorite(FavoriteMiniModel favorite) {
    if (existFavorite(favorite)) {
      removeFavorite(favorite);
      return;
    }
    listMinisFavorites.add(favorite);
    saveAllFavorite();
    isMiniFavorite.value = true;
  }

  void updateFavoriteDeck(int index, FavoriteDeckModel favoriteDeckModel) {
    listDecksFavorites[index] = favoriteDeckModel;
    saveAllFavorite();
  }
}

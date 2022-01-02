import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/models/deck_model.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/deck_service.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class FavoritesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController decksScrollController = ScrollController();
  final ScrollController minisScrollController = ScrollController();
  FavoriteService favoriteService = FavoriteService();
  DeckService deckService = DeckService();
  List<FavoriteMinisModel> listFavorites = <FavoriteMinisModel>[].obs;
  List<DeckMinisModel> listDecks = <DeckMinisModel>[].obs;
  RxBool isMiniFavorite = false.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
    fecthFavorites();
    fecthDecks();
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

  void addDeck(DeckMinisModel deckMinisModel) {
    listDecks.add(deckMinisModel);
    saveDeck();
  }

  bool existFavorite(FavoriteMinisModel favorite) {
    final List<FavoriteMinisModel> existFavorite = listFavorites
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

  void fecthDecks() {
    final DeckModel loadDeck = deckService.loadFromBox();
    listDecks.addAll(loadDeck.decks);
  }

  void fecthFavorites() {
    final FavoriteModel loadFavorite = favoriteService.loadFromBox();
    listFavorites.addAll(loadFavorite.favorites);
  }

  void removeDeck(int index) {
    listDecks.removeAt(index);
    saveDeck();
  }

  void removeFavorite(FavoriteMinisModel favorite) {
    final int index = listFavorites.indexWhere((element) =>
        element.type == favorite.type && element.index == favorite.index);
    listFavorites.removeAt(index);
    isMiniFavorite.value = false;
    saveFavorite();
  }

  void saveDeck() {
    deckService.saveToBox(DeckModel(
      decks: listDecks,
    ));
  }

  void saveFavorite() {
    favoriteService.saveToBox(FavoriteModel(
      favorites: listFavorites,
    ));
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void toggleFavorite(FavoriteMinisModel favorite) {
    if (existFavorite(favorite)) {
      removeFavorite(favorite);
      return;
    }
    listFavorites.add(favorite);
    saveFavorite();
    isMiniFavorite.value = true;
  }

  void updateDeck(int index, DeckMinisModel deckMinisModel) {
    listDecks[index] = deckMinisModel;
    saveDeck();
  }
}

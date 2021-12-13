import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class FavoritesController extends GetxController {
  FavoriteService favoriteService = FavoriteService();
  List<Favorite> listFavorites = <Favorite>[].obs;
  RxBool isFavorite = false.obs;
  LandingController landingController = Get.find();

  @override
  void onInit() {
    fecthFavorites();
    super.onInit();
  }

  bool existFavorite(Favorite favorite) {
    final List<Favorite> existFavorite = listFavorites
        .where((element) =>
            element.type == favorite.type && element.index == favorite.index)
        .toList();
    if (existFavorite.isNotEmpty) {
      isFavorite.value = true;
      return true;
    }
    isFavorite.value = false;
    return false;
  }

  void fecthFavorites() {
    final FavoriteModel loadFavorite = favoriteService.loadFromBox();
    listFavorites.addAll(loadFavorite.favorites);
  }

  void toggleFavorite(Favorite favorite) {
    if (existFavorite(favorite)) {
      final int index = listFavorites.indexWhere((element) =>
          element.type == favorite.type && element.index == favorite.index);
      listFavorites.removeAt(index);
      isFavorite.value = false;
      favoriteService.saveToBox(FavoriteModel(favorites: listFavorites));
      return;
    }
    listFavorites.add(favorite);
    favoriteService.saveToBox(FavoriteModel(favorites: listFavorites));
    isFavorite.value = true;
  }
}

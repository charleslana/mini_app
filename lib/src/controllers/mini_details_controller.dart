import 'package:get/get.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class MiniDetailsController extends GetxController {
  RxInt currentStar = 0.obs;
  int maxStar = 3;
  FavoriteService favoriteService = FavoriteService();
  List<Favorite> listFavorites = [];
  RxBool isFavorite = false.obs;
  LandingController landingController = Get.find();
  FavoritesController favoritesController = Get.put(FavoritesController());

  @override
  void onInit() {
    fecthFavorites();
    super.onInit();
  }

  void changeStar(int star) {
    if (star != currentStar.value) {
      currentStar.value = star;
    }
  }

  void fecthFavorites() {
    favoritesController.existFavorite(Favorite(
        index: landingController.miniIndex.value, type: TypeFavorite.mini));
  }
}

import 'package:get/get.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/services/favorite_service.dart';

class HeroDetailsController extends GetxController {
  RxInt currentLevel = 1.obs;
  int maxLevel = 10;
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

  void changeLevel(int level) {
    if (level != currentLevel.value) {
      currentLevel.value = level;
    }
  }

  void fecthFavorites() {
    favoritesController.existFavorite(Favorite(
        index: landingController.heroIndex.value, type: TypeFavorite.hero));
  }
}

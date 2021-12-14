import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/models/mini_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';
import 'package:mini_app/src/services/mini_service.dart';
import 'package:mini_app/src/services/name_service.dart';
import 'package:mini_app/src/utils/utils.dart';

class LandingController extends GetxController {
  Client client = Client();
  late MiniModel miniModel;
  RxList<Minis> filterMinisList = <Minis>[].obs;
  RxList<Heroes> filterHeroesList = <Heroes>[].obs;
  RxInt heroIndex = 0.obs;
  RxInt miniIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString textError = ''.obs;
  bool isNewVersion = false;
  final RxString _name = ''.obs;
  NameService nameService = NameService();
  RxBool isOk = false.obs;

  @override
  void onInit() {
    fecthBoxName();
    fetchMinis();
    super.onInit();
  }

  String get name => _name.value;

  set name(String newName) {
    _name.value = newName;
    nameService.saveToBox(newName);
  }

  void addHeroList(String text) {
    filterHeroesList.clear();
    if ('languageCode'.tr == 'en') {
      filterHeroesList.addAll(miniModel.heroes
          .where((hero) => Utils.removeDiacritics(hero.name.enUs.toLowerCase())
              .contains(Utils.removeDiacritics(text.toLowerCase())))
          .toList());
      return;
    }
    filterHeroesList.addAll(miniModel.heroes
        .where((hero) => Utils.removeDiacritics(hero.name.ptBr.toLowerCase())
            .contains(Utils.removeDiacritics(text.toLowerCase())))
        .toList());
  }

  void addMiniList(String text) {
    filterMinisList.clear();
    if ('languageCode'.tr == 'en') {
      filterMinisList.addAll(miniModel.minis
          .where((mini) => Utils.removeDiacritics(mini.name.enUs.toLowerCase())
              .contains(Utils.removeDiacritics(text.toLowerCase())))
          .toList());
      return;
    }
    filterMinisList.addAll(miniModel.minis
        .where((mini) => Utils.removeDiacritics(mini.name.ptBr.toLowerCase())
            .contains(Utils.removeDiacritics(text.toLowerCase())))
        .toList());
  }

  void checkAppVersion(MiniModel miniModel) {
    if (miniModel.version != ConfigConstants.version) {
      isNewVersion = true;
      throw Exception('Please update your app.');
    }
  }

  void checkError(Object error) {
    if (isNewVersion) {
      textError.value = 'landingUpdate'.tr;
    } else {
      textError.value = 'landingError'.tr;
    }
    isError.value = true;
    throw Exception(error);
  }

  void checkName() {
    if (!isError.value) {
      if (name.isEmpty) {
        Utils().dialogName();
        isOk.value = true;
        return;
      }
      Get.toNamed<dynamic>(AppRoutes.home);
    }
  }

  void fecthBoxName() {
    final String? boxName = nameService.loadFromBox();
    if (boxName != null) {
      name = boxName;
    }
  }

  Future<void> fetchMinis() async {
    try {
      await MiniService(client).getMini().then((miniModel) {
        if (miniModel != null) {
          checkAppVersion(miniModel);
          setMiniModel(miniModel);
          checkName();
        }
      });
    } catch (error) {
      checkError(error);
    } finally {
      isLoading.value = false;
    }
  }

  void filterMini(int value) {
    if (value == 1) {
      filterMinisList
        ..clear()
        ..addAll(miniModel.minis);
      return;
    }
    filterMinisList
      ..clear()
      ..addAll(
          miniModel.minis.where((mini) => mini.elixirCost == value).toList());
  }

  void searchHero(String text) {
    if (text.isEmpty) {
      filterHeroesList
        ..clear()
        ..addAll(miniModel.heroes);
      return;
    }
    addHeroList(text);
  }

  void searchMini(String text) {
    if (text.isEmpty) {
      filterMinisList
        ..clear()
        ..addAll(miniModel.minis);
      return;
    }
    addMiniList(text);
  }

  void setMiniModel(MiniModel newMiniModel) {
    miniModel = newMiniModel;
    filterMinisList.addAll(miniModel.minis);
    filterHeroesList.addAll(miniModel.heroes);
  }
}

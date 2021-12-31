import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';
import 'package:mini_app/src/services/app_service.dart';
import 'package:mini_app/src/services/name_service.dart';
import 'package:mini_app/src/utils/utils.dart';

class LandingController extends GetxController {
  Client client = Client();
  late AppModel appModel;
  RxList<MiniModel> filterMiniList = <MiniModel>[].obs;
  RxList<HeroModel> filterHeroList = <HeroModel>[].obs;
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
    fetchBoxName();
    fetchApp();
    super.onInit();
  }

  String get name => _name.value;

  set name(String newName) {
    _name.value = newName;
    nameService.saveToBox(newName);
  }

  void addHeroList(String text) {
    filterHeroList.clear();
    if ('languageCode'.tr == 'en') {
      filterHeroList.addAll(appModel.heroes
          .where((hero) => Utils.removeDiacritics(hero.name.enUs.toLowerCase())
              .contains(Utils.removeDiacritics(text.toLowerCase())))
          .toList());
      return;
    }
    filterHeroList.addAll(appModel.heroes
        .where((hero) => Utils.removeDiacritics(hero.name.ptBr.toLowerCase())
            .contains(Utils.removeDiacritics(text.toLowerCase())))
        .toList());
  }

  void addMiniList(String text) {
    filterMiniList.clear();
    if ('languageCode'.tr == 'en') {
      filterMiniList.addAll(appModel.minis
          .where((mini) => Utils.removeDiacritics(mini.name.enUs.toLowerCase())
              .contains(Utils.removeDiacritics(text.toLowerCase())))
          .toList());
      return;
    }
    filterMiniList.addAll(appModel.minis
        .where((mini) => Utils.removeDiacritics(mini.name.ptBr.toLowerCase())
            .contains(Utils.removeDiacritics(text.toLowerCase())))
        .toList());
  }

  void checkAppVersion(AppModel appModel) {
    if (appModel.version != ConfigConstants.version) {
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

  Future<void> fetchApp() async {
    try {
      await AppService(client).getApp().then((appModel) {
        if (appModel != null) {
          checkAppVersion(appModel);
          setMiniModel(appModel);
          checkName();
        }
      });
    } catch (error) {
      checkError(error);
    } finally {
      isLoading.value = false;
    }
  }

  void fetchBoxName() {
    final String? boxName = nameService.loadFromBox();
    if (boxName != null) {
      name = boxName;
    }
  }

  void filterMini(int value) {
    if (value == 1) {
      filterMiniList
        ..clear()
        ..addAll(appModel.minis);
      return;
    }
    filterMiniList
      ..clear()
      ..addAll(
          appModel.minis.where((mini) => mini.elixirCost == value).toList());
  }

  void searchHero(String text) {
    if (text.isEmpty) {
      filterHeroList
        ..clear()
        ..addAll(appModel.heroes);
      return;
    }
    addHeroList(text);
  }

  void searchMini(String text) {
    if (text.isEmpty) {
      filterMiniList
        ..clear()
        ..addAll(appModel.minis);
      return;
    }
    addMiniList(text);
  }

  void setMiniModel(AppModel appModel) {
    this.appModel = appModel;
    filterMiniList.addAll(appModel.minis);
    filterHeroList.addAll(appModel.heroes);
  }
}

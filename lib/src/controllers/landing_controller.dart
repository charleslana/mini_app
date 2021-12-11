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
  RxList<Minis> miniList = <Minis>[].obs;
  RxList<Minis> filterMiniList = <Minis>[].obs;
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
    nameService.saveNameToBox(newName);
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
    final String? boxName = nameService.loadNameFromBox();
    if (boxName != null) {
      name = boxName;
    }
  }

  Future<void> fetchMinis() async {
    try {
      await MiniService(client).getMini().then((miniModel) {
        if (miniModel != null) {
          checkAppVersion(miniModel);
          setMinis(miniModel);
          checkName();
        }
      });
    } catch (error) {
      checkError(error);
    } finally {
      isLoading.value = false;
    }
  }

  void setMinis(MiniModel miniModel) {
    miniList.value = miniModel.minis;
    filterMiniList.addAll(miniList);
  }
}

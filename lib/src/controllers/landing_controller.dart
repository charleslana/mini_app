import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/models/mini_model.dart';
import 'package:mini_app/src/services/mini_service.dart';

class LandingController extends GetxController {
  Client client = Client();
  RxList<Minis> miniList = <Minis>[].obs;
  RxList<Minis> filterMiniList = <Minis>[].obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString textError = ''.obs;
  RxBool isNewVersion = false.obs;

  @override
  void onInit() {
    fetchMinis();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchMinis() async {
    try {
      await MiniService(client).getMini().then((miniService) {
        if (miniService != null) {
          if (miniService.version != ConfigConstants.version) {
            isNewVersion.value = true;
            throw Exception('Please update your app.');
          }
          miniList.value = miniService.minis;
          filterMiniList.addAll(miniList);
        }
      });
    } catch (error) {
      if (isNewVersion.value) {
        textError.value = 'landingUpdate'.tr;
      } else {
        textError.value = 'landingError'.tr;
      }
      isError.value = true;
      throw Exception(error);
    } finally {
      isLoading.value = false;
    }
  }
}

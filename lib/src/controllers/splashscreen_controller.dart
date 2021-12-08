import 'dart:async';

import 'package:get/get.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offNamed<dynamic>(AppRoutes.landing),
    );
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(ImageConstants.logo),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'splashscreenTitle'.tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'splashscreenVersion'
                          .trParams({'version': ConfigConstants.version}),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      'splashscreenCreatedBy'
                          .trParams({'name': 'Charles Lana'}),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

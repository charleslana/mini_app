import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/loading.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.landing),
              fit: BoxFit.cover,
            ),
          ),
          child: Obx(() {
            return Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: landingController.isLoading.value,
                        child: const Loading(),
                      ),
                      Visibility(
                        visible: !landingController.isOk.value,
                        child: Container(
                          width: Get.width * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: landingController.isError.value
                                ? Text(
                                    landingController.textError.value,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    'landingInfo'.tr,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: landingController.isLoading.value,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: Get.width * 0.75,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'landingConnection'.tr,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

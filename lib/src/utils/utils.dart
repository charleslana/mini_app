import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/controllers/utils_controller.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class Utils {
  UtilsController utilsController = Get.put(UtilsController());
  LandingController landingController = Get.put(LandingController());

  void dialogName() {
    Get.defaultDialog<dynamic>(
      barrierDismissible: false,
      onWillPop: () async {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: utilsController.dialogNameTextEditingController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'utilsDialogNameInput'.tr,
              hintMaxLines: 1,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 4,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (utilsController.dialogNameTextEditingController.text
                  .trim()
                  .isEmpty) {
                snackBar('utilsDialogNameInputEmpty'.tr);
                return;
              }
              if (utilsController.dialogNameTextEditingController.text
                      .trim()
                      .length >
                  20) {
                snackBar('utilsDialogNameInputMaxCharacters'.tr);
                return;
              }
              landingController.name =
                  utilsController.dialogNameTextEditingController.text.trim();
              Get.toNamed<dynamic>(AppRoutes.home);
            },
            child: Text(
              'Continuar'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void snackBar(String message) {
    if (Get.isSnackbarOpen) {
      Get.back<dynamic>();
    }
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
    );
  }
}

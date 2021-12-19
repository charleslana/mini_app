import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/app_button.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/controllers/language_controller.dart';
import 'package:mini_app/src/controllers/utils_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class Utils {
  void dialogEditDeck(int index, FavoriteDeckModel favoriteDeckModel) {
    final UtilsController utilsController = Get.put(UtilsController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());
    bool value = false;
    Get.defaultDialog<dynamic>(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: utilsController.textEditingController
              ..text = favoriteDeckModel.name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'utilsDialogNameDeckInput'.tr,
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
          AppButton(
            text: 'utilsDialogNameDeckButton'.tr,
            onPressed: () {
              if (utilsController.textEditingController.text.trim().isEmpty) {
                snackBar('utilsDialogNameDeckInputEmpty'.tr);
                return;
              }
              if (utilsController.textEditingController.text.trim().length >
                  30) {
                snackBar('utilsDialogNameDeckInputMaxCharacters'.tr);
                return;
              }
              favoritesController.updateFavoriteDeck(
                index,
                FavoriteDeckModel(
                  name: utilsController.textEditingController.text
                      .trim()
                      .capitalize!,
                  heroId: favoriteDeckModel.heroId,
                  minisId: favoriteDeckModel.minisId,
                ),
              );
              Get.back<dynamic>();
              value = true;
            },
          ),
        ],
      ),
    ).then((_) {
      if (value) {
        Get.back<dynamic>();
      }
      return false;
    });
  }

  void dialogEditName() {
    final UtilsController utilsController = Get.put(UtilsController());
    final LandingController landingController = Get.put(LandingController());
    Get.defaultDialog<dynamic>(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: utilsController.textEditingController
              ..text = landingController.name,
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
          AppButton(
            text: 'utilsDialogEditNameButton'.tr,
            onPressed: () {
              if (utilsController.textEditingController.text.trim().isEmpty) {
                snackBar('utilsDialogNameInputEmpty'.tr);
                return;
              }
              if (utilsController.textEditingController.text.trim().length >
                  20) {
                snackBar('utilsDialogNameInputMaxCharacters'.tr);
                return;
              }
              landingController.name =
                  utilsController.textEditingController.text.trim().capitalize!;
              Get.back<dynamic>();
            },
          ),
        ],
      ),
    );
  }

  void dialogLanguage() {
    final LanguageController languageController = Get.put(LanguageController());
    final List<Widget> chips = [];
    Widget widget;

    for (int index = 0; index < languageController.languages.length; index++) {
      widget = Obx(() {
        return ChoiceChip(
          selected: languageController.selectedIndex.value == index,
          label: Text(
            index == 0 ? 'languageEnglish'.tr : 'languagePortuguese'.tr,
            style: const TextStyle(color: Colors.white),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: 2),
          pressElevation: 5,
          backgroundColor: Colors.black54,
          selectedColor: ColorConstants.background,
          onSelected: (_) => languageController.changeLanguage(
              languageController.languages[index].locale, index),
        );
      });
      chips.add(widget);
    }

    Get.defaultDialog<dynamic>(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 10,
      content: Obx(() {
        languageController.selectedIndex.value;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'utilsDialogLanguage'.tr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 5),
            Center(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: chips,
              ),
            ),
          ],
        );
      }),
    );
  }

  void dialogName() {
    final UtilsController utilsController = Get.put(UtilsController());
    final LandingController landingController = Get.put(LandingController());
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
            controller: utilsController.textEditingController,
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
          AppButton(
            text: 'utilsDialogNameButton'.tr,
            onPressed: () {
              if (utilsController.textEditingController.text.trim().isEmpty) {
                snackBar('utilsDialogNameInputEmpty'.tr);
                return;
              }
              if (utilsController.textEditingController.text.trim().length >
                  20) {
                snackBar('utilsDialogNameInputMaxCharacters'.tr);
                return;
              }
              landingController.name =
                  utilsController.textEditingController.text.trim().capitalize!;
              Get.toNamed<dynamic>(AppRoutes.home);
            },
          ),
        ],
      ),
    );
  }

  void dialogSaveDeck(int heroId, List<int> minisId) {
    final UtilsController utilsController = Get.put(UtilsController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());
    bool value = false;
    Get.defaultDialog<dynamic>(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: utilsController.textEditingController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'utilsDialogNameDeckInput'.tr,
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
          AppButton(
            text: 'utilsDialogNameDeckButton'.tr,
            onPressed: () {
              if (utilsController.textEditingController.text.trim().isEmpty) {
                snackBar('utilsDialogNameDeckInputEmpty'.tr);
                return;
              }
              if (utilsController.textEditingController.text.trim().length >
                  30) {
                snackBar('utilsDialogNameDeckInputMaxCharacters'.tr);
                return;
              }
              favoritesController.saveFavoriteDeck(FavoriteDeckModel(
                name: utilsController.textEditingController.text
                    .trim()
                    .capitalize!,
                heroId: heroId,
                minisId: minisId,
              ));
              Get.back<dynamic>();
              value = true;
            },
          ),
        ],
      ),
    ).then((_) {
      if (value) {
        Get.back<dynamic>();
      }
      return false;
    });
  }

  static String removeDiacritics(String string) {
    const withDiacritics =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    const withoutDiacritics =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
    for (int i = 0; i < withDiacritics.length; i++) {
      string = string.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }
    return string;
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

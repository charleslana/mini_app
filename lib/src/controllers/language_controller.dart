import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/models/language_model.dart';
import 'package:mini_app/src/services/language_service.dart';

class LanguageController extends GetxController {
  final List<LanguageModel> languages = [
    LanguageModel('English', const Locale('en', 'US')),
    LanguageModel('Portuguese', const Locale('pt', 'BR')),
    LanguageModel('Spanish', const Locale('es', 'ES')),
  ];
  String selectedLanguage = Get.locale!.languageCode;
  RxInt selectedIndex = 0.obs;
  LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage = languageService.locale == null
        ? selectedLanguage
        : languageService.locale!.languageCode;
    switch (selectedLanguage) {
      case 'en':
        selectedIndex.value = 0;
        break;
      case 'pt':
        selectedIndex.value = 1;
        break;
      default:
        selectedIndex.value = 2;
    }
    super.onInit();
  }

  void changeLanguage(Locale locale, int index) {
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
      languageService.change(locale);
    }
  }
}

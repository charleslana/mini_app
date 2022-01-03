import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TierListController extends GetxController {
  final ScrollController minisScrollController = ScrollController();
  final ScrollController heroesScrollController = ScrollController();
  RxInt selectedHero = 0.obs;
  RxInt selectedMini = 0.obs;

  void nextHeroes() {
    if (heroesScrollController.position.pixels <
        heroesScrollController.position.maxScrollExtent) {
      heroesScrollController.animateTo(
        heroesScrollController.position.pixels + Get.width * 0.50,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  void nextMinis() {
    if (minisScrollController.position.pixels <
        minisScrollController.position.maxScrollExtent) {
      minisScrollController.animateTo(
        minisScrollController.position.pixels + Get.width * 0.50,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  void prevHeroes() {
    if (heroesScrollController.position.pixels > 0) {
      heroesScrollController.animateTo(
        heroesScrollController.position.pixels - Get.width * 0.50,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  void prevMinis() {
    if (minisScrollController.position.pixels > 0) {
      minisScrollController.animateTo(
        minisScrollController.position.pixels - Get.width * 0.50,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}

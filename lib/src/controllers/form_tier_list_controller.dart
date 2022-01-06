import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/tier_list_model.dart';

enum TypeList {
  S,
  A,
  B,
  C,
  D,
}

class FormTierListController extends GetxController {
  final ScrollController minisScrollController = ScrollController();
  final ScrollController heroesScrollController = ScrollController();
  final LandingController landingController = Get.find();
  RxInt selectedHero = 0.obs;
  RxInt selectedMini = 0.obs;
  RxList<HeroModel> listHeroes = <HeroModel>[].obs;
  RxList<MiniModel> listMinis = <MiniModel>[].obs;
  RxList<TierListMinisModel> listS = <TierListMinisModel>[].obs;
  RxList<TierListMinisModel> listA = <TierListMinisModel>[].obs;
  RxList<TierListMinisModel> listB = <TierListMinisModel>[].obs;
  RxList<TierListMinisModel> listC = <TierListMinisModel>[].obs;
  RxList<TierListMinisModel> listD = <TierListMinisModel>[].obs;
  int? indexEditTierList;

  @override
  void onInit() {
    initTierList();
    super.onInit();
  }

  void _addListS(TierListMinisModel data) {
    listS.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
    }
    selectedHero.value = 0;
  }

  void addTierList(TierListMinisModel data, TypeList type) {
    switch (type) {
      case TypeList.S:
        _addListS(data);
        break;
      default:
    }
  }

  void initTierList() {
    if (indexEditTierList == null) {
      listHeroes.addAll(landingController.appModel.heroes);
      listMinis.addAll(landingController.appModel.minis);
    }
  }

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

  void removeTierListHero(int index, HeroModel heroModel, TypeList type) {
    switch (type) {
      case TypeList.S:
        listS.removeAt(index);
        break;
      default:
    }
    listHeroes.add(heroModel);
  }
}

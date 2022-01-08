import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/tier_list_model.dart';

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
  RxBool isMove = false.obs;
  int? indexEditTierList;

  @override
  void onInit() {
    initTierList();
    super.onInit();
  }

  void _addListA(TierListMinisModel data) {
    listA.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
        listMinis.removeWhere((element) => element.id == data.index);
    }
  }

  void _addListB(TierListMinisModel data) {
    listB.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
        listMinis.removeWhere((element) => element.id == data.index);
    }
  }

  void _addListC(TierListMinisModel data) {
    listC.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
        listMinis.removeWhere((element) => element.id == data.index);
    }
  }

  void _addListD(TierListMinisModel data) {
    listD.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
        listMinis.removeWhere((element) => element.id == data.index);
    }
  }

  void _addListS(TierListMinisModel data) {
    listS.add(data);
    switch (data.type) {
      case TypeTierList.hero:
        listHeroes.removeWhere((element) => element.id == data.index);
        break;
      default:
        listMinis.removeWhere((element) => element.id == data.index);
    }
  }

  void _removeTierList(int index, TypeList type) {
    switch (type) {
      case TypeList.S:
        listS.removeAt(index);
        break;
      case TypeList.A:
        listA.removeAt(index);
        break;
      case TypeList.B:
        listB.removeAt(index);
        break;
      case TypeList.C:
        listC.removeAt(index);
        break;
      default:
        listD.removeAt(index);
    }
  }

  void addTierList(TierListMinisModel data, TypeList type) {
    switch (type) {
      case TypeList.S:
        _addListS(data);
        break;
      case TypeList.A:
        _addListA(data);
        break;
      case TypeList.B:
        _addListB(data);
        break;
      case TypeList.C:
        _addListC(data);
        break;
      default:
        _addListD(data);
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
    _removeTierList(index, type);
    listHeroes.add(heroModel);
  }

  void removeTierListMini(int index, MiniModel miniModel, TypeList type) {
    _removeTierList(index, type);
    listMinis.add(miniModel);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/tier_list_model.dart';
import 'package:mini_app/src/services/tier_list_service.dart';

class FormTierListController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
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
  RxList<TierListRankModel> tierListRankModel = <TierListRankModel>[].obs;
  RxBool isMove = false.obs;
  int? indexEditTierList;
  TierListService tierListService = TierListService();

  @override
  void onInit() {
    fecthTierList();
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

  void _removeTierListS() {
    for (final element in tierListRankModel[indexEditTierList!].listS) {
      listHeroes.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.hero);
      listMinis.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.mini);
    }
  }

  void _removeTierListA() {
    for (final element in tierListRankModel[indexEditTierList!].listA) {
      listHeroes.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.hero);
      listMinis.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.mini);
    }
  }

  void _removeTierListB() {
    for (final element in tierListRankModel[indexEditTierList!].listB) {
      listHeroes.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.hero);
      listMinis.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.mini);
    }
  }

  void _removeTierListC() {
    for (final element in tierListRankModel[indexEditTierList!].listC) {
      listHeroes.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.hero);
      listMinis.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.mini);
    }
  }

  void _removeTierListD() {
    for (final element in tierListRankModel[indexEditTierList!].listD) {
      listHeroes.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.hero);
      listMinis.removeWhere((list) =>
          list.id == element.index && element.type == TypeTierList.mini);
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

  void clearAllList() {
    listS.clear();
    listA.clear();
    listB.clear();
    listC.clear();
    listD.clear();
  }

  void clearTierList() {
    listHeroes
      ..clear()
      ..addAll(landingController.appModel.heroes);
    listMinis
      ..clear()
      ..addAll(landingController.appModel.minis);
    clearAllList();
  }

  void editTierList() {
    listS.addAll(tierListRankModel[indexEditTierList!].listS);
    listA.addAll(tierListRankModel[indexEditTierList!].listA);
    listB.addAll(tierListRankModel[indexEditTierList!].listB);
    listC.addAll(tierListRankModel[indexEditTierList!].listC);
    listD.addAll(tierListRankModel[indexEditTierList!].listD);
    _removeTierListS();
    _removeTierListA();
    _removeTierListB();
    _removeTierListC();
    _removeTierListD();
  }

  void fecthTierList() {
    final TierListModel loadTierList = tierListService.loadFromBox();
    tierListRankModel
      ..clear()
      ..addAll(loadTierList.tierList);
  }

  void initTierList() {
    clearTierList();
    if (indexEditTierList != null) {
      editTierList();
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

  void removeTierList(int index) {
    tierListRankModel.removeAt(index);
    saveBox();
  }

  void removeTierListHero(int index, HeroModel heroModel, TypeList type) {
    _removeTierList(index, type);
    listHeroes.add(heroModel);
  }

  void removeTierListMini(int index, MiniModel miniModel, TypeList type) {
    _removeTierList(index, type);
    listMinis.add(miniModel);
  }

  void saveBox() {
    tierListService.saveToBox(TierListModel(tierList: tierListRankModel));
    fecthTierList();
  }

  void saveTierList() {
    tierListRankModel.add(TierListRankModel(
      listS: listS,
      listA: listA,
      listB: listB,
      listC: listC,
      listD: listD,
      name: textEditingController.text.trim().capitalize!,
    ));
    saveBox();
  }

  void updateTierList() {
    tierListRankModel[indexEditTierList!] = TierListRankModel(
      listS: listS,
      listA: listA,
      listB: listB,
      listC: listC,
      listD: listD,
      name: textEditingController.text.trim().capitalize!,
    );
    saveBox();
  }
}

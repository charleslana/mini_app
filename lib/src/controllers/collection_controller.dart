import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';

class CollectionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController heroesScrollController = ScrollController();
  final ScrollController minisScrollController = ScrollController();
  final TextEditingController heroTextEditingController =
      TextEditingController();
  final TextEditingController miniTextEditingController =
      TextEditingController();
  LandingController landingController = Get.find();
  RxInt filterIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
    super.onInit();
  }

  @override
  void onClose() {
    heroTextEditingController.dispose();
    miniTextEditingController.dispose();
    super.onClose();
  }

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          scrollToUp(heroesScrollController);
          clearTabHero();
          break;
        case 1:
          scrollToUp(minisScrollController);
          clearTabMinis();
          break;
      }
    }
  }

  void clearTabHero() {
    if (landingController.filterHeroList.length !=
        landingController.appModel.heroes.length) {
      heroTextEditingController.clear();
      landingController.filterHeroList
        ..clear()
        ..addAll(landingController.appModel.heroes);
    }
  }

  void clearTabMinis() {
    if (landingController.filterMiniList.length !=
        landingController.appModel.minis.length) {
      miniTextEditingController.clear();
      filterIndex.value = 0;
      landingController.filterMiniList
        ..clear()
        ..addAll(landingController.appModel.minis);
    }
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }
}

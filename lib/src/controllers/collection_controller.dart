import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollControllerHeroes = ScrollController();
  final ScrollController scrollControllerMinis = ScrollController();
  final TextEditingController heroTextEditingController =
      TextEditingController();
  final TextEditingController miniTextEditingController =
      TextEditingController();
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
          scrollToUp(scrollControllerHeroes);
          break;
        case 1:
          scrollToUp(scrollControllerMinis);
          break;
      }
    }
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }
}

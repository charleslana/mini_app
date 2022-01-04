import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class FormDeckController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final heroTooltipController = JustTheController();
  final miniTooltipController = List.generate(5, (i) => JustTheController());
  final helpTooltipController = JustTheController();
  RxInt heroId = 0.obs;
  RxList<int> listMinis = <int>[].obs;
  int maxMinis = 5;
  int? indexEditDeck;

  @override
  void onInit() {
    initDeck();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void initDeck() {
    listMinis
      ..value = []
      ..value = List.generate(maxMinis, (index) => 0);
    indexEditDeck = null;
  }
}

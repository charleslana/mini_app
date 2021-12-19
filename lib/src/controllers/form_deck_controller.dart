import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDeckController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  RxInt heroId = 0.obs;
  RxList<int> listMinis = <int>[].obs;
  int maxMinis = 5;

  @override
  void onInit() {
    listMinis.value = List.generate(maxMinis, (index) => 0);
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}

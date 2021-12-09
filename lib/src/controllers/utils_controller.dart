import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsController extends GetxController {
  final TextEditingController dialogNameTextEditingController =
      TextEditingController();

  @override
  void onClose() {
    dialogNameTextEditingController.dispose();
    super.onClose();
  }
}

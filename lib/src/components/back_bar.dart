import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/utils/utils.dart';

class BackBar extends StatelessWidget {
  const BackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: IconButton(
              onPressed: () => Utils().dialogLanguage(),
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

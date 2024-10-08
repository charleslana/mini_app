import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/utils/utils.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        landingController.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                ),
                IconButton(
                  onPressed: () => Utils().dialogEditName(),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
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
    );
  }
}

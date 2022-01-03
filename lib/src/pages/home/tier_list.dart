import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TierList extends StatelessWidget {
  const TierList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          const CustomBar(),
          const SizedBox(height: 20),
          Text(
            'tierListTitle'.tr,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed<dynamic>(AppRoutes.formTierList);
            },
            child: Text(
              'tierListButtonNew'.tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

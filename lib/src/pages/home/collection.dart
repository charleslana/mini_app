import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/collection_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/pages/home/collection/tab_heroes.dart';
import 'package:mini_app/src/pages/home/collection/tab_minis.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionController collectionController =
        Get.put(CollectionController());
    final LandingController landingController = Get.put(LandingController());

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
          TabBar(
            controller: collectionController.tabController,
            tabs: [
              Tab(
                icon: Image.asset(
                  ImageConstants.iconCountess,
                  height: 38,
                ),
                text: 'collectionTabHeroes'.trParams({
                  'value': landingController.appModel.heroes.length.toString()
                }),
              ),
              Tab(
                icon: Image.asset(
                  ImageConstants.iconSpearGoblin,
                  height: 38,
                ),
                text: 'collectionTabMinis'.trParams({
                  'value': landingController.appModel.minis.length.toString()
                }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: collectionController.tabController,
              children: const [
                TabHeroes(),
                TabMinis(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

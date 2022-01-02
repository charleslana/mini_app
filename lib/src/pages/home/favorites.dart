import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/pages/home/favorites/tab_favorites_decks.dart';
import 'package:mini_app/src/pages/home/favorites/tab_favorites_minis.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    Future<void> launchURL() async {
      if (!await launch(ConfigConstants.urlDiscord)) {
        throw Exception('Could not launch $ConfigConstants.urlDiscord');
      }
    }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    'favoritesDiscord'.tr,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  onPressed: launchURL,
                  icon: Image.asset(
                    ImageConstants.iconDiscord,
                    height: 38,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'favorites'.tr,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return TabBar(
              controller: favoritesController.tabController,
              tabs: [
                Tab(
                  icon: Image.asset(
                    ImageConstants.iconFavoritesDeck,
                    height: 38,
                  ),
                  text: 'favoritesTabDecks'.trParams({
                    'value': favoritesController.listDecks.length.toString()
                  }),
                ),
                Tab(
                  icon: Image.asset(
                    ImageConstants.iconFavoritesMinis,
                    height: 38,
                  ),
                  text: 'favoritesTabMinis'.trParams({
                    'value': favoritesController.listFavorites.length.toString()
                  }),
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: favoritesController.tabController,
              children: const [
                TabFavoritesDecks(),
                TabFavoritesMinis(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

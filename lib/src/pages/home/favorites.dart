import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/pages/home/favorites/tab_favorites_decks.dart';
import 'package:mini_app/src/pages/home/favorites/tab_favorites_minis.dart';
import 'package:mini_app/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    Future<void> launchDiscord() async {
      if (!await launch(ConfigConstants.urlDiscord)) {
        throw Exception('Could not launch ${ConfigConstants.urlDiscord}');
      }
    }

    Future<void> launchGitHub() async {
      if (!await launch(ConfigConstants.urlGitHub)) {
        throw Exception('Could not launch ${ConfigConstants.urlGitHub}');
      }
    }

    void dialogDiscord() {
      Get.defaultDialog<dynamic>(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'favoritesDialogDiscordTitle'.tr,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: launchDiscord,
              child: Text(
                'favoritesDialogDiscordButton'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    void dialogGitHub() {
      Get.defaultDialog<dynamic>(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'favoritesDialogGitHubTitle'.tr,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: launchGitHub,
              child: Text(
                'favoritesDialogGitHubButton'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    void dialogNews() {
      final LandingController landingController = Get.find();
      DateFormat formatter;
      switch ('languageCode'.tr) {
        case 'en':
          formatter = DateFormat('yyyy/MM/dd');
          break;
        case 'pt':
          formatter = DateFormat('dd/MM/yyyy');
          break;
        default:
          formatter = DateFormat('dd/MM/yyyy');
      }
      landingController.appModel.news
          .sort((NewsModel a, NewsModel b) => b.id.compareTo(a.id));

      Get.defaultDialog<dynamic>(
        title: 'favoritesDialogNewsTitle'.tr,
        radius: 10,
        content: SizedBox(
          width: double.maxFinite,
          height: Get.height * 0.50,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: landingController.appModel.news.length,
            itemBuilder: (context, i) {
              final NewsModel newsModel = landingController.appModel.news[i];
              final DateTime date =
                  DateFormat('yyyy/MM/dd').parse(newsModel.date);
              final String formatted = formatter.format(date);

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          formatted,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          Utils().readLanguage(newsModel.description),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.indigoAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  onPressed: dialogNews,
                  icon: const Icon(
                    Icons.campaign,
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
                  onPressed: dialogGitHub,
                  icon: Image.asset(
                    ImageConstants.iconGitHub,
                    height: 38,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  onPressed: dialogDiscord,
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

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/config_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/models/mini_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
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
          if (favoritesController.listFavorites.isEmpty)
            Center(
              child: Text(
                'favoritesNotFound'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            )
          else
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favoritesController.listFavorites.length,
                  itemBuilder: (context, index) {
                    final Favorite favorite =
                        favoritesController.listFavorites[index];

                    if (favorite.type == TypeFavorite.hero) {
                      final Heroes hero =
                          landingController.heroesList[favorite.index!];

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () => {
                                landingController
                                  ..heroIndex.value = hero.id - 1,
                                Get.toNamed<dynamic>(AppRoutes.heroDetails),
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          ImageConstants()
                                              .getHeroThumbnail(hero.image),
                                          height: 80,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'languageCode'.tr == 'en'
                                                ? hero.name.enUs
                                                : hero.name.ptBr,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigoAccent,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    final Minis mini =
                        landingController.minisList[favorite.index!];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () => {
                              landingController..miniIndex.value = mini.id - 1,
                              Get.toNamed<dynamic>(AppRoutes.miniDetails),
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        ImageConstants()
                                            .getMiniThumbnail(mini.image),
                                        height: 80,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'languageCode'.tr == 'en'
                                              ? mini.name.enUs
                                              : mini.name.ptBr,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.indigoAccent,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

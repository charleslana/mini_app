import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TabFavoritesMinis extends StatelessWidget {
  const TabFavoritesMinis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return Obx(() {
      return Column(
        children: [
          if (favoritesController.listMinisFavorites.isEmpty)
            Center(
              child: Text(
                'favoritesMiniNotFound'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            )
          else
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favoritesController.listMinisFavorites.length,
                  itemBuilder: (context, index) {
                    final FavoriteMiniModel favoriteMiniModel =
                        favoritesController.listMinisFavorites[index];

                    if (favoriteMiniModel.type == TypeFavorite.hero) {
                      final HeroModel heroModel = landingController
                          .appModel.heroes[favoriteMiniModel.index];

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () => {
                                landingController
                                  ..heroIndex.value = heroModel.id - 1,
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
                                          ImageConstants().getHeroThumbnail(
                                              heroModel.image),
                                          height: 80,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'languageCode'.tr == 'en'
                                                ? heroModel.name.enUs
                                                : heroModel.name.ptBr,
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
                    final MiniModel miniModel = landingController
                        .appModel.minis[favoriteMiniModel.index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () => {
                              landingController
                                ..miniIndex.value = miniModel.id - 1,
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
                                            .getMiniThumbnail(miniModel.image),
                                        height: 80,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'languageCode'.tr == 'en'
                                              ? miniModel.name.enUs
                                              : miniModel.name.ptBr,
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
      );
    });
  }
}

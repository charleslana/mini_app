import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';
import 'package:mini_app/src/utils/utils.dart';

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
          if (favoritesController.listFavorites.isEmpty)
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
                  controller: favoritesController.minisScrollController,
                  itemCount: favoritesController.listFavorites.length,
                  itemBuilder: (context, index) {
                    final FavoriteMinisModel favoriteMinisModel =
                        favoritesController.listFavorites[index];

                    if (favoriteMinisModel.type == TypeFavorite.hero) {
                      final HeroModel heroModel = landingController
                          .appModel.heroes[favoriteMinisModel.index];

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
                                          ImageConstants()
                                              .getHeroIcon(heroModel.image),
                                          height: 80,
                                        ),
                                        Flexible(
                                          child: Text(
                                            Utils()
                                                .readLanguage(heroModel.name),
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
                        .appModel.minis[favoriteMinisModel.index];
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
                                            .getMiniIcon(miniModel.image),
                                        height: 80,
                                      ),
                                      Flexible(
                                        child: Text(
                                          Utils().readLanguage(miniModel.name),
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

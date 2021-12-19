import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/app_button.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TabFavoritesDecks extends StatelessWidget {
  const TabFavoritesDecks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return Obx(() {
      return Column(
        children: [
          AppButton(
            text: 'favoritesDeckNewDeck'.tr,
            color: Colors.black54,
            onPressed: () => Get.toNamed<dynamic>(AppRoutes.formDeck),
          ),
          const SizedBox(height: 20),
          if (favoritesController.listDecksFavorites.isEmpty)
            Center(
              child: Text(
                'favoritesDeckNotFound'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            )
          else
            AnimationLimiter(
              child: Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favoritesController.listDecksFavorites.length,
                  itemBuilder: (context, i) {
                    final FavoriteDeckModel favoriteDeckModel =
                        favoritesController.listDecksFavorites[i];

                    final HeroModel heroModel = landingController
                        .appModel.heroes[favoriteDeckModel.heroId - 1];

                    return AnimationConfiguration.staggeredList(
                      position: i,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () => {
                              Get.toNamed<dynamic>(AppRoutes.formDeck),
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageConstants()
                                            .getHeroThumbnail(heroModel.image),
                                        height: 80,
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                favoriteDeckModel.name,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () => {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ],
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

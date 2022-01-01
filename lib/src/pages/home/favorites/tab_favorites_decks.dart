import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/form_deck_controller.dart';
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
    final FormDeckController formDeckController = Get.put(FormDeckController());

    void confirmRemoveDeck(int index) {
      Get.defaultDialog<dynamic>(
        onConfirm: () {
          favoritesController.removeFavoriteDeck(index);
          Get.back<dynamic>();
        },
        onCancel: null,
        confirmTextColor: Colors.white,
        cancelTextColor: ColorConstants.background,
        buttonColor: ColorConstants.background,
        textCancel: 'favoritesDeckDialogTextCancel'.tr,
        textConfirm: 'favoritesDeckDialogTextConfirm'.tr,
        title: 'favoritesDeckDialogTitle'.tr,
        middleText: 'favoritesDeckDialogMiddleText'.tr,
      );
    }

    return Obx(() {
      return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              formDeckController.heroId.value = 0;
              formDeckController.initDeck();
              Get.toNamed<dynamic>(AppRoutes.formDeck);
            },
            child: Text(
              'favoritesDeckNewDeck'.tr,
              style: const TextStyle(color: Colors.white),
            ),
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
                  controller: favoritesController.decksScrollController,
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
                              formDeckController.heroId.value =
                                  favoriteDeckModel.heroId,
                              for (var index = 0;
                                  index < favoriteDeckModel.minisId.length;
                                  index++)
                                {
                                  formDeckController.listMinis[index] =
                                      favoriteDeckModel.minisId
                                          .elementAt(index),
                                },
                              formDeckController.indexEditDeck = i,
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
                                            .getHeroIcon(heroModel.image),
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
                                              onPressed: () =>
                                                  confirmRemoveDeck(i),
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

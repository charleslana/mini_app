import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/components/card_stats.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/hero_details_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';

class HeroDetailsPage extends StatelessWidget {
  const HeroDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HeroDetailsController heroDetailsController =
        Get.put(HeroDetailsController());
    final LandingController landingController = Get.put(LandingController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        body: Stack(
          children: [
            const BackgroundAnimation(),
            Obx(() {
              final int index = landingController.heroIndex.value;
              final int level = heroDetailsController.currentLevel.value;
              final Favorite favoriteModel =
                  Favorite(index: index, type: TypeFavorite.hero);

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const BackBar(),
                    Text(
                      'heroDetailsLevel'
                          .trParams({'level': level.toStringAsFixed(0)}),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Card(
                      child: SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 8,
                        ),
                        child: Slider(
                          value: level.toDouble(),
                          onChanged: (double value) =>
                              heroDetailsController.changeLevel(value.toInt()),
                          min: 1,
                          max: heroDetailsController.maxLevel.toDouble(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'languageCode'.tr == 'en'
                              ? landingController.heroesList[index].name.enUs
                              : landingController.heroesList[index].name.ptBr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              favoritesController.toggleFavorite(favoriteModel),
                          icon: Icon(
                            favoritesController.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (child) => SlideAnimation(
                                horizontalOffset: 50,
                                child: FadeInAnimation(
                                  child: child,
                                ),
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        ImageConstants().getHeroPortrait(
                                            landingController
                                                .heroesList[index].image),
                                        height: 200,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          CardStats(
                                            title: 'heroDetailsStatsLevel'.tr,
                                            text: level.toString(),
                                            isOpacity: true,
                                          ),
                                          CardStats(
                                            title: 'heroDetailsStatsHP'.tr,
                                            text: landingController
                                                .heroesList[index]
                                                .stats[level - 1]
                                                .hp
                                                .toString(),
                                          ),
                                          CardStats(
                                            title:
                                                'heroDetailsStatsHitPerSecond'
                                                    .tr,
                                            text: landingController
                                                .heroesList[index]
                                                .stats[level - 1]
                                                .hitPerSecond
                                                .toString(),
                                            isOpacity: true,
                                          ),
                                          CardStats(
                                            title:
                                                'heroDetailsStatsDamagePerHit'
                                                    .tr,
                                            text: landingController
                                                .heroesList[index]
                                                .stats[level - 1]
                                                .damagePerHit
                                                .toString(),
                                          ),
                                          CardStats(
                                            title:
                                                'heroDetailsStatsEnergyCost'.tr,
                                            text: landingController
                                                .heroesList[index]
                                                .stats[level - 1]
                                                .energyCost
                                                .toString(),
                                            isOpacity: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: landingController
                                      .heroesList[index].levels
                                      .map(
                                        (level) => Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'languageCode'.tr == 'en'
                                                        ? level.name.enUs
                                                        : level.name.ptBr,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: ColorConstants
                                                          .background,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'heroDetailsLevelsUnlockLevel'
                                                        .trParams({
                                                      'level':
                                                          level.level.toString()
                                                    }),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 5),
                                                        child: Text(
                                                          level.clash
                                                              ? 'heroDetailsLevelsClash'
                                                                  .tr
                                                                  .toUpperCase()
                                                              : level.spr
                                                                  ? 'heroDetailsLevelsSuper'
                                                                      .tr
                                                                      .toUpperCase()
                                                                  : level.boast
                                                                      ? 'heroDetailsLevelsBoast'
                                                                          .tr
                                                                          .toUpperCase()
                                                                      : '',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .blueAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          'languageCode'
                                                                      .tr ==
                                                                  'en'
                                                              ? level
                                                                  .description
                                                                  .enUs
                                                              : level
                                                                  .description
                                                                  .ptBr,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .indigoAccent,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

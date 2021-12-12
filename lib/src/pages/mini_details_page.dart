import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/components/card_stats.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/controllers/mini_details_controller.dart';
import 'package:mini_app/src/models/favorite_model.dart';

class MiniDetailsPage extends StatelessWidget {
  const MiniDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiniDetailsController miniDetailsController =
        Get.put(MiniDetailsController());
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
              final int index = landingController.miniIndex.value;
              final int star = miniDetailsController.currentStar.value;
              final Favorite favoriteModel =
                  Favorite(index: index, type: TypeFavorite.mini);

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const BackBar(),
                    Text(
                      'miniDetailsStar'
                          .trParams({'star': star.toStringAsFixed(0)}),
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
                          value: star.toDouble(),
                          onChanged: (double value) =>
                              miniDetailsController.changeStar(value.toInt()),
                          max: miniDetailsController.maxStar.toDouble(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'languageCode'.tr == 'en'
                              ? landingController.minisList[index].name.enUs
                              : landingController.minisList[index].name.ptBr,
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
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            ImageConstants().getMiniPortrait(
                                                landingController
                                                    .minisList[index].image),
                                            height: 200,
                                            fit: BoxFit.fitWidth,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                ImageConstants.iconElixir,
                                                height: 30,
                                              ),
                                              Text(landingController
                                                  .minisList[index].elixirCost
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          CardStats(
                                            title: 'miniDetailsStatsStar'.tr,
                                            text: star.toString(),
                                            isOpacity: true,
                                          ),
                                          CardStats(
                                            title: 'miniDetailsStatsHP'.tr,
                                            text: landingController
                                                .minisList[index].stats[star].hp
                                                .toString(),
                                          ),
                                          CardStats(
                                            title:
                                                'miniDetailsStatsHitPerSecond'
                                                    .tr,
                                            text: landingController
                                                .minisList[index]
                                                .stats[star]
                                                .hitPerSecond
                                                .toString(),
                                            isOpacity: true,
                                          ),
                                          CardStats(
                                            title:
                                                'miniDetailsStatsDamagePerHit'
                                                    .tr,
                                            text: landingController
                                                .minisList[index].damagePerHit
                                                .toString(),
                                          ),
                                          CardStats(
                                            title:
                                                'miniDetailsStatsEnergyCost'.tr,
                                            text: landingController
                                                .minisList[index].energyCost
                                                .toString(),
                                            isOpacity: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Card(
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
                                                ? landingController
                                                    .minisList[index]
                                                    .skill
                                                    .name
                                                    .enUs
                                                : landingController
                                                    .minisList[index]
                                                    .skill
                                                    .name
                                                    .ptBr,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: ColorConstants.background,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Text(
                                                  landingController
                                                          .minisList[index]
                                                          .skill
                                                          .clash
                                                      ? 'miniDetailsAbilitiesClash'
                                                          .tr
                                                          .toUpperCase()
                                                      : landingController
                                                              .minisList[index]
                                                              .skill
                                                              .spr
                                                          ? 'miniDetailsAbilitiesSuper'
                                                              .tr
                                                              .toUpperCase()
                                                          : landingController
                                                                  .minisList[
                                                                      index]
                                                                  .skill
                                                                  .boast
                                                              ? 'miniDetailsAbilitiesBoast'
                                                                  .tr
                                                                  .toUpperCase()
                                                              : landingController
                                                                      .minisList[
                                                                          index]
                                                                      .skill
                                                                      .ko
                                                                  ? 'miniDetailsAbilitiesKO'
                                                                      .tr
                                                                  : '',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'languageCode'.tr == 'en'
                                                      ? landingController
                                                          .minisList[index]
                                                          .skill
                                                          .description
                                                          .enUs
                                                      : landingController
                                                          .minisList[index]
                                                          .skill
                                                          .description
                                                          .ptBr,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.indigoAccent,
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
                                Column(
                                  children: landingController
                                      .minisList[index].abilities
                                      .map(
                                        (ability) => Card(
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
                                                        ? ability.name.enUs
                                                        : ability.name.ptBr,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: ColorConstants
                                                          .background,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'miniDetailsAbilitiesUnlockStar'
                                                        .trParams({
                                                      'star': ability.star
                                                          .toString()
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
                                                          ability.clash
                                                              ? 'miniDetailsAbilitiesClash'
                                                                  .tr
                                                                  .toUpperCase()
                                                              : ability.spr
                                                                  ? 'miniDetailsAbilitiesSuper'
                                                                      .tr
                                                                      .toUpperCase()
                                                                  : ability
                                                                          .boast
                                                                      ? 'miniDetailsAbilitiesBoast'
                                                                          .tr
                                                                          .toUpperCase()
                                                                      : ability
                                                                              .ko
                                                                          ? 'miniDetailsAbilitiesKO'
                                                                              .tr
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
                                                          'languageCode'.tr ==
                                                                  'en'
                                                              ? ability
                                                                  .description
                                                                  .enUs
                                                              : ability
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

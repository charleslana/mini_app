import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/components/card_stats.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/controllers/mini_details_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/favorite_model.dart';
import 'package:mini_app/src/utils/utils.dart';

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
              final FavoriteMinisModel favoriteMinisModel = FavoriteMinisModel(
                index: index,
                type: TypeFavorite.mini,
              );

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const BackBar(),
                    const SizedBox(height: 20),
                    Text(
                      'miniDetailsStar'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            onPressed: () =>
                                miniDetailsController.changeStar(0),
                            child: Text(
                              'miniDetailsButtonEmpty'.tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        for (var i = 0; i < miniDetailsController.maxStar; i++)
                          Flexible(
                            child: IconButton(
                              onPressed: () =>
                                  miniDetailsController.changeStar(i + 1),
                              icon: Icon(
                                star >= (i + 1)
                                    ? Icons.star
                                    : Icons.star_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Utils().readLanguage(
                              landingController.appModel.minis[index].name),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: index > 0,
                              child: IconButton(
                                onPressed: () {
                                  landingController.miniIndex.value--;
                                  miniDetailsController.currentStar.value = 0;
                                  favoritesController
                                      .existFavorite(FavoriteMinisModel(
                                    index: index - 1,
                                    type: TypeFavorite.mini,
                                  ));
                                  miniDetailsController.scrollToUp();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: index + 1 <
                                  landingController.appModel.minis.length,
                              child: IconButton(
                                onPressed: () {
                                  landingController.miniIndex.value++;
                                  miniDetailsController.currentStar.value = 0;
                                  favoritesController
                                      .existFavorite(FavoriteMinisModel(
                                    index: index + 1,
                                    type: TypeFavorite.mini,
                                  ));
                                  miniDetailsController.scrollToUp();
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => favoritesController
                                  .toggleFavorite(favoriteMinisModel),
                              icon: Icon(
                                favoritesController.isMiniFavorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Image.asset(
                                ImageConstants().getMiniPortrait(
                                    landingController
                                        .appModel.minis[index].image),
                                height: 200,
                                fit: BoxFit.fitWidth,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageConstants.iconElixir,
                                    height: 30,
                                  ),
                                  Text(landingController
                                      .appModel.minis[index].elixirCost
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
                                    .appModel.minis[index].stats[star].hp
                                    .toString(),
                              ),
                              CardStats(
                                title: 'miniDetailsStatsHitPerSecond'.tr,
                                text: landingController.appModel.minis[index]
                                    .stats[star].hitPerSecond
                                    .toString(),
                                isOpacity: true,
                              ),
                              CardStats(
                                title: 'miniDetailsStatsDamagePerHit'.tr,
                                text: landingController
                                    .appModel.minis[index].damagePerHit
                                    .toString(),
                              ),
                              CardStats(
                                title: 'miniDetailsStatsEnergyCost'.tr,
                                text: landingController
                                    .appModel.minis[index].energyCost
                                    .toString(),
                                isOpacity: true,
                              ),
                              CardStats(
                                title: 'miniDetailsStatsInitialEnergy'.tr,
                                text: landingController
                                    .appModel.minis[index].initialEnergy
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: miniDetailsController.scrollController,
                        child: Column(
                          children: [
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
                                        Utils().readLanguage(landingController
                                            .appModel.minis[index].skill.name),
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
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Text(
                                              landingController.appModel
                                                      .minis[index].skill.clash
                                                  ? 'miniDetailsAbilitiesClash'
                                                      .tr
                                                      .toUpperCase()
                                                  : landingController
                                                          .appModel
                                                          .minis[index]
                                                          .skill
                                                          .spr
                                                      ? 'miniDetailsAbilitiesSuper'
                                                          .tr
                                                          .toUpperCase()
                                                      : landingController
                                                              .appModel
                                                              .minis[index]
                                                              .skill
                                                              .boast
                                                          ? 'miniDetailsAbilitiesBoast'
                                                              .tr
                                                              .toUpperCase()
                                                          : landingController
                                                                  .appModel
                                                                  .minis[index]
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
                                              Utils().readLanguage(
                                                  landingController
                                                      .appModel
                                                      .minis[index]
                                                      .skill
                                                      .description),
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
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: landingController
                                      .appModel.minis[index].abilities.length,
                                  itemBuilder: (_, i) {
                                    final AbilityModel abilityModel =
                                        landingController
                                            .appModel.minis[index].abilities[i];

                                    return Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Utils().readLanguage(
                                                    abilityModel.name),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color:
                                                      ColorConstants.background,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                'miniDetailsAbilitiesUnlockStar'
                                                    .trParams({
                                                  'star': abilityModel.star
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    child: Text(
                                                      abilityModel.clash
                                                          ? 'miniDetailsAbilitiesClash'
                                                              .tr
                                                              .toUpperCase()
                                                          : abilityModel.spr
                                                              ? 'miniDetailsAbilitiesSuper'
                                                                  .tr
                                                                  .toUpperCase()
                                                              : abilityModel
                                                                      .boast
                                                                  ? 'miniDetailsAbilitiesBoast'
                                                                      .tr
                                                                      .toUpperCase()
                                                                  : abilityModel
                                                                          .ko
                                                                      ? 'miniDetailsAbilitiesKO'
                                                                          .tr
                                                                      : '',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blueAccent,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      Utils().readLanguage(
                                                          abilityModel
                                                              .description),
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Colors.indigoAccent,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
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

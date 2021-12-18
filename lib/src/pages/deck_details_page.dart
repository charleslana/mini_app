import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';

class DeckDetailsPage extends StatelessWidget {
  const DeckDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    final DeckModel deckModel = landingController.deckModel;
    final HeroModel hero =
        landingController.appModel.heroes[deckModel.heroId - 1];
    const double columns = 3.2;
    const double runSpacing = 1;
    const double spacing = 1;
    final double width = (Get.width - runSpacing * (columns - 1)) / columns;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.background,
        body: Stack(
          children: [
            const BackgroundAnimation(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const BackBar(),
                  const SizedBox(height: 20),
                  Text(
                    'languageCode'.tr == 'en'
                        ? deckModel.name.enUs
                        : deckModel.name.ptBr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'languageCode'.tr == 'en'
                        ? deckModel.description.enUs
                        : deckModel.description.ptBr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Image.asset(
                            ImageConstants().getHeroPortrait(hero.image),
                            height: 120,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'languageCode'.tr == 'en'
                                ? hero.name.enUs
                                : hero.name.ptBr,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            runSpacing: runSpacing,
                            spacing: spacing,
                            alignment: WrapAlignment.center,
                            children: deckModel.minisId.map((miniId) {
                              final MiniModel miniModel =
                                  landingController.appModel.minis[miniId - 1];

                              return SizedBox(
                                width: width,
                                height: 200,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Image.asset(
                                        ImageConstants()
                                            .getMiniPortrait(miniModel.image),
                                        height: 150,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            'languageCode'.tr == 'en'
                                                ? miniModel.name.enUs
                                                : miniModel.name.ptBr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

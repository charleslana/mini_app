import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/collection_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TabHeroes extends StatelessWidget {
  const TabHeroes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionController collectionController =
        Get.put(CollectionController());
    final LandingController landingController = Get.put(LandingController());
    const int columnCount = 3;

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: collectionController.heroTextEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'tabHeroesSearch'.tr,
                hintMaxLines: 1,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 4,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    collectionController.clearTabHero();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onChanged: (text) => landingController.searchHero(text.trim()),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: AnimationLimiter(
            child: Obx(() {
              return landingController.filterHeroList.isEmpty
                  ? Text('tabHeroesSearchNotFound'.tr)
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: collectionController.heroesScrollController,
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnCount,
                        childAspectRatio: Get.width / (Get.height / 1.5),
                      ),
                      itemCount: landingController.filterHeroList.length,
                      itemBuilder: (_, int index) {
                        final HeroModel heroModel =
                            landingController.filterHeroList[index];

                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: columnCount,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () => {
                                  landingController
                                    ..heroIndex.value = heroModel.id - 1,
                                  FocusManager.instance.primaryFocus?.unfocus(),
                                  Get.toNamed<dynamic>(AppRoutes.heroDetails),
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ImageConstants()
                                          .getHeroIcon(heroModel.image),
                                      width: 60,
                                      height: 60,
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
                                                ? heroModel.name.enUs
                                                : heroModel.name.ptBr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ),
      ],
    );
  }
}

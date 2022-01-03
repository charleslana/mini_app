import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/controllers/tier_list_controller.dart';
import 'package:mini_app/src/models/app_model.dart';

class FormTierListPage extends StatelessWidget {
  const FormTierListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
    final TierListController tierListController = Get.put(TierListController());
    final List<HeroModel> empty = [];

    Widget showTierList(String text, Color color, List<HeroModel> heroModel) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 50,
              height: 100,
              color: color,
              alignment: Alignment.center,
              child: Text(text),
            ),
          ),
          if (heroModel.isEmpty)
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  'formTierListPageEmpty'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.centerLeft,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(heroModel.length, (i) {
                    final HeroModel heroModel =
                        landingController.appModel.heroes[i];

                    return SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        ImageConstants().getHeroIcon(heroModel.image),
                      ),
                    );
                  }),
                ),
              ),
            ),
        ],
      );
    }

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
                    'formTierListPageTitle'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'formTierListPageSubtitle'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: ListView.builder(
                            controller:
                                tierListController.heroesScrollController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: landingController.appModel.heroes.length,
                            itemBuilder: (context, i) {
                              final HeroModel heroModel =
                                  landingController.appModel.heroes[i];

                              return Obx(() {
                                return Draggable(
                                  data: tierListController.selectedHero,
                                  onDragStarted: () => tierListController
                                      .selectedHero.value = i + 1,
                                  onDraggableCanceled: (_, __) =>
                                      tierListController.selectedHero.value = 0,
                                  maxSimultaneousDrags: 1,
                                  feedback: Opacity(
                                    opacity: 0.5,
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset(
                                        ImageConstants()
                                            .getHeroIcon(heroModel.image),
                                      ),
                                    ),
                                  ),
                                  child: Visibility(
                                    visible:
                                        tierListController.selectedHero.value !=
                                            (i + 1),
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        ImageConstants()
                                            .getHeroIcon(heroModel.image),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: IconButton(
                              onPressed: tierListController.prevHeroes,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: IconButton(
                              onPressed: tierListController.nextHeroes,
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: ListView.builder(
                            controller:
                                tierListController.minisScrollController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: landingController.appModel.minis.length,
                            itemBuilder: (context, i) {
                              final MiniModel miniModel =
                                  landingController.appModel.minis[i];

                              return Obx(() {
                                return Draggable(
                                  data: tierListController.selectedMini,
                                  onDragStarted: () => tierListController
                                      .selectedMini.value = i + 1,
                                  onDraggableCanceled: (_, __) =>
                                      tierListController.selectedMini.value = 0,
                                  maxSimultaneousDrags: 1,
                                  feedback: Opacity(
                                    opacity: 0.5,
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset(
                                        ImageConstants()
                                            .getMiniIcon(miniModel.image),
                                      ),
                                    ),
                                  ),
                                  child: Visibility(
                                    visible:
                                        tierListController.selectedMini.value !=
                                            (i + 1),
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        ImageConstants()
                                            .getMiniIcon(miniModel.image),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: IconButton(
                              onPressed: tierListController.prevMinis,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: IconButton(
                              onPressed: tierListController.nextMinis,
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 7,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return showTierList('S', Colors.redAccent, empty);
                          },
                          onAccept: (data) => print('aceito'),
                        ),
                        showTierList('A', Colors.purple,
                            landingController.appModel.heroes),
                        showTierList('B', Colors.blue, empty),
                        showTierList('C', Colors.green, empty),
                        showTierList('D', Colors.grey, empty),
                      ],
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

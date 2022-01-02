import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/form_deck_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/deck_model.dart';
import 'package:mini_app/src/utils/utils.dart';

class FormDeckPage extends StatelessWidget {
  const FormDeckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormDeckController formDeckController = Get.put(FormDeckController());
    final LandingController landingController = Get.find();
    final FavoritesController favoritesController =
        Get.put(FavoritesController());
    const double columns = 3.2;
    const double runSpacing = 10;
    const double spacing = 10;
    final double width = (Get.width - runSpacing * (columns - 1)) / columns;

    void dialogEditDeck(int index, DeckMinisModel deckMinisModel) {
      bool value = false;

      Get.defaultDialog<dynamic>(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        radius: 10,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: formDeckController.textEditingController
                ..text = deckMinisModel.name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'utilsDialogNameDeckInput'.tr,
                hintMaxLines: 1,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (formDeckController.textEditingController.text
                    .trim()
                    .isEmpty) {
                  Utils().snackBar('utilsDialogNameDeckInputEmpty'.tr);
                  return;
                }
                if (formDeckController.textEditingController.text
                        .trim()
                        .length >
                    30) {
                  Utils().snackBar('utilsDialogNameDeckInputMaxCharacters'.tr);
                  return;
                }
                if (!Get.isSnackbarOpen) {
                  favoritesController.updateDeck(
                    index,
                    DeckMinisModel(
                      name: formDeckController.textEditingController.text
                          .trim()
                          .capitalize!,
                      heroId: deckMinisModel.heroId,
                      minisId: deckMinisModel.minisId,
                    ),
                  );
                  Get.back<dynamic>();
                  value = true;
                }
              },
              child: Text(
                'utilsDialogNameDeckButton'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ).then((_) {
        formDeckController.textEditingController.clear();
        if (value) {
          Get.back<dynamic>();
        }
        return false;
      });
    }

    void dialogSaveDeck(int heroId, List<int> minisId) {
      bool value = false;

      Get.defaultDialog<dynamic>(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        radius: 10,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: formDeckController.textEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'utilsDialogNameDeckInput'.tr,
                hintMaxLines: 1,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (formDeckController.textEditingController.text
                    .trim()
                    .isEmpty) {
                  Utils().snackBar('utilsDialogNameDeckInputEmpty'.tr);
                  return;
                }
                if (formDeckController.textEditingController.text
                        .trim()
                        .length >
                    30) {
                  Utils().snackBar('utilsDialogNameDeckInputMaxCharacters'.tr);
                  return;
                }
                if (!Get.isSnackbarOpen) {
                  favoritesController.addDeck(DeckMinisModel(
                    name: formDeckController.textEditingController.text
                        .trim()
                        .capitalize!,
                    heroId: heroId,
                    minisId: minisId,
                  ));
                  Get.back<dynamic>();
                  value = true;
                }
              },
              child: Text(
                'utilsDialogNameDeckButton'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ).then((_) {
        formDeckController.textEditingController.clear();
        if (value) {
          Get.back<dynamic>();
        }
        return false;
      });
    }

    void showHeroes() {
      Get.bottomSheet<dynamic>(
        SizedBox(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: landingController.appModel.heroes.map((hero) {
              return GestureDetector(
                onTap: () {
                  formDeckController.heroId.value = hero.id;
                  Get.back<dynamic>();
                },
                child: Image.asset(
                  ImageConstants().getHeroPortrait(hero.image),
                  height: 150,
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    void showMinis(int index) {
      Get.bottomSheet<dynamic>(
        SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: landingController.appModel.minis.map((mini) {
                if (!formDeckController.listMinis.contains(mini.id) ||
                    formDeckController.listMinis[index] == mini.id) {
                  return GestureDetector(
                    onTap: () {
                      formDeckController.listMinis[index] = mini.id;
                      Get.back<dynamic>();
                    },
                    child: Image.asset(
                      ImageConstants().getMiniPortrait(mini.image),
                      height: 150,
                    ),
                  );
                }
                return const SizedBox.shrink();
              }).toList(),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          final Iterable<int> contain =
              formDeckController.listMinis.where((element) => element > 0);
          if (formDeckController.indexEditDeck == null) {
            if (contain.isNotEmpty || formDeckController.heroId.value > 0) {
              final bool? shouldPop = await Get.defaultDialog(
                onConfirm: () {
                  Get
                    ..back<dynamic>()
                    ..back<dynamic>();
                },
                onCancel: null,
                confirmTextColor: Colors.white,
                cancelTextColor: ColorConstants.background,
                buttonColor: ColorConstants.background,
                textCancel: 'formDeckDialogTextCancel'.tr,
                textConfirm: 'formDeckDialogTextConfirm'.tr,
                title: 'formDeckDialogTitle'.tr,
                middleText: 'formDeckDialogMiddleText'.tr,
              );
              return shouldPop ?? false;
            }
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: ColorConstants.background,
          body: Stack(
            children: [
              const BackgroundAnimation(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Obx(() {
                  return Column(
                    children: [
                      const BackBar(),
                      const SizedBox(height: 20),
                      if (formDeckController.indexEditDeck != null)
                        Text(
                          'formDeckPageEditDeck'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      else
                        Text(
                          'formDeckPageCreateDeck'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: formDeckController.heroId.value > 0 &&
                            !formDeckController.listMinis.contains(0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formDeckController.indexEditDeck != null) {
                              dialogEditDeck(
                                formDeckController.indexEditDeck!,
                                DeckMinisModel(
                                  name: favoritesController
                                      .listDecks[
                                          formDeckController.indexEditDeck!]
                                      .name,
                                  heroId: formDeckController.heroId.value,
                                  minisId: [
                                    formDeckController.listMinis[0],
                                    formDeckController.listMinis[1],
                                    formDeckController.listMinis[2],
                                    formDeckController.listMinis[3],
                                    formDeckController.listMinis[4],
                                  ],
                                ),
                              );
                              return;
                            }
                            dialogSaveDeck(
                              formDeckController.heroId.value,
                              [
                                formDeckController.listMinis[0],
                                formDeckController.listMinis[1],
                                formDeckController.listMinis[2],
                                formDeckController.listMinis[3],
                                formDeckController.listMinis[4],
                              ],
                            );
                          },
                          child: Text(
                            'formDeckPageSaveDeck'.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              if (formDeckController.heroId.value > 0)
                                GestureDetector(
                                  onTap: showHeroes,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            ImageConstants().getHeroPortrait(
                                                landingController
                                                    .appModel
                                                    .heroes[formDeckController
                                                            .heroId.value -
                                                        1]
                                                    .image),
                                            height: 120,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            Utils().readLanguage(
                                                landingController
                                                    .appModel
                                                    .heroes[formDeckController
                                                            .heroId.value -
                                                        1]
                                                    .name),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                )
                              else
                                GestureDetector(
                                  onTap: showHeroes,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                    ImageConstants.heroHidden),
                                                const Positioned.fill(
                                                  child: Align(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'formDeckPageHeroTitle'.tr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 20),
                              Wrap(
                                runSpacing: runSpacing,
                                spacing: spacing,
                                alignment: WrapAlignment.center,
                                children: List.generate(
                                    formDeckController.maxMinis, (int index) {
                                  if (formDeckController.listMinis.length >
                                          index &&
                                      formDeckController.listMinis[index] > 0) {
                                    final int id = formDeckController.listMinis
                                        .elementAt(index);
                                    final MiniModel miniModel =
                                        landingController
                                            .appModel.minis[id - 1];

                                    return GestureDetector(
                                      onTap: () => showMinis(index),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: width,
                                                height: width,
                                                child: Image.asset(
                                                  ImageConstants()
                                                      .getMiniPortrait(
                                                          miniModel.image),
                                                  height: 150,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                Utils().readLanguage(
                                                    miniModel.name),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return GestureDetector(
                                    onTap: () => showMinis(index),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: width,
                                              height: width,
                                              child: Stack(
                                                children: [
                                                  Image.asset(ImageConstants
                                                      .miniHidden),
                                                  const Positioned.fill(
                                                    child: Align(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'formDeckPageMiniTitle'.tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

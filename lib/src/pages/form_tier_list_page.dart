import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:mini_app/src/components/back_bar.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/form_tier_list_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/models/tier_list_model.dart';
import 'package:mini_app/src/utils/utils.dart';

class FormTierListPage extends StatelessWidget {
  const FormTierListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
    final FormTierListController formTierListController =
        Get.put(FormTierListController());

    void dialogSaveTierList() {
      bool value = false;

      Get.defaultDialog<dynamic>(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        radius: 10,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: formTierListController.textEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'formTierListDialogInput'.tr,
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
                if (formTierListController.textEditingController.text
                    .trim()
                    .isEmpty) {
                  Utils().snackBar('formTierListDialogInputEmpty'.tr);
                  return;
                }
                if (formTierListController.textEditingController.text
                        .trim()
                        .length >
                    30) {
                  Utils().snackBar('formTierListDialogInputMaxCharacters'.tr);
                  return;
                }
                if (!Get.isSnackbarOpen) {
                  formTierListController.saveTierList();
                  Get.back<dynamic>();
                  value = true;
                }
              },
              child: Text(
                'formTierListDialogButton'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ).then((_) {
        formTierListController.textEditingController.clear();
        if (value) {
          Get.back<dynamic>();
        }
        return false;
      });
    }

    Widget tooltipRemoveMinis() {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'formTierListPageTooltip'.tr,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }

    Widget showTierList(
        TypeList typeList, Color color, List<TierListMinisModel> tierList) {
      return Obx(() {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  color: formTierListController.isMove.value
                      ? color.withOpacity(0.3)
                      : color,
                  border: formTierListController.isMove.value
                      ? const Border(top: BorderSide(color: Colors.black54))
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(typeList.toString().split('.').last),
              ),
            ),
            if (tierList.isEmpty)
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: formTierListController.isMove.value
                        ? Colors.black54.withOpacity(0.3)
                        : Colors.transparent,
                    border: formTierListController.isMove.value
                        ? const Border(top: BorderSide(color: Colors.black54))
                        : null,
                  ),
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
                  decoration: BoxDecoration(
                    color: formTierListController.isMove.value
                        ? Colors.black54.withOpacity(0.3)
                        : Colors.transparent,
                    border: formTierListController.isMove.value
                        ? const Border(top: BorderSide(color: Colors.black54))
                        : null,
                  ),
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.centerLeft,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(tierList.length, (i) {
                      final TierListMinisModel tierListMinisModel = tierList[i];
                      if (tierListMinisModel.type == TypeTierList.hero) {
                        final HeroModel heroModel = landingController
                            .appModel.heroes[tierListMinisModel.index - 1];
                        return JustTheTooltip(
                          backgroundColor: Colors.white,
                          isModal: true,
                          content: tooltipRemoveMinis(),
                          child: GestureDetector(
                            onLongPress: () =>
                                formTierListController.removeTierListHero(
                              i,
                              heroModel,
                              typeList,
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                ImageConstants().getHeroIcon(heroModel.image),
                              ),
                            ),
                          ),
                        );
                      }
                      final MiniModel miniModel = landingController
                          .appModel.minis[tierListMinisModel.index - 1];
                      return JustTheTooltip(
                        backgroundColor: Colors.white,
                        isModal: true,
                        content: tooltipRemoveMinis(),
                        child: GestureDetector(
                          onLongPress: () =>
                              formTierListController.removeTierListMini(
                            i,
                            miniModel,
                            typeList,
                          ),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              ImageConstants().getMiniIcon(miniModel.image),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
          ],
        );
      });
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (formTierListController.indexEditTierList == null) {
            if (formTierListController.listHeroes.length !=
                    landingController.appModel.heroes.length ||
                formTierListController.listMinis.length !=
                    landingController.appModel.minis.length) {
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
                textCancel: 'formTierListDialogTextCancel'.tr,
                textConfirm: 'formTierListDialogTextConfirm'.tr,
                title: 'formTierListDialogTitle'.tr,
                middleText: 'formTierListDialogMiddleText'.tr,
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
                      if (formTierListController.indexEditTierList != null)
                        Text(
                          'formTierListPageEdit'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      else
                        Text(
                          'formTierListPageCreate'.tr,
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
                      Visibility(
                        visible: formTierListController.listHeroes.length !=
                                landingController.appModel.heroes.length ||
                            formTierListController.listMinis.length !=
                                landingController.appModel.minis.length,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formTierListController.indexEditTierList !=
                                null) {
                              return;
                            }
                            dialogSaveTierList();
                          },
                          child: Text(
                            'formTierListPageSave'.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: formTierListController.listHeroes.isNotEmpty,
                        child: Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                ),
                                child: ListView.builder(
                                  controller: formTierListController
                                      .heroesScrollController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      formTierListController.listHeroes.length,
                                  itemBuilder: (context, i) {
                                    final HeroModel heroModel =
                                        formTierListController.listHeroes[i];

                                    return Obx(() {
                                      return Draggable(
                                        data: TierListMinisModel(
                                          index: heroModel.id,
                                          type: TypeTierList.hero,
                                        ),
                                        onDragStarted: () =>
                                            formTierListController
                                              ..selectedHero.value = i + 1
                                              ..isMove.value = true,
                                        onDraggableCanceled: (_, __) =>
                                            formTierListController
                                              ..selectedHero.value = 0
                                              ..isMove.value = false,
                                        onDragEnd: (_) => formTierListController
                                          ..selectedHero.value = 0
                                          ..isMove.value = false,
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
                                          visible: formTierListController
                                                  .selectedHero.value !=
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
                                    onPressed:
                                        formTierListController.prevHeroes,
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
                                    onPressed:
                                        formTierListController.nextHeroes,
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
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: formTierListController.listMinis.isNotEmpty,
                        child: Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                ),
                                child: ListView.builder(
                                  controller: formTierListController
                                      .minisScrollController,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      formTierListController.listMinis.length,
                                  itemBuilder: (context, i) {
                                    final MiniModel miniModel =
                                        formTierListController.listMinis[i];

                                    return Obx(() {
                                      return Draggable(
                                        data: TierListMinisModel(
                                          index: miniModel.id,
                                          type: TypeTierList.mini,
                                        ),
                                        onDragStarted: () =>
                                            formTierListController
                                              ..selectedMini.value = i + 1
                                              ..isMove.value = true,
                                        onDraggableCanceled: (_, __) =>
                                            formTierListController
                                              ..selectedMini.value = 0
                                              ..isMove.value = false,
                                        onDragEnd: (_) => formTierListController
                                          ..selectedMini.value = 0
                                          ..isMove.value = false,
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
                                          visible: formTierListController
                                                  .selectedMini.value !=
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
                                    onPressed: formTierListController.prevMinis,
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
                                    onPressed: formTierListController.nextMinis,
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
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 7,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            DragTarget(
                              builder: (_, __, ___) {
                                return showTierList(
                                    TypeList.S,
                                    Colors.redAccent,
                                    formTierListController.listS);
                              },
                              onAccept: (TierListMinisModel data) =>
                                  formTierListController.addTierList(
                                      data, TypeList.S),
                            ),
                            DragTarget(
                              builder: (_, __, ___) {
                                return showTierList(TypeList.A, Colors.purple,
                                    formTierListController.listA);
                              },
                              onAccept: (TierListMinisModel data) =>
                                  formTierListController.addTierList(
                                      data, TypeList.A),
                            ),
                            DragTarget(
                              builder: (_, __, ___) {
                                return showTierList(TypeList.B, Colors.blue,
                                    formTierListController.listB);
                              },
                              onAccept: (TierListMinisModel data) =>
                                  formTierListController.addTierList(
                                      data, TypeList.B),
                            ),
                            DragTarget(
                              builder: (_, __, ___) {
                                return showTierList(TypeList.C, Colors.green,
                                    formTierListController.listC);
                              },
                              onAccept: (TierListMinisModel data) =>
                                  formTierListController.addTierList(
                                      data, TypeList.C),
                            ),
                            DragTarget(
                              builder: (_, __, ___) {
                                return showTierList(TypeList.D, Colors.grey,
                                    formTierListController.listD);
                              },
                              onAccept: (TierListMinisModel data) =>
                                  formTierListController.addTierList(
                                      data, TypeList.D),
                            ),
                          ],
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

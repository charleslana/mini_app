import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_circle_avatar.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/collection_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TabMinis extends StatelessWidget {
  const TabMinis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionController collectionController =
        Get.put(CollectionController());
    final LandingController landingController = Get.put(LandingController());
    const int columnCount = 3;
    final List<Widget> chips = [];
    final List<String> options = [
      'tabMinisFilterAll'.tr,
      '2',
      '3',
      '4',
    ];
    Widget widget;

    for (int index = 0; index < options.length; index++) {
      widget = Obx(() {
        return ChoiceChip(
          selected: collectionController.filterIndex.value == index,
          label: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              options[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          avatar: Image.asset(ImageConstants.iconElixir),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: 2),
          pressElevation: 5,
          backgroundColor: ColorConstants.background,
          selectedColor: Colors.black54,
          onSelected: (_) {
            collectionController
              ..filterIndex.value = index
              ..miniTextEditingController.clear();
            landingController.filterMini(index + 1);
            FocusManager.instance.primaryFocus?.unfocus();
          },
        );
      });

      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: widget,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: collectionController.miniTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'tabMinisSearch'.tr,
                    hintMaxLines: 1,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 4,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (landingController.filterMiniList.length !=
                            landingController.appModel.minis.length) {
                          collectionController
                            ..miniTextEditingController.clear()
                            ..filterIndex.value = 0;
                          landingController.filterMiniList
                            ..clear()
                            ..addAll(landingController.appModel.minis);
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (text) {
                    if (collectionController.filterIndex.value > 0) {
                      collectionController.filterIndex.value = 0;
                      landingController.filterMini(1);
                    }
                    landingController.searchMini(text.trim());
                  }),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: chips,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: AnimationLimiter(
              child: Obx(() {
                return landingController.filterMiniList.isEmpty
                    ? Text('tabMinisSearchNotFound'.tr)
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: collectionController.scrollControllerMinis,
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columnCount,
                          childAspectRatio: Get.width / (Get.height / 1.5),
                        ),
                        itemCount: landingController.filterMiniList.length,
                        itemBuilder: (_, int index) {
                          final MiniModel miniModel =
                              landingController.filterMiniList[index];

                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: columnCount,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () => {
                                    landingController
                                      ..miniIndex.value = miniModel.id - 1,
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus(),
                                    Get.toNamed<dynamic>(AppRoutes.miniDetails),
                                  },
                                  child: Column(
                                    children: [
                                      CustomCircleAvatar(
                                        image: ImageConstants()
                                            .getMiniThumbnail(miniModel.image),
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
                                                  ? miniModel.name.enUs
                                                  : miniModel.name.ptBr,
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
      ),
    );
  }
}

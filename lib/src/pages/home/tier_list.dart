import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/controllers/form_tier_list_controller.dart';
import 'package:mini_app/src/models/tier_list_model.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';

class TierList extends StatelessWidget {
  const TierList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormTierListController formTierListController =
        Get.put(FormTierListController());

    Widget card(String text, Color color) {
      return Center(
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    void confirmRemoveTierList(int index) {
      Get.defaultDialog<dynamic>(
        onConfirm: () {
          formTierListController.removeTierList(index);
          Get.back<dynamic>();
        },
        onCancel: null,
        confirmTextColor: Colors.white,
        cancelTextColor: ColorConstants.background,
        buttonColor: ColorConstants.background,
        textCancel: 'tierListPageDialogTextCancel'.tr,
        textConfirm: 'tierListPageDialogTextConfirm'.tr,
        title: 'tierListPageDialogTitle'.tr,
        middleText: 'tierListPageDialogMiddleText'.tr,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Obx(() {
        return Column(
          children: [
            const CustomBar(),
            const SizedBox(height: 20),
            Text(
              'tierListTitle'.tr,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                formTierListController.indexEditTierList = null;
                Get.toNamed<dynamic>(AppRoutes.formTierList);
              },
              child: Text(
                'tierListButtonNew'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (formTierListController.tierListRankModel.isEmpty)
              Center(
                child: Text(
                  'tierListPageNotFound'.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            else
              AnimationLimiter(
                child: Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: formTierListController.tierListRankModel.length,
                    itemBuilder: (context, i) {
                      final TierListRankModel tierListRankModel =
                          formTierListController.tierListRankModel[i];

                      return AnimationConfiguration.staggeredList(
                        position: i,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () => {
                                formTierListController.indexEditTierList = i,
                                Get.toNamed<dynamic>(AppRoutes.formTierList),
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: GridView.count(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            crossAxisCount: 3,
                                            children: [
                                              card(
                                                tierListRankModel.listS.length
                                                    .toString(),
                                                Colors.redAccent,
                                              ),
                                              card(
                                                tierListRankModel.listA.length
                                                    .toString(),
                                                Colors.purple,
                                              ),
                                              card(
                                                tierListRankModel.listB.length
                                                    .toString(),
                                                Colors.blue,
                                              ),
                                              card(
                                                tierListRankModel.listC.length
                                                    .toString(),
                                                Colors.green,
                                              ),
                                              card(
                                                tierListRankModel.listD.length
                                                    .toString(),
                                                Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  tierListRankModel.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blueAccent,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    confirmRemoveTierList(i),
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
      }),
    );
  }
}

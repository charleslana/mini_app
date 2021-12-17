import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';

class Rank extends StatelessWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    final formatter = NumberFormat('###,###.###', 'pt_BR');

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          const CustomBar(),
          const SizedBox(height: 20),
          AnimationLimiter(
            child: Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: landingController.appModel.rank.length,
                itemBuilder: (context, i) {
                  final RankModel rankModel =
                      landingController.appModel.rank[i];

                  return AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'rankTrophies'.trParams({
                                      'trophies': formatter
                                          .format(rankModel.trophies)
                                          .toString()
                                    }),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'languageCode'.tr == 'en'
                                        ? rankModel.name.enUs
                                        : rankModel.name.ptBr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: landingController.appModel.maps
                                          .map((map) {
                                        if (rankModel.trophies >=
                                            map.trophiesRequired) {
                                          return Tooltip(
                                            triggerMode: TooltipTriggerMode.tap,
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            preferBelow: true,
                                            verticalOffset: 20,
                                            message: 'languageCode'.tr == 'en'
                                                ? 'rankMapTooltip'.trParams({
                                                    'name': map.name.enUs,
                                                    'trophies': formatter
                                                        .format(map
                                                            .trophiesRequired)
                                                        .toString(),
                                                    'description':
                                                        map.description?.enUs ??
                                                            ''
                                                  })
                                                : 'rankMapTooltip'.trParams({
                                                    'name': map.name.ptBr,
                                                    'trophies': formatter
                                                        .format(map
                                                            .trophiesRequired)
                                                        .toString(),
                                                    'description':
                                                        map.description?.ptBr ??
                                                            ''
                                                  }),
                                            child: Image.asset(
                                              ImageConstants()
                                                  .getMaps(map.image),
                                              height: 100,
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      }).toList(),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}

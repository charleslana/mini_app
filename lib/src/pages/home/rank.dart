import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/utils/utils.dart';

class Rank extends StatelessWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    final NumberFormat formatter = NumberFormat('###,###.###', 'pt_BR');

    Widget tooltipBoard(BoardsModel boardsModel) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Utils().readLanguage(boardsModel.name),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              'rankBoardTrophiesRequired'.trParams(
                  {'trophies': boardsModel.trophiesRequired.toString()}),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              Utils().readLanguage(boardsModel.description),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    }

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
          Text(
            'rankTitle'.tr,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
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
                                    Utils().readLanguage(rankModel.name),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: landingController
                                          .appModel.boards
                                          .map((board) {
                                        if (rankModel.trophies >=
                                            board.trophiesRequired) {
                                          return JustTheTooltip(
                                            backgroundColor: Colors.white,
                                            margin: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            isModal: true,
                                            content: tooltipBoard(board),
                                            child: Image.asset(
                                              ImageConstants()
                                                  .getBoards(board.image),
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

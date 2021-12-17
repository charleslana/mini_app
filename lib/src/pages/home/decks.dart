import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';

class Decks extends StatelessWidget {
  const Decks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    landingController.appModel.deck
        .sort((DeckModel a, DeckModel b) => a.rank.compareTo(b.rank));

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
            'deckTitle'.tr,
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
                itemCount: landingController.appModel.deck.length,
                itemBuilder: (context, i) {
                  final DeckModel deckModel =
                      landingController.appModel.deck[i];

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
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'deckRank'.trParams({
                                          'rank': deckModel.rank.toString()
                                        }),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Image.asset(
                                        ImageConstants()
                                            .getIcon(deckModel.image),
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      'languageCode'.tr == 'en'
                                          ? deckModel.name.enUs
                                          : deckModel.name.ptBr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurpleAccent,
                                      ),
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

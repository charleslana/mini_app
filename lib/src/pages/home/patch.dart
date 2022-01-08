import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/app_model.dart';
import 'package:mini_app/src/utils/utils.dart';

class Patch extends StatelessWidget {
  const Patch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    DateFormat formatter;
    switch ('languageCode'.tr) {
      case 'en':
        formatter = DateFormat('yyyy/MM/dd');
        break;
      case 'pt':
        formatter = DateFormat('dd/MM/yyyy');
        break;
      default:
        formatter = DateFormat('dd/MM/yyyy');
    }
    landingController.appModel.patch
        .sort((PatchModel a, PatchModel b) => b.id.compareTo(a.id));

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
            'patchTitle'.tr,
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
                itemCount: landingController.appModel.patch.length,
                itemBuilder: (context, i) {
                  final PatchModel patchModel =
                      landingController.appModel.patch[i];
                  final DateTime date =
                      DateFormat('yyyy/MM/dd').parse(patchModel.date);
                  final String formatted = formatter.format(date);

                  return AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    formatted,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    Utils()
                                        .readLanguage(patchModel.description),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.indigoAccent,
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

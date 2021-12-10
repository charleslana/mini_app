import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/loading_controller.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: loadingController.offsetAnimation,
          child: Image.asset(
            ImageConstants.iconBowler,
            height: 80,
          ),
        ),
        SlideTransition(
          position: loadingController.offsetAnimation,
          child: Image.asset(
            ImageConstants.iconMiner,
            height: 80,
          ),
        ),
      ],
    );
  }
}

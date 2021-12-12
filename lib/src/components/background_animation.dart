import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:simple_animations/simple_animations.dart';

class BackgroundAnimation extends StatelessWidget {
  const BackgroundAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoopAnimation<double>(
          duration: const Duration(seconds: 10),
          tween: Tween(begin: 0, end: Get.width),
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(value, 0),
              child: child,
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                image: AssetImage(ImageConstants.background),
              ),
            ),
          ),
        ),
        LoopAnimation<double>(
          duration: const Duration(seconds: 10),
          tween: Tween(begin: -Get.width, end: 0),
          builder: (context, child, value) {
            return Transform.translate(
              offset: Offset(value, 0),
              child: child,
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                image: AssetImage(ImageConstants.background),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

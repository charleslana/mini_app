import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/controllers/app_bottom_navigation_bar_controller.dart';
import 'package:simple_animations/simple_animations.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.bottomNavigationBarItem,
    required this.widgets,
    Key? key,
  }) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavigationBarItem;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    final AppBottomNavigationBarController appBottomNavigationBarController =
        Get.put(AppBottomNavigationBarController());

    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.background,
        body: Stack(
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
            widgets
                .elementAt(appBottomNavigationBarController.currentIndex.value),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: BottomNavigationBar(
            currentIndex: appBottomNavigationBarController.currentIndex.value,
            onTap: appBottomNavigationBarController.changeView,
            items: bottomNavigationBarItem,
          ),
        ),
      );
    });
  }
}

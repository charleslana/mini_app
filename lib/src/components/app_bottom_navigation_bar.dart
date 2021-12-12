import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/background_animation.dart';
import 'package:mini_app/src/constants/color_constants.dart';
import 'package:mini_app/src/controllers/app_bottom_navigation_bar_controller.dart';

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
            const BackgroundAnimation(),
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

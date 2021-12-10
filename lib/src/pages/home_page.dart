import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_app/src/components/app_bottom_navigation_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/pages/home/collection.dart';
import 'package:mini_app/src/pages/home/favorites.dart';
import 'package:mini_app/src/pages/home/patch.dart';
import 'package:mini_app/src/pages/home/rank.dart';
import 'package:mini_app/src/pages/home/units.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        child: AppBottomNavigationBar(
          widgets: const [
            Collection(),
            Units(),
            Favorites(),
            Rank(),
            Patch(),
          ],
          bottomNavigationBarItem: [
            appBottomNavigationBarItem(
                ImageConstants.iconSkeletonGuard, 'Collection'),
            appBottomNavigationBarItem(ImageConstants.iconPekka, 'Units'),
            appBottomNavigationBarItem(
                ImageConstants.iconLumberjack, 'Favorites'),
            appBottomNavigationBarItem(ImageConstants.iconValkyrie, 'Rank'),
            appBottomNavigationBarItem(ImageConstants.iconArcher, 'Patch'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem appBottomNavigationBarItem(
      String image, String title) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        height: 38,
      ),
      label: title,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mini_app/src/components/app_bottom_navigation_bar.dart';
import 'package:mini_app/src/constants/image_constants.dart';
import 'package:mini_app/src/pages/home/collection.dart';
import 'package:mini_app/src/pages/home/decks.dart';
import 'package:mini_app/src/pages/home/favorites.dart';
import 'package:mini_app/src/pages/home/patch.dart';
import 'package:mini_app/src/pages/home/rank.dart';

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
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AppBottomNavigationBar(
            widgets: const [
              Collection(),
              Decks(),
              Favorites(),
              Rank(),
              Patch(),
            ],
            bottomNavigationBarItem: [
              appBottomNavigationBarItem(
                  ImageConstants.iconCollection, 'homePageCollection'.tr),
              appBottomNavigationBarItem(
                  ImageConstants.iconDecks, 'homePageDecks'.tr),
              appBottomNavigationBarItem(
                  ImageConstants.iconFavorites, 'homePageFavorites'.tr),
              appBottomNavigationBarItem(
                  ImageConstants.iconBoards, 'homePageRank'.tr),
              appBottomNavigationBarItem(
                  ImageConstants.iconPatch, 'homePagePatch'.tr),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/app_button.dart';
import 'package:mini_app/src/controllers/favorites_controller.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';

class TabFavoritesDecks extends StatelessWidget {
  const TabFavoritesDecks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return Obx(() {
      return Column(
        children: [
          AppButton(
            text: 'favoritesDeckNewDeck'.tr,
            color: Colors.black54,
            onPressed: () => {},
          ),
          const SizedBox(height: 20),
          if (favoritesController.listDecksFavorites.isEmpty)
            Center(
              child: Text(
                'favoritesDeckNotFound'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            )
          else
            const Text('Tem favorito'),
        ],
      );
    });
  }
}

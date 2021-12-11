import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/components/custom_bar.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBar(),
        const SizedBox(height: 20),
        Center(
          child: Text('favoritesNotFound'.tr),
        ),
      ],
    );
  }
}

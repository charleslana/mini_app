import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mini_app/src/components/custom_bar.dart';
import 'package:mini_app/src/controllers/landing_controller.dart';
import 'package:mini_app/src/models/mini_model.dart';

class Patch extends StatelessWidget {
  const Patch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.find();
    initializeDateFormatting();
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    if ('languageCode'.tr == 'en') {
      formatter = DateFormat('yyyy/MM/dd');
    }

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
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: landingController.miniModel.patch.length,
              itemBuilder: (context, i) {
                final Patches patch = landingController.miniModel.patch[i];
                final DateTime date =
                    DateFormat('yyyy/MM/dd').parse(patch.date);
                final String formatted = formatter.format(date);

                return Card(
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
                            'languageCode'.tr == 'en'
                                ? patch.description.enUs
                                : patch.description.ptBr,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.indigoAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

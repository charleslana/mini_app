import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mini_app/src/constants/theme_constants.dart';
import 'package:mini_app/src/routes/app_route_generator.dart';
import 'package:mini_app/src/services/language_service.dart';
import 'package:mini_app/src/translation/app_translation.dart';

Future<void> main() async {
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DB Mini',
      translationsKeys: AppTranslation().translationsKeys,
      locale: LanguageService().locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeConstants().theme,
      darkTheme: ThemeConstants().theme,
      initialRoute: AppRoutes.splashscreen,
      defaultTransition: Transition.fade,
      onGenerateRoute: AppRouteGenerator().generateRoute,
    );
  }
}

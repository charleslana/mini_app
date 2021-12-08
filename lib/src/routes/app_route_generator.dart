import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/pages/landing_page.dart';
import 'package:mini_app/src/pages/splashscreen_page.dart';

part 'app_routes.dart';

class AppRouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashscreen:
        return GetPageRoute(
          page: () => const SplashscreenPage(),
          settings: settings,
        );
      case AppRoutes.landing:
        return GetPageRoute(
          page: () => const LandingPage(),
          settings: settings,
        );
      default:
        return GetPageRoute(
          page: () => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}

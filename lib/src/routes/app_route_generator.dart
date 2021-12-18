import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/src/pages/deck_details_page.dart';
import 'package:mini_app/src/pages/hero_details_page.dart';
import 'package:mini_app/src/pages/home_page.dart';
import 'package:mini_app/src/pages/landing_page.dart';
import 'package:mini_app/src/pages/mini_details_page.dart';
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
      case AppRoutes.home:
        return GetPageRoute(
          page: () => const HomePage(),
          settings: settings,
          transition: Transition.rightToLeft,
        );
      case AppRoutes.heroDetails:
        return GetPageRoute(
          page: () => const HeroDetailsPage(),
          settings: settings,
          transition: Transition.leftToRight,
        );
      case AppRoutes.miniDetails:
        return GetPageRoute(
          page: () => const MiniDetailsPage(),
          settings: settings,
          transition: Transition.leftToRight,
        );
      case AppRoutes.deckDetails:
        return GetPageRoute(
          page: () => const DeckDetailsPage(),
          settings: settings,
          transition: Transition.leftToRight,
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

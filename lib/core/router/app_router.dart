import 'package:flutter/material.dart';
import 'package:vid_fetch/core/router/page_transition.dart';

import '../../presentation/view/home.dart';
import '../../presentation/view/splash.dart';
import '../utils/constants/routes.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return PageTransitionManager.fadeTransition(const SplashScreen());

      case RouteManager.home:
        return PageTransitionManager.fadeTransition(const HomeScreen());

      default:
        return null;
    }
  }
}

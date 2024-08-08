import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../middlewares/middleware.dart';
import '../middlewares/screens/not_found_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'register_routes.dart';

class AppRouter {
  static final FluroRouter instance = FluroRouter();

  static void defineRoutes() {
    // Define Route not found
    instance.notFoundHandler = _notFoundHandler();

    // Define Route splash
    instance.define(
      SplashScreen.path,
      handler: _splashHandler(),
      transitionType: TransitionType.none,
    );

    // Define Route base
    instance.define(
      Middleware.path,
      handler: _baseHandler(),
      transitionType: TransitionType.none,
    );

    for (var route in registerRoutes) {
      instance.define(
        route.path,
        transitionType: TransitionType.none,
        handler: _screenHandler(route.page),
      );
    }
  }

  static Handler _splashHandler() {
    return Handler(handlerFunc: (context, params) {
      return const SplashScreen();
    });
  }

  static Handler _baseHandler() {
    return Handler(handlerFunc: (context, params) {
      return const Middleware();
    });
  }

  static Handler _screenHandler(Widget page) {
    return Handler(handlerFunc: (context, params) {
      return page;
    });
  }

  static Handler _notFoundHandler() {
    return Handler(handlerFunc: (context, params) {
      return const NotFoundScreen();
    });
  }
}

import 'package:flutter/material.dart';

class NavigatorService {
  const NavigatorService();

  static void pop(BuildContext context) {
    return Navigator.pop(context);
  }

  static void popToFirstIndex(BuildContext context) {
    return Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static Future<dynamic> push({
    required BuildContext context,
    required String route,
    Object? data,
  }) {
    return Navigator.pushNamed(context, route, arguments: data);
  }

  static Future<dynamic> pushReplace({
    required BuildContext context,
    required String route,
    Object? data,
  }) {
    return Navigator.pushReplacementNamed(context, route, arguments: data);
  }

  static Future<dynamic> pushAndRemoveUntil({
    required BuildContext context,
    required String route,
    Object? data,
  }) {
    return Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (r) {
        return false;
      },
      arguments: data,
    );
  }
}

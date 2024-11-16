import 'dart:async';

import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../app/configs/environment_config.dart';
import '../services/app_service.dart';

class AppProvider with ChangeNotifier {
  final Environment environment;

  AppProvider(this.environment) {
    _init();
  }

  static final AppService _appService = AppService();

  Future<void> _init() async {
    AppRouter.defineRoutes();

    appVersion = await _appService.getAppVersion();
  }

  Environment get env => environment;

  Brightness _moodTheme = Brightness.light;
  Brightness get moodTheme => _moodTheme;
  set moodTheme(Brightness value) {
    _moodTheme = value;
    notifyListeners();
  }

  bool _isHovered = false;
  bool get isHovered => _isHovered;
  set isHovered(bool value) {
    _isHovered = value;
    notifyListeners();
  }

  String? _appVersion;
  String? get appVersion => _appVersion;
  set appVersion(String? value) {
    _appVersion = value;
    notifyListeners();
  }
}

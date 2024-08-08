import 'package:flutter/material.dart';

class AuthAppProvider with ChangeNotifier {
  AuthAppProvider() {
    _init();
  }

  Future<void> _init() async {
    // authToken = 'authToken';
  }

  void updateState() {
    notifyListeners();
  }

  String? _authToken;
  String? get authToken => _authToken;

  set authToken(String? value) {
    _authToken = value;
    notifyListeners();
  }
}

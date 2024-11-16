import 'package:flutter/material.dart';

import '../../../app/utils/session_util.dart';

class AuthAppProvider with ChangeNotifier {

  AuthAppProvider() {
    _init();
  }

  static final SessionUtil _sessionUtil = SessionUtil();
  
  Future<void> _init() async {
    await _sessionUtil.readSession(_sessionUtil.authKey).then((value) {
      _authToken = value;
    });
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

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  set emailController(TextEditingController value) {
    _emailController = value;
    notifyListeners();
  }

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  set passwordController(TextEditingController value) {
    _passwordController = value;
    notifyListeners();
  }

  FocusNode _passwordFocus = FocusNode();
  FocusNode get passwordFocus => _passwordFocus;

  set passwordFocus(FocusNode value) {
    _passwordFocus = value;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }
}

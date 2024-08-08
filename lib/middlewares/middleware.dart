import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/providers/auth_app_provider.dart';

class Middleware extends StatelessWidget {
  static const String path = '/checker';
  static const String name = 'Checker';

  const Middleware({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthAppProvider>(
      builder: (context, auth, child) {
        if (auth.authToken == null) {
          return const LoginScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}

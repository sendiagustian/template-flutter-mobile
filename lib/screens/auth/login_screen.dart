import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String path = '/login';
  static const String name = 'Login Screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String path = '/register';
  static const String name = 'Register Screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Register Screen'),
      ),
    );
  }
}

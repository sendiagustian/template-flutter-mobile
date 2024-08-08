import 'package:flutter/material.dart';

import '../../core/constants/enums/type_enums.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/info_widget.dart';

class DisabledAccountScreen extends StatelessWidget {
  const DisabledAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfoWidget.noData(
        title: 'Ups!',
        subtitle: 'Akun kamu tidak aktif, coba kontak admin untuk masalah ini.',
        button: ButtonWidget.ractangle(
          type: ButtonType.primary,
          text: 'Hubungi Admin',
          leftIcon: Icons.telegram_rounded,
          onPressed: () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/constants/enums/type_enums.dart';
import '../../common/widgets/button_widget.dart';
import '../../common/widgets/info_widget.dart';

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

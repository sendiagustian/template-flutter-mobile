import 'package:flutter/material.dart';

import '../../core/widgets/app_bar_widget.dart';
import '../../core/widgets/info_widget.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.gradient(title: 'Error Navigasi'),
      body: InfoWidget.noData(
        title: 'Ups!',
        subtitle: 'Ada kesalahan navigasi',
      ),
    );
  }
}

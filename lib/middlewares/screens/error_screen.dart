import 'package:flutter/material.dart';

import '../../core/widgets/app_bar_widget.dart';
import '../../core/widgets/info_widget.dart';

class ErrorScreen extends StatelessWidget {
  final bool enableAppBar;
  final bool? enableButton;
  const ErrorScreen({
    super.key,
    required this.enableAppBar,
    this.enableButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: enableAppBar ? AppBarWidget.gradient(title: 'Ada Error') : null,
      body: InfoWidget.noData(
        title: 'Ups!',
        subtitle: 'Ada kesalahan teknis, tutup dan bukan kembali aplikasi.',
      ),
    );
  }
}

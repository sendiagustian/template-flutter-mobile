import 'package:flutter/material.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/info_widget.dart';

class ErrorScreen extends StatelessWidget {
  final bool enableAppBar;
  final bool enableButton;
  const ErrorScreen({
    super.key,
    this.enableAppBar = false,
    this.enableButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: enableAppBar ? AppBarWidget.basic(title: 'Ada Error') : null,
      body: InfoWidget.noData(
        title: 'Ups!',
        subtitle: 'Ada kesalahan teknis, tutup dan bukan kembali aplikasi.',
      ),
    );
  }
}

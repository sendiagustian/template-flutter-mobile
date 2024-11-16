import 'package:flutter/material.dart';

import '../../app/themes/app_theme.dart';
import '../../common/services/app_service.dart';

class VersionInfoComponent extends StatelessWidget {
  final double verticalMargin;
  const VersionInfoComponent({super.key, this.verticalMargin = 128});

  static final AppService _appService = AppService();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo_name.png', width: 200),
            AppTheme.spacing.smallY,
            FutureBuilder<String>(
              future: _appService.getAppVersion(),
              builder: (context, snapshot) {
                String info = snapshot.data ?? '-';
                return Text(
                  'Version $info',
                  textAlign: TextAlign.center,
                  style: AppTheme.typography.labelLarge,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

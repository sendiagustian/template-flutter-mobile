import 'package:flutter/material.dart';

import '../../common/constants/enums/type_enums.dart';
import '../../app/themes/app_theme.dart';
import '../../common/widgets/button_widget.dart';

class MaintenanceScreen extends StatelessWidget {
  final dynamic Function() onPressed;

  const MaintenanceScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.geometry.medium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsetsDirectional.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset.zero,
                    )
                  ],
                ),
                child: Center(
                  child: Image.asset('assets/icons/icon_app.png'),
                ),
              ),
            ),
            AppTheme.spacing.customY(40),
            Text(
              'Maintenance time',
              style: AppTheme.typography.headlineMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            AppTheme.spacing.mediumY,
            Text(
              'Monica currently is under maintenance\nPlease contact your support',
              style: AppTheme.typography.bodyMedium,
              textAlign: TextAlign.center,
            ),
            AppTheme.spacing.customY(24),
            ButtonWidget.ractangle(
              text: 'Click me',
              type: ButtonType.primary,
              width: AppTheme.double.screenW(context),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/constants/enums/type_enums.dart';
import '../../app/themes/app_theme.dart';
import '../../common/widgets/button_widget.dart';

class WaitingApprovalScreen extends StatelessWidget {
  final bool formRegistered;
  final dynamic Function() onPressed;

  const WaitingApprovalScreen({super.key, required this.formRegistered, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String message;

    if (formRegistered) {
      message = 'Account registration has been sent, confirm with admin for approval';
    } else {
      message = 'Account reactivation request is being processed, admin confirmation?';
    }

    return Scaffold(
      body: Container(
        padding: AppTheme.geometry.medium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/waiting.png',
                width: 280,
              ),
            ),
            AppTheme.spacing.customY(40),
            Center(
              child: Text(
                'Waiting Approval',
                style: AppTheme.typography.headlineMedium.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            AppTheme.spacing.mediumY,
            Center(
              child: Text(
                message,
                style: AppTheme.typography.bodyMedium,
                textAlign: TextAlign.center,
              ),
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

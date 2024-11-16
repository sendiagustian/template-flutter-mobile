import 'package:flutter/material.dart';

import '../../app/themes/app_theme.dart';
import 'customs/app_bar_custom_widget.dart';

class AppBarWidget {
  static PreferredSizeWidget gradient({
    Key? key,
    required String title,
    bool automaticallyImplyLeading = true,
    TextStyle? titleStyle,
    bool? centerTitle = true,
    Widget? leading,
    double elevation = 2.0,
    List<Widget>? actions,
  }) {
    return AppBarCustomWidget(
      key: key,
      title: Text(
        title,
        style: titleStyle ?? AppTheme.typography.titleLarge.copyWith(color: Colors.white),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      backgroundGradient: AppTheme.colors.gradientPrimary,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }

  static PreferredSizeWidget basic({
    Key? key,
    required String title,
    TextStyle? titleStyle,
    bool automaticallyImplyLeading = true,
    bool? centerTitle = true,
    Widget? leading,
    double elevation = 1.0,
    Color? backgroundColor,
    Gradient? backgroundGradient,
    List<Widget>? actions,
  }) {
    return AppBarCustomWidget(
      key: key,
      title: Text(
        title,
        style: titleStyle ?? AppTheme.typography.titleLarge,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      backgroundColor: backgroundColor,
      backgroundGradient: backgroundGradient,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }
}

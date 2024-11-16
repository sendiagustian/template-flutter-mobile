import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool? centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final List<Widget>? actions;
  final double elevation;
  final bool automaticallyImplyLeading;

  const AppBarCustomWidget({
    super.key,
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.backgroundGradient,
    this.automaticallyImplyLeading = true,
    this.elevation = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    assert((backgroundColor == null && backgroundGradient != null) ||
        (backgroundColor != null && backgroundGradient == null) ||
        (backgroundColor == null && backgroundGradient == null));

    return Container(
      decoration: BoxDecoration(
        color: backgroundGradient != null ? null : backgroundColor ?? AppBarTheme.of(context).backgroundColor,
        gradient: backgroundColor != null ? null : backgroundGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.1),
            spreadRadius: elevation,
            blurRadius: elevation + 3,
            offset: Offset(0, elevation),
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        leading: leading,
        elevation: 0.0,
        title: title,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

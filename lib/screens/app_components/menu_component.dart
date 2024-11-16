import 'package:flutter/material.dart';

import '../../app/themes/app_theme.dart';

class MenuComponent extends StatelessWidget {
  final String title;
  final String assetIcon;
  final void Function()? onTap;

  const MenuComponent({super.key, required this.title, required this.assetIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppTheme.radius.small,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTheme.radius.small,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black12;
            }
            return null;
          },
        ),
        child: Container(
          padding: AppTheme.geometry.small,
          decoration: BoxDecoration(
            borderRadius: AppTheme.radius.small,
          ),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                padding: AppTheme.geometry.customAll(4),
                decoration: BoxDecoration(
                  borderRadius: AppTheme.radius.circle,
                  color: AppTheme.colors.primary.withOpacity(.1),
                ),
                child: ClipRRect(
                  borderRadius: AppTheme.radius.circle,
                  child: Image.asset(
                    assetIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
              ),
              AppTheme.spacing.smallY,
              Text(title, textAlign: TextAlign.center, style: AppTheme.typography.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}

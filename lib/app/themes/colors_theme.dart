import 'package:flutter/material.dart';

class ColorsTheme {
  const ColorsTheme();

  Color get primary => const Color(0xFF37AFE1);
  Color get secondary => const Color(0xFF4CC9FE);
  Color get accent => const Color(0xFFF5F4B3);
  Color get tertiary => const Color(0xFFFFFECB);

  Color get white => const Color(0xFFFEFEFE);
  Color get grey => const Color(0xFFACACAC);
  Color get red => const Color(0xFFEF476F);
  Color get yellow => const Color(0xFFFFD166);

  Color get bgDark => const Color(0xFF242C3B);
  Color get bgLight => const Color(0xFFF2F6FC);

  Color get divider => const Color(0xFFBDBDBD);

  Color get textPrimary => const Color(0xFF222834);
  Color get textSecondary => const Color(0xFF353F54);

  LinearGradient get gradientPrimary {
    return LinearGradient(
      stops: const [0.0, 1.0],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1, 0.0),
      colors: [primary, secondary],
      tileMode: TileMode.clamp,
    );
  }

  LinearGradient get gradientBgScreen {
    return LinearGradient(
      colors: [
        primary.withOpacity(0.45),
        bgLight,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0, 0.6],
    );
  }

  LinearGradient get gradientBgAvatar {
    return LinearGradient(
      colors: [
        primary.withOpacity(0.45),
        Colors.grey[200]!,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0, 0.9],
    );
  }

  LinearGradient get gradientGrey {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black12,
      ],
    );
  }
}

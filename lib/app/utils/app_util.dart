// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../common/constants/enums/app_enums.dart';

AppMode mode() {
  if (FlavorConfig.instance.name == 'PROD') {
    return AppMode.prod;
  }
  return AppMode.dev;
}

String enumToString(Object enumValue) {
  return enumValue.toString().split('.').last;
}

String generateRandomToken({int length = 32}) {
  final secureRandom = Random.secure();
  final values = List<int>.generate(
    length,
    (index) => secureRandom.nextInt(256),
  );
  final token = base64UrlEncode(values);
  return token;
}

double convertSarToIdr({required double sar, required double kurs}) {
  return sar * kurs;
}

void copyToClipboard(
  BuildContext context,
  String text,
  String messageInfo, {
  bool noSnackBar = false,
}) async {
  await Clipboard.setData(
    ClipboardData(
      text: text,
    ),
  ).then((_) {
    if (!noSnackBar) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(messageInfo),
        ),
      );
    }
  });
}

T getArgumentData<T>(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments as T;
}

bool isLargeScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isDesktop;
}

bool isMediumScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isTablet;
}

bool isSmallScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isMobile;
}

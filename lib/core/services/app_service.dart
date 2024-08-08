import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/enums/app_enums.dart';
import '../constants/enums/type_enums.dart';
import '../themes/app_theme.dart';
import '../utils/app_util.dart';
import '../widgets/button_widget.dart';
import '../widgets/modal_bottom_widget.dart';

class AppService {
  Future<String> getAppVersion() async {
    String current;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    current = '${packageInfo.version}(+${packageInfo.buildNumber})';
    return current;
  }

  Future<void> showModalSheetHelpDesk(BuildContext context) async {
    ModalBottomWidget.basic(
      context: context,
      useFullScreen: false,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_name.png',
                    width: 100,
                  ),
                  AppTheme.spacing.mediumY,
                  FutureBuilder<String>(
                    future: getAppVersion(),
                    builder: (context, snapshot) {
                      String info = snapshot.data ?? '-';
                      return Text(
                        info,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Pusat Bantuan dan Informasi',
            style: AppTheme.typography.titleLarge,
          ),
          AppTheme.spacing.mediumY,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Colors.grey[500],
              ),
              AppTheme.spacing.smallX,
              const Text('sendistudio.id@gmail.com')
            ],
          ),
          AppTheme.spacing.mediumY,
          const Text(
            'Untuk bantuan lebih lanjut, jangan ragu untuk menghubungi kami melalui email. Tim kami siap membantu Anda dengan pertanyaan atau masalah apa pun yang Anda miliki.',
            textAlign: TextAlign.center,
          ),
          AppTheme.spacing.mediumY,
          ButtonWidget.ractangle(
            text: 'Kirim Email',
            type: ButtonType.primary,
            width: AppTheme.double.screenW(context),
            onPressed: () {
              final Uri email = Uri(
                scheme: 'mailto',
                path: 'sendistudio.id@gmail.com',
              );
              launchUrl(email);
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Future<void> showModalSheetRatingApp(BuildContext context) async {
    ModalBottomWidget.basic(
      context: context,
      useFullScreen: false,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_name.png',
                    width: 100,
                  ),
                  AppTheme.spacing.mediumY,
                  FutureBuilder<String>(
                    future: getAppVersion(),
                    builder: (context, snapshot) {
                      String info = snapshot.data ?? '-';
                      return Text(
                        info,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Beri Kami Penilaian',
            style: AppTheme.typography.titleLarge,
          ),
          AppTheme.spacing.mediumY,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: 40,
                color: AppTheme.colors.yellow,
              );
            }),
          ),
          AppTheme.spacing.mediumY,
          const Text(
            'Bantu kami meningkatkan layanan Aplikasi Khidma dengan memberikan penilaian dan ulasan Anda di Google Play Store atau App Store. Terima kasih atas dukungan Anda!',
            textAlign: TextAlign.center,
          ),
          AppTheme.spacing.mediumY,
          ButtonWidget.ractangle(
            text: 'Beri Penilaian',
            type: ButtonType.primary,
            width: AppTheme.double.screenW(context),
            onPressed: () => goToStore(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void goToStore() async {
    String appleStoreUrl = 'https://apps.apple.com/app/{ID}';
    String googlePlayUrl = 'https://play.google.com/store/apps/details?id={ID}';

    if (mode() == AppMode.dev) {
      appleStoreUrl = 'https://testflight.apple.com/join/{ID}';
    }

    if (Platform.isAndroid) {
      Uri url = Uri.parse(googlePlayUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isIOS) {
      Uri url = Uri.parse(appleStoreUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

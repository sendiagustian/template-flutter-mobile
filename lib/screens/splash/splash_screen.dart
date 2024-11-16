import 'dart:async';

import 'package:flutter/material.dart';
import '../../app/themes/app_theme.dart';
import '../../common/services/app_service.dart';
import '../../common/widgets/info_widget.dart';
import '../../routes/services/navigator_service.dart';
import '../../middlewares/middleware.dart';

class SplashScreen extends StatefulWidget {
  static const path = '/';
  static const name = 'Splash';

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  static final AppService _appService = AppService();

  late AnimationController animationController;
  late Animation<double> animation;
  bool showLoading = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1900,
      ),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    animationController.forward();

    Future.delayed(const Duration(milliseconds: 1900), () {
      setState(() {
        showLoading = true;
      });
    });

    startTimeSplash();

    super.initState();
  }

  startTimeSplash() async {
    var duration = const Duration(milliseconds: 4000);
    return Timer(duration, () {
      NavigatorService.pushReplace(
        context: context,
        route: Middleware.path,
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appService.setMoodTheme(Brightness.dark);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: ScaleTransition(
              scale: animation,
              child: SizedBox(
                height: 130,
                width: AppTheme.double.screenW(context) * .8,
                child: Image.asset(
                  'assets/images/logo_name.png',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 72,
            left: 0,
            right: 0,
            child: Builder(
              builder: (context) {
                if (showLoading) {
                  return InfoWidget.loadingData();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

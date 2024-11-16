import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/themes/app_theme.dart';
import '../../app/utils/session_util.dart';
import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/customs/nav_bottom_bar_custom_widget.dart';
import '../auth/providers/auth_app_provider.dart';
import 'providers/wrapper_provider.dart';

class WrapperScreen extends StatelessWidget {
  static const String path = '/wrapper';
  static const String name = 'Wrapper';

  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => exit(0),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WrapperProvider()),
        ],
        child: Scaffold(
          appBar: AppBarWidget.gradient(
            centerTitle: false,
            title: 'Template App',
            automaticallyImplyLeading: false,
            actions: [
              Consumer<AuthAppProvider>(builder: (_, authAppProvider, __) {
                return IconButton(
                  icon: const Icon(Icons.logout_rounded, color: Colors.white),
                  onPressed: () async {
                    authAppProvider.authToken = null;
                    SessionUtil().clearSession();
                  },
                );
              }),
            ],
          ),
          body: Consumer<WrapperProvider>(
            builder: (_, wrapperProvider, __) {
              return PageView(
                controller: wrapperProvider.pageController,
                onPageChanged: (index) {
                  wrapperProvider.currentIndex = index;
                },
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Center(child: Text('Beranda')),
                  Center(child: Text('Maps')),
                  Center(child: Text('Article')),
                  Center(child: Text('Profile')),
                ],
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 3,
            tooltip: 'Action',
            shape: RoundedRectangleBorder(borderRadius: AppTheme.radius.circle),
            backgroundColor: AppTheme.colors.primary,
            child: Image.asset(
              'assets/images/logo_white.png',
              width: 30,
            ),
            onPressed: () async {},
          ),
          bottomNavigationBar: Consumer<WrapperProvider>(
            builder: (_, wrapperProvider, __) {
              return NavBottomBarCustomWidget(
                height: 65,
                unselectedColor: Colors.grey,
                selectedColor: AppTheme.colors.primary,
                backgroundColor: Colors.white,
                notchedShape: const CircularNotchedRectangle(),
                selected: wrapperProvider.currentIndex,
                onTabSelected: (index) {
                  wrapperProvider.pageController.jumpToPage(index);
                },
                items: [
                  NavBottomBarCustomItem(
                    iconData: Icons.home_filled,
                    text: 'Beranda',
                  ),
                  NavBottomBarCustomItem(
                    iconData: Icons.route_rounded,
                    text: 'Maps',
                  ),
                  NavBottomBarCustomItem(
                    iconData: Icons.menu_book_rounded,
                    text: 'Article',
                  ),
                  NavBottomBarCustomItem(
                    iconData: Icons.person_rounded,
                    text: 'Profile',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

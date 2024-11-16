import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/utils/session_util.dart';
import '../../common/constants/enums/type_enums.dart';
import '../../common/providers/app_provider.dart';
import '../../app/themes/app_theme.dart';
import '../../common/services/app_service.dart';
import '../../common/widgets/button_widget.dart';
import '../../common/widgets/input_widget.dart';
import '../app_components/version_info_component.dart';
import 'providers/auth_app_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String path = '/login';
  static const String name = 'Login Screen';

  const LoginScreen({super.key});

  static final AppService _appService = AppService();

  @override
  Widget build(BuildContext context) {
    _appService.setMoodTheme(Brightness.dark);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.colors.gradientBgScreen,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTheme.spacing.customY(40),
              Image.asset(
                'assets/icons/icon_app.png',
                width: 43,
                height: 43,
              ),
              AppTheme.spacing.customY(40),
              Text(
                'Hallo, welcome back!',
                style: AppTheme.typography.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTheme.spacing.customY(40),
              Consumer<AuthAppProvider>(builder: (_, authAppProvider, __) {
                return InputWidget.formFieldInput(
                  context: context,
                  controller: authAppProvider.emailController,
                  title: 'Email',
                  hintText: 'Your email',
                );
              }),
              AppTheme.spacing.mediumY,
              Consumer<AuthAppProvider>(builder: (_, authAppProvider, __) {
                return InputWidget.formFieldInput(
                  context: context,
                  obscureText: authAppProvider.obscureText,
                  controller: authAppProvider.passwordController,
                  focusNode: authAppProvider.passwordFocus,
                  title: 'Password',
                  hintText: 'Your password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      authAppProvider.obscureText = !authAppProvider.obscureText;
                    },
                    icon: Icon(authAppProvider.obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                );
              }),
              AppTheme.spacing.largeY,
              Consumer2<AppProvider, AuthAppProvider>(builder: (_, appProvider, authAppProvider, __) {
                return ButtonWidget.ractangle(
                  text: 'Login',
                  width: AppTheme.double.screenW(context),
                  type: ButtonType.primary,
                  onPressed: () {
                    authAppProvider.authToken = 'token';
                    SessionUtil().writeSession(SessionUtil().authKey, 'token');
                  },
                );
              }),
              const VersionInfoComponent(verticalMargin: 120),
            ],
          ),
        ),
      ),
    );
  }
}

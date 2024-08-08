import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/configs/app_config.dart';
import 'core/configs/environment_config.dart';
import 'core/providers/app_provider.dart';
import 'core/themes/base_theme.dart';
import 'routes/app_router.dart';
import 'screens/auth/providers/auth_app_provider.dart';
import 'screens/splash/splash_screen.dart';

AppConfig appConfig = AppConfig(Environment.prod());

// Build APK Bundle for Release
// flutter build appbundle --release --no-tree-shake-icons

Future<void> main() async {
  // Config initialization
  await appConfig.init();

  // App initialization
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final Environment env = Environment.dev();
  static final BaseTheme theme = BaseTheme();
  static final FluroRouter router = AppRouter.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider(env)),
        ChangeNotifierProvider(create: (_) => AuthAppProvider()),
      ],
      child: Consumer2<AppProvider, AuthAppProvider>(
        builder: (_, appProvider, auth, __) {
          return MaterialApp(
            theme: theme.baseTheme,
            title: 'Tong Nyampah',
            locale: const Locale('id'),
            initialRoute: SplashScreen.path,
            onGenerateRoute: router.generator,
            debugShowCheckedModeBanner: false,
            supportedLocales: const [Locale('id')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (_, child) {
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: const [
                  Breakpoint(start: 0, end: 750, name: MOBILE),
                  Breakpoint(start: 751, end: 1024, name: TABLET),
                  Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

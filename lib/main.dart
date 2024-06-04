import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nongkuy/common/navigation.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';
import 'package:nongkuy/helpers/notification_helper.dart';
import 'package:nongkuy/models/services/background_service.dart';
import 'package:nongkuy/screens/detail/detail_screen.dart';
import 'package:nongkuy/screens/favorite/favorite_screen.dart';
import 'package:nongkuy/screens/setting/setting_screen.dart';
import 'package:nongkuy/screens/splash/splash_screen.dart';
import 'package:nongkuy/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:nongkuy/widgets/custom_favorite_widget.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  Get.put(FavoriteController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      themeMode: ThemeMode.system,
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: NameRoutes.initRoute,
      getPages: [
        GetPage(
          name: NameRoutes.initRoute,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: NameRoutes.settingScreen,
          page: () => SettingScreen(),
        ),
        GetPage(
          name: NameRoutes.favoriteScreen,
          page: () => FavoriteScreen(),
        ),
        GetPage(
          name: NameRoutes.homeScreen,
          page: () => const CustomBottomNavigationBarWidget(),
        ),
        GetPage(
          name: NameRoutes.detailScreen,
          page: () => const DetailScreen(),
        ),
      ],
    );
  }
}

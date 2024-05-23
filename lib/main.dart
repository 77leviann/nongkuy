import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';
import 'package:nongkuy/screens/splash/splash_screen.dart';
import 'package:nongkuy/widgets/custom_bottom_navigation_bar_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: NameRoutes.initRoute,
      routes: {
        NameRoutes.initRoute: (context) => const SplashScreen(),
        NameRoutes.homeScreen: (context) =>
            const CustomBottomNavigationBarWidget(),
      },
    );
  }
}

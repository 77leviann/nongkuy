import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nongkuy/constants/asset_constant.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, NameRoutes.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      body: Center(
        child: Image.asset(
          AssetConstant.imageLogo,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}

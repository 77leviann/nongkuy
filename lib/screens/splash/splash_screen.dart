import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nongkuy/constants/asset_constant.dart';
import 'package:nongkuy/constants/name_routes_constant.dart';

part '../../constrollers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (
        controller,
      ) {
        return Scaffold(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceBright,
          body: Center(
            child: Image.asset(
              AssetConstant.imageLogo,
              height: 100,
              width: 100,
            ),
          ),
        );
      },
    );
  }
}

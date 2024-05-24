part of '../screens/splash/splash_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () => Get.offNamed(
        NameRoutes.homeScreen,
      ),
    );
  }
}

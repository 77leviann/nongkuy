import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nongkuy/helpers/date_time_helper.dart';
import 'package:nongkuy/helpers/shared_pref_helper.dart';
import 'package:nongkuy/models/services/background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class SettingController extends GetxController {
  final RxBool _isScheduled = false.obs;
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  bool get isScheduled => _isScheduled.value;
  ThemeMode get themeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadIsScheduled();
    _loadThemeMode();
  }

  Future<void> _loadIsScheduled() async {
    final isScheduled = await SharedPreferencesHelper.getIsScheduled();
    _isScheduled.value = isScheduled;
  }

  Future<void> _loadThemeMode() async {
    final themeIndex = await SharedPreferencesHelper.getThemeMode();
    _themeMode.value = ThemeMode.values[themeIndex];
  }

  Future<void> handleScheduling(BuildContext context, bool value) async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    if (await Permission.notification.isGranted) {
      await scheduleRestaurant(value);
    } else {
      if (context.mounted) {
        openAppSettingsDialog(context);
      }
    }
  }

  Future<bool> scheduleRestaurant(bool value) async {
    _isScheduled.value = value;
    await SharedPreferencesHelper.setIsScheduled(value);

    if (value) {
      if (kDebugMode) {
        print('Scheduling Restaurant Activated');
      }
      update();
      return await AndroidAlarmManager.periodic(
        const Duration(seconds: 2),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      if (kDebugMode) {
        print('Scheduling Restaurant Canceled');
      }
      update();
      return await AndroidAlarmManager.cancel(1);
    }
  }

  void openAppSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Permission Required"),
          content:
              const Text("Please enable notifications in the app settings."),
          actions: <Widget>[
            TextButton(
              child: const Text("Open Settings"),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    await SharedPreferencesHelper.setThemeMode(mode.index);
    Get.changeThemeMode(mode);
  }
}

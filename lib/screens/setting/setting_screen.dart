import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constants/text_style_constant.dart';
import 'package:nongkuy/constrollers/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  SettingScreen({super.key});
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Screen',
          style: TextStyleConstant.headlineMedium(context),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Material(
              child: Obx(() {
                return ListTile(
                  title: const Text('Dark Theme'),
                  trailing: Switch.adaptive(
                    value: settingController.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      settingController.setThemeMode(
                        value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                );
              }),
            ),
            Material(
              child: ListTile(
                title: const Text('Scheduling Restaurant'),
                trailing: Obx(() {
                  return Switch.adaptive(
                    value: settingController.isScheduled,
                    onChanged: (value) async {
                      await settingController.handleScheduling(context, value);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

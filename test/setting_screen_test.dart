import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nongkuy/constrollers/setting_controller.dart';
import 'package:nongkuy/screens/setting/setting_screen.dart';

void main() {
  testWidgets('SettingScreen UI Test', (WidgetTester tester) async {
    Get.put(SettingController());

    await tester.pumpWidget(
      GetMaterialApp(
        home: SettingScreen(),
      ),
    );

    expect(find.text('Settings Screen'), findsOneWidget);

    expect(find.text('Dark Theme'), findsOneWidget);
    final darkThemeSwitch = find.byType(Switch).first;
    expect(darkThemeSwitch, findsOneWidget);
    expect((tester.widget(darkThemeSwitch) as Switch).value, false);

    await tester.tap(darkThemeSwitch);
    await tester.pumpAndSettle();
    expect((tester.widget(darkThemeSwitch) as Switch).value, true);

    expect(find.text('Scheduling Restaurant'), findsOneWidget);
    final schedulingSwitch = find.byType(Switch).at(1);
    expect(schedulingSwitch, findsOneWidget);
    expect((tester.widget(schedulingSwitch) as Switch).value, false); 

    await tester.tap(schedulingSwitch);
    await tester.pumpAndSettle();
    expect((tester.widget(schedulingSwitch) as Switch).value, false);
  });
}

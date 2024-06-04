import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:nongkuy/helpers/notification_helper.dart';
import 'package:nongkuy/main.dart';
import 'package:nongkuy/models/services/restaurant_service.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    if (kDebugMode) {
      print('Notification executed');
    }
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await RestaurantService().getRestaurantList();
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}

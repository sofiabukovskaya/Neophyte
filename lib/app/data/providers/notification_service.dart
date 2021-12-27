import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() => _notificationService;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    //Initialization Settings for iOS
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future selectNotification() async {}

  NotificationDetails platformChannelSpecifics = const NotificationDetails(
      android: AndroidNotificationDetails(
    'channel ID',
    'channel name',
    channelDescription: 'channel description',
    playSound: true,
    enableVibration: true,
    priority: Priority.high,
    importance: Importance.high,
  ));

  Future<void> scheduleNotifications({
    required Duration time,
    required String title,
    required String body,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(time),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotifications(String title, String description) async {
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'This is the Notification Body',
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }
}

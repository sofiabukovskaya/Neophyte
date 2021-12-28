import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'app/data/providers/notification_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');

  await Future.wait([
    di.init(),
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    getPages: AppPages.pages,
    transitionDuration: Duration.zero,
    defaultTransition: Transition.noTransition,
  ));
}

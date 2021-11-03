import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await Future.wait([
    di.init(),
  ]);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    getPages: AppPages.pages,
    transitionDuration: Duration.zero,
    defaultTransition: Transition.noTransition,
  ));
}

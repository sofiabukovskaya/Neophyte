import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    getPages: AppPages.pages,
    transitionDuration: Duration.zero,
    defaultTransition: Transition.noTransition,
  ));
}

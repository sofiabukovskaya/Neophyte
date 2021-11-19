import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/splash_page_controller.dart';
import '../../../utils/constants.dart';

class SplashPage extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Constants.mainLightColor, Constants.mainColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/splash_image.png",
              height: 300.0,
              width: 300.0,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Constants.mainLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

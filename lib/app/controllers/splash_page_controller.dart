import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/services/implementation/impl_connection_service.dart';
import '../routes/app_routes.dart';
import '../ui/pages/no_internet_connection_page/no_internet_connection_page.dart';

class SplashPageController extends GetxController {
  ImplConnectionService implConnectionService =
      Get.put(ImplConnectionService());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');
    await Future.delayed(const Duration(seconds: 3));
    if (implConnectionService.connectionType == 0) {
      await Get.to(NoInternetConnectionPage());
    } else {
      await accessToken == null
          ? Get.offAllNamed(Routes.SIGN_IN)
          : Get.offAllNamed(Routes.HOME);
    }
    super.onReady();
  }
}

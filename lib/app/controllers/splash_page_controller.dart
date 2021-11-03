import 'package:get/get.dart';

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
    await Future.delayed(const Duration(seconds: 3));
    if (implConnectionService.connectionType == 0) {
      await Get.to(NoInternetConnectionPage());
    } else {
      await Get.offAllNamed(Routes.SIGN_IN);
    }
    super.onReady();
  }
}

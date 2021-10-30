import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashPageController extends GetxController {
  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 3));
    await Get.offAllNamed(Routes.SIGN_IN);
    super.onReady();
  }
}

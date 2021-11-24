import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user.dart';
import '../data/services/interfaces/i_user_info_service.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final userService = Get.find<IUserInfoService>();

  final currentIndex = 0.obs;

  User? currentUser;

  void changeIndex(int newIndex) => currentIndex.value = newIndex;

  @override
  void onReady() {
    userService.getInfoUserService().then((value) => currentUser = value);
    super.onReady();
  }

  @override
  void onInit() {
    userService.getInfoUserService().then((value) => currentUser = value);

    super.onInit();
  }

  Future<void> logoutFromSystem() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('accessToken');
    Get.toNamed(Routes.SIGN_IN);
  }
}

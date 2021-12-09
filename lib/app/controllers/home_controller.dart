import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user.dart';
import '../data/services/interfaces/i_user_info_service.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';

class HomeController extends GetxController {
  final userService = Get.find<IUserInfoService>();

  final currentIndex = 0.obs;

  TextEditingController nameUpdate = TextEditingController();
  TextEditingController lastNameUpdate = TextEditingController();
  TextEditingController emailUpdate = TextEditingController();
  TextEditingController companyUpdate = TextEditingController();

  late String genderUser;

  int radioValue = 0;

  User? currentUser;

  void changeIndex(int newIndex) => currentIndex.value = newIndex;

  @override
  void onReady() async {
    await userService.getInfoUserService().then((value) => currentUser = value);
    super.onReady();
  }

  @override
  void onInit() async {
    await userService.getInfoUserService().then((value) => currentUser = value);
    await setTextToControllers(currentUser!);
    super.onInit();
  }

  Future<void> logoutFromSystem() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('accessToken');
    Get.toNamed(Routes.SIGN_IN);
  }

  Future<void> setTextToControllers(User user) async {
    if (user.gender == 'female') {
      radioValue = 0;
    } else {
      radioValue = 1;
    }
    genderUser = user.gender!;
    nameUpdate.text = user.firstName!;
    lastNameUpdate.text = user.lastName!;
    emailUpdate.text = user.email!;
    companyUpdate.text = user.company!;
  }

  void handleRadioValueChange(int? value, StateSetter setInnerState) {
    setInnerState(() {
      radioValue = value!;
      switch (radioValue) {
        case 0:
          genderUser = 'female';
          break;
        case 1:
          genderUser = 'male';
          break;
      }
    });
  }

  void updateInfo() async {
    await userService
        .updateUserInfo(nameUpdate.text, lastNameUpdate.text, emailUpdate.text,
            companyUpdate.text, genderUser)
        .then((value) async {
      if (value) {
        openAndCloseLoadingDialog();
        await Future.delayed(const Duration(seconds: 3));
        await userService
            .getInfoUserService()
            .then((value) => currentUser = value);
        refresh();
        Navigator.of(Get.overlayContext!).pop();
        Get.dialog(
          AlertDialog(
            title: const Text('Yours data update successfully!',
                style: TextStyle(fontFamily: 'avenir')),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Close', style: TextStyle(fontFamily: 'avenir')),
                onPressed: () {
                  Get.close(2);
                },
              )
            ],
          ),
          barrierDismissible: false,
        );
      } else {
        openAndCloseLoadingDialog();
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(Get.overlayContext!).pop();
        Get.dialog(
          AlertDialog(
            title: const Text('Something gone wrong :(',
                style: TextStyle(fontFamily: 'avenir')),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Close', style: TextStyle(fontFamily: 'avenir')),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
          barrierDismissible: false,
        );
      }
    });
  }

  Future<void> openAndCloseLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Constants.mainLightColor),
            ),
          ),
        ),
      ),
    );
  }
}

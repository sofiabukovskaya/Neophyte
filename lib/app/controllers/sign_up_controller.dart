import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/interfaces/i_register_service.dart';
import '../routes/app_routes.dart';

class SignUpController extends GetxController {
  final registerService = Get.find<IRegisterService>();

  final _checkBoxValue = false.obs;

  bool? isRegister;

  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final password2TextEditingController = TextEditingController();
  final companyTextEditingController = TextEditingController();
  final genderTextEditingController = TextEditingController();

  bool get checkBoxValue => _checkBoxValue.value;

  void changeCheckBoxValue(bool newValue) => _checkBoxValue.value = newValue;

  registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
    String password2,
    String gender,
    String company,
  ) {
    try {
      registerService.registerUser(
        firstName,
        lastName,
        email,
        password,
        password2,
        gender,
        company,
      );
      Get.toNamed(Routes.HOME);
      Get.snackbar('Login successful', 'Welcome! :)');
      isRegister = true;
    } catch (e) {
      isRegister = false;
      Get.snackbar(
        'Invalid Input Data',
        'Check fields!!',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}

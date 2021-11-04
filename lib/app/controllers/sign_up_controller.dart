import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/services/interfaces/i_register_service.dart';

class SignUpController extends GetxController {
  final registerService = Get.find<IRegisterService>();

  final _checkBoxValue = false.obs;

  bool? isRegister;

  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final password2TextEditingController = TextEditingController();

  bool get checkBoxValue => _checkBoxValue.value;

  void changeCheckBoxValue(bool newValue) => _checkBoxValue.value = newValue;

  registerUser(String firstName, String lastName, String email, String password,
      String password2) {
    try {
      registerService.registerUser(
          firstName, lastName, email, password, password2);
      isRegister = true;
    } catch (e) {
      isRegister = false;
    }
  }
}

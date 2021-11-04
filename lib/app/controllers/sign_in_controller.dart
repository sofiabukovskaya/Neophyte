import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/services/interfaces/i_login_service.dart';

class SignInController extends GetxController {
  String? valueResult;

  final loginService = Get.find<ILoginService>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    await loginService.loginUser(email, password).then((value) {
      valueResult = value;
    });
  }
}

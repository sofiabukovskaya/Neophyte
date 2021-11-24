import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/sign_in_controller.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/linear_button.dart';
import '../../global_widgets/text_form_field_widget.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Image.asset(
                "assets/images/splash_image.png",
                height: 300.0,
                width: 300.0,
              ),
              TextFormFieldWidget(
                  textFormHint: 'Email',
                  textEditingController: controller.emailTextEditingController),
              const SizedBox(height: 15),
              TextFormFieldWidget(
                  textFormHint: 'Password',
                  isPassword: true,
                  textEditingController:
                      controller.passwordTextEditingController),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 170),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => {},
                      child: Text(
                        'Forgot your Password?',
                        style: TextStyle(
                            fontFamily: 'avenir',
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.SIGN_UP),
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(
                          fontFamily: 'avenir',
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 45),
              LinearButton(
                buttonTitle: 'SIGN IN',
                onTap: () async {
                  if (controller.emailTextEditingController.text.isNotEmpty &&
                      controller
                          .passwordTextEditingController.text.isNotEmpty) {
                    controller
                        .signIn(
                      controller.emailTextEditingController.text,
                      controller.passwordTextEditingController.text,
                    )
                        .whenComplete(() {
                      Get.toNamed(Routes.HOME);
                      Get.snackbar('Login successful', 'Welcome! :)');
                    });
                  } else {
                    Get.snackbar(
                      'Invalid Input Data',
                      'Check fields!!',
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/sign_up_controller.dart';
import '../../../utils/constants.dart';
import '../../global_widgets/linear_button.dart';
import '../../global_widgets/text_form_field_widget.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/sign_up_logo.png",
                  height: 200.0,
                  width: 200.0,
                ),
                TextFormFieldWidget(
                  textFormHint: 'First name',
                  textEditingController:
                      controller.firstNameTextEditingController,
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Last name',
                    textEditingController:
                        controller.lastNameTextEditingController),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Email',
                    textEditingController:
                        controller.emailTextEditingController),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Password',
                    isPassword: true,
                    textEditingController:
                        controller.passwordTextEditingController),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Repeat password',
                    isPassword: true,
                    textEditingController:
                        controller.password2TextEditingController),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Company',
                    textEditingController:
                        controller.companyTextEditingController),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    textFormHint: 'Gender',
                    textEditingController:
                        controller.genderTextEditingController),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Checkbox(
                            value: controller.checkBoxValue,
                            onChanged: (newValue) =>
                                controller.changeCheckBoxValue(newValue!),
                            activeColor: Constants.mainColor),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text('I agree with Privacy Policy',
                        style: TextStyle(fontFamily: 'avenir', fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 20),
                LinearButton(
                  buttonTitle: 'CREATE ACCOUNT',
                  onTap: () {
                    if (controller.firstNameTextEditingController.text.isNotEmpty &&
                        controller
                            .lastNameTextEditingController.text.isNotEmpty &&
                        controller.emailTextEditingController.text.isNotEmpty &&
                        controller
                            .passwordTextEditingController.text.isNotEmpty &&
                        controller
                            .password2TextEditingController.text.isNotEmpty &&
                        controller
                            .genderTextEditingController.text.isNotEmpty &&
                        controller
                            .companyTextEditingController.text.isNotEmpty) {
                      controller.registerUser(
                        controller.firstNameTextEditingController.text,
                        controller.lastNameTextEditingController.text,
                        controller.emailTextEditingController.text,
                        controller.passwordTextEditingController.text,
                        controller.password2TextEditingController.text,
                        controller.genderTextEditingController.text,
                        controller.companyTextEditingController.text,
                      );
                      if (controller.isRegister!) {
                        Get.snackbar('register successful',
                            'Hi ${controller.firstNameTextEditingController.text}');
                      } else {
                        Get.snackbar('something go wrong', ':(');
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}

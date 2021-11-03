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
                const TextFormFieldWidget(textFormHint: 'Name'),
                const SizedBox(height: 15),
                const TextFormFieldWidget(textFormHint: 'Email'),
                const SizedBox(height: 15),
                const TextFormFieldWidget(
                    textFormHint: 'Password', isPassword: true),
                const SizedBox(height: 15),
                const TextFormFieldWidget(
                    textFormHint: 'Repeat password', isPassword: true),
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
                const LinearButton(buttonTitle: 'CREATE ACCOUNT')
              ],
            ),
          ),
        ));
  }
}

import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _checkBoxValue = false.obs;

  bool get checkBoxValue => _checkBoxValue.value;

  void changeCheckBoxValue(bool newValue) => _checkBoxValue.value = newValue;
}

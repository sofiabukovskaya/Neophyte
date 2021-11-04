import 'package:get/get.dart';

abstract class IRegisterService extends GetxService {
  void registerUser(String firstName, String lastName, String email,
      String password, String password2);
}

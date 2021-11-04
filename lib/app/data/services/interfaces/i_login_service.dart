import 'package:get/get.dart';

abstract class ILoginService extends GetxService {
  Future<String> loginUser(String email, String password);
}

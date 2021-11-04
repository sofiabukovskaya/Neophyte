import 'package:get/get.dart';

abstract class ILoginProvider extends GetxService {
  Future<String> loginUserApi(String email, String password);
}

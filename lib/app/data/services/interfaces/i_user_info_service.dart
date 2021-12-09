import 'package:get/get.dart';

import '../../models/user.dart';

abstract class IUserInfoService extends GetxService {
  Future<User> getInfoUserService();

  Future<bool> updateUserInfo(String name, String lastName, String email,
      String company, String gender);
}

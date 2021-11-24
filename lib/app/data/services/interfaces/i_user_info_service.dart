import 'package:get/get.dart';

import '../../models/user.dart';

abstract class IUserInfoService extends GetxService {
  Future<User> getInfoUserService();
}

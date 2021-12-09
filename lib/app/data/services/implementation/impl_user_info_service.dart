import 'package:get/get.dart';

import '../../models/user.dart';
import '../../providers/interfaces/i_user_info_provider.dart';
import '../interfaces/i_user_info_service.dart';

class ImplUserInfoService extends IUserInfoService {
  final userInfoProvider = Get.find<IUserInfo>();
  Future<User>? user;

  @override
  Future<User> getInfoUserService() {
    return user = userInfoProvider.getUserInfo();
  }

  @override
  Future<bool> updateUserInfo(String name, String lastName, String email,
      String company, String gender) async {
    return userInfoProvider.updateUserInfo(User(
        firstName: name,
        lastName: lastName,
        email: email,
        company: company,
        password2: '',
        password: '',
        gender: gender));
  }
}

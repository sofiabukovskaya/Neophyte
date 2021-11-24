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
}

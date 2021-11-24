import '../../models/user.dart';

abstract class IUserInfoService {
  Future<User> getInfoUserService();
}

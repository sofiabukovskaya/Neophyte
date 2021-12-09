import '../../models/user.dart';

abstract class IUserInfo {
  Future<User> getUserInfo();
  Future<void> refreshTokenAPI();
  Future<bool> updateUserInfo(User user);
}

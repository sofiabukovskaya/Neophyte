import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart' show Constants;
import '../../models/user.dart';
import '../interfaces/i_user_info_provider.dart';

class ImplUserInfoProvider extends IUserInfo {
  static var client = http.Client();

  @override
  Future<User> getUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');

    try {
      final http.Response response =
          await client.get(Uri.parse(Constants.kUrlUserInfo), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + accessToken!,
      });
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return User.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 403) {
        refreshTokenAPI();
      }
      return Future.value(User());
    } catch (e) {
      print(e.toString());
      return Future.value(User());
    }
  }

  @override
  Future<void> refreshTokenAPI() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? refreshToken = sharedPreferences.getString('refreshToken');
    final http.Response refreshTokenRequest = await client.post(
        Uri.parse(Constants.kUrlRefreshToken),
        body: {'refresh': refreshToken});
    final json = jsonDecode(refreshTokenRequest.body);
    final result = json['access'];
    sharedPreferences.setString('accessToken', result);
    getUserInfo();
  }
}

import 'package:flutter/cupertino.dart';

class Constants {
  //URL
  static const String kUrlRegister =
      'https://pacific-spire-69544.herokuapp.com/auth/register/';

  static const String kUrlLogin =
      'https://pacific-spire-69544.herokuapp.com/auth/login/';

  static const String kUrlUserInfo =
      'https://pacific-spire-69544.herokuapp.com/user/info/';

  static const String kUrlRefreshToken =
      'https://pacific-spire-69544.herokuapp.com/auth/login/refresh/';

  static const String kUrlUpdateUserInfo =
      'https://pacific-spire-69544.herokuapp.com/users/';

  static const String kUrlInterview =
      'https://pacific-spire-69544.herokuapp.com/interviews/';

  //Colors

  static const Color mainColor = Color(0xFF7F2DE7);

  static const Color mainLightColor = Color(0xFFBC96EC);

  //Duration

  static const Duration kDurationSpeed = Duration(milliseconds: 500);
}

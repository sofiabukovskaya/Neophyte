import 'package:flutter/cupertino.dart';

class Constants {
  //URL
  static const String kUrlRegister =
      'http://f37b-159-224-64-142.ngrok.io/auth/register/';

  static const String kUrlLogin =
      'http://f37b-159-224-64-142.ngrok.io/auth/login/';

  static const String kUrlUserInfo =
      'http://f37b-159-224-64-142.ngrok.io/user/info/';

  static const String kUrlRefreshToken =
      'http://f37b-159-224-64-142.ngrok.io/auth/login/refresh/';

  static const String kUrlVacancies =
      'http://f37b-159-224-64-142.ngrok.io/vacancies/';

  static const String kUrlCandidate =
      'http://f37b-159-224-64-142.ngrok.io/candidates/';

  static const String kUrlUpdateUserInfo =
      'http://f37b-159-224-64-142.ngrok.io/users/';
  static const String kUrlPostCandidate =
      'http://f37b-159-224-64-142.ngrok.io/candidates/';

  static const String kUrlPostInterview =
      'http://f37b-159-224-64-142.ngrok.io/interviews/';

  static const String kUrlInterview =
      'http://f37b-159-224-64-142.ngrok.io/interviews/';

  //Colors

  static const Color mainColor = Color(0xFF7F2DE7);

  static const Color mainLightColor = Color(0xFFBC96EC);

  //Duration

  static const Duration kDurationSpeed = Duration(milliseconds: 500);
}

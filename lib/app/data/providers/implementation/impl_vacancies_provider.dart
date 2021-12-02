import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../models/vacancies.dart';
import '../interfaces/i_vacancies_provider.dart';

class ImplVacanciesProvider extends IVacanciesProvider {
  static var client = http.Client();
  List<Vacancies> vacancies = [];
  @override
  Future<List<Vacancies>> listVacancies() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');
    try {
      final http.Response response =
          await client.get(Uri.parse(Constants.kUrlVacancies), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + accessToken!,
      });
      if (response.statusCode == 200) {
        final l = jsonDecode(response.body) as List<dynamic>;
        vacancies = l.map((e) => Vacancies.fromJson(e)).toList();
      }
      if (response.statusCode == 403) {
        await refreshTokenAPI();
      }

      return vacancies;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> refreshTokenAPI() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? refreshToken = sharedPreferences.getString('refreshToken');
    final http.Response refreshTokenRequest = await client.post(
        Uri.parse(Constants.kUrlRefreshToken),
        body: {'refresh': refreshToken});
    final json = jsonDecode(refreshTokenRequest.body);
    final result = json['access'];
    await sharedPreferences.setString('accessToken', result);
    await listVacancies();
  }
}

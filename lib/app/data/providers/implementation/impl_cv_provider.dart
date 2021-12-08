import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../models/candidates.dart';
import '../interfaces/i_cv_provider.dart';

class ImplCvProvider extends ICVProvider {
  static var client = http.Client();
  List<Candidates> candidates = [];

  Future<void> postCandidates(Candidates candidates) async {
    final Map<String, dynamic> data = {
      'first_name': candidates.firstName,
      'last_name': candidates.lastName,
      'email': candidates.email,
      'vacancy': candidates.vacancy.toString(),
    };
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');
    try {
      final http.Response response = await client.post(
        Uri.parse(Constants.kUrlPostCandidate),
        body: data,
        headers: {
          "Authorization": "Bearer " + accessToken!,
        },
      );
      if (response.statusCode == 201) {
        print('201 OK');
      }
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Candidates>> listCandidates() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');
    try {
      final http.Response response =
          await client.get(Uri.parse(Constants.kUrlCandidate), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + accessToken!,
      });
      if (response.statusCode == 200) {
        final l = jsonDecode(response.body) as List<dynamic>;
        candidates = l.map((e) => Candidates.fromJson(e)).toList();
      }
      if (response.statusCode == 403) {
        await refreshTokenAPI();
      }
      return candidates;
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
    await listCandidates();
  }
}

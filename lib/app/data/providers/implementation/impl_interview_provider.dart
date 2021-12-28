import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neophyte/app/data/models/result_AI.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../models/candidates.dart';
import '../../models/interview.dart';
import '../interfaces/i_interview_provider.dart';

class ImplInterviewProvider extends IInterviewProvider {
  static var client = http.Client();
  List<Interview> interviews = [];
  late ResultAi resultAi;

  @override
  Future<List<Interview>> getListInterviews() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');

    try {
      final http.Response response =
          await client.get(Uri.parse(Constants.kUrlInterview), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + accessToken!,
      });
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        final l = jsonDecode(response.body) as List<dynamic>;
        interviews = l.map((e) => Interview.fromJson(e)).toList();
      }
      return interviews;
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  @override
  Future<String> getNameCandidateOfId(int id) async {
    String nameCandidate = '';
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');
    final http.Response response =
        await client.get(Uri.parse(Constants.kUrlCandidate + '$id/'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + accessToken!,
    });
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      final l = jsonDecode(response.body);
      nameCandidate = l.map((e) => Candidates.fromJson(e).firstName).toString();
    }
    return nameCandidate;
  }

  @override
  Future<bool> updateInterview(
      int id, String link, DateTime dateTime, int candidateId) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');

    final Map<String, dynamic> data = {
      'candidate': candidateId.toString(),
      'datetime': dateTime.toIso8601String(),
      'link': link,
    };

    try {
      final http.Response response =
          await client.put(Uri.parse(Constants.kUrlInterview + '$id/'),
              headers: {
                "Authorization": "Bearer " + accessToken!,
              },
              body: data);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return true;
      } else if (response.statusCode == 403) {
        refreshTokenAPI();
      }
      print(response.body);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
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
    sharedPreferences.setString('accessToken', result);
  }

  @override
  Future<ResultAi> getResultAI(int id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? accessToken = sharedPreferences.getString('accessToken');

    try {
      final http.Response response = await client
          .get(Uri.parse(Constants.kUrlInterview + '$id/result/'), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + accessToken!,
      });
      if (response.statusCode == 200 && response.body != '{}') {
        resultAi = ResultAi.fromJson(json.decode(response.body));
      } else if (response.statusCode == 200 && response.body == '{}') {
        resultAi = ResultAi(
            faceIsnTDetected: null, happy: null, neutral: null, sad: null);
      }
      return resultAi;
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}

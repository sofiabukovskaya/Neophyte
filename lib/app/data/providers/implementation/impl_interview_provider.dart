import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../models/interview.dart';
import '../interfaces/i_interview_provider.dart';

class ImplInterviewProvider extends IInterviewProvider {
  static var client = http.Client();
  List<Interview> interviews = [];

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
}

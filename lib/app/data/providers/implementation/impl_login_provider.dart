import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart' show Constants;
import '../interfaces/i_login_provider.dart';

class ImplLoginProvider extends ILoginProvider {
  static var client = http.Client();

  var response = client.get(Uri.parse(Constants.kUrlLogin));

  @override
  Future<String> loginUserApi(String email, String password) async {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    try {
      final http.Response response =
          await client.post(Uri.parse(Constants.kUrlLogin), body: data);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        final json = jsonDecode(response.body);
        final result = json['access'];

        print(result.toString());
        return Future.value(result.toString());
      }
      return Future.value('error');
    } catch (e) {
      print(e.toString());
    }
    return Future.value('error');
  }
}

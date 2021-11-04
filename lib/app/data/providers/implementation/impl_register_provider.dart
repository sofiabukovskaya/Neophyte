import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';

import '../../models/user.dart';
import '../interfaces/i_register_provider.dart';

class ImplRegisterProvider extends IRegisterProvider {
  static var client = http.Client();

  var response = client.get(Uri.parse(Constants.kUrlRegister));

  @override
  void registerUserAPI(User user) async {
    final Map<String, dynamic> data = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'password': user.password,
      'password2': user.password2,
    };

    try {
      final http.Response response =
          await client.post(Uri.parse(Constants.kUrlRegister), body: data);
      if (response.statusCode == 201) {
        print(jsonDecode(response.body));
        final json = jsonDecode(response.body);
        final result = json.map((e) => User.fromJson(e));

        print(result.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

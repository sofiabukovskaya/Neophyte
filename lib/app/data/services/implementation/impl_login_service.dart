import 'package:get/get.dart';
import '../../providers/interfaces/i_login_provider.dart';

import '../interfaces/i_login_service.dart';

class ImplLoginService extends ILoginService {
  final loginProvider = Get.find<ILoginProvider>();
  String valueResult = '';
  @override
  Future<String> loginUser(String email, String password) async {
    loginProvider
        .loginUserApi(email, password)
        .then((value) => valueResult = value);

    return valueResult;
  }
}

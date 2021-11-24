import 'package:get/get.dart';
import '../../providers/interfaces/i_login_provider.dart';

import '../interfaces/i_login_service.dart';

class ImplLoginService extends ILoginService {
  final loginProvider = Get.find<ILoginProvider>();
  late Future<String> valueResult;
  @override
  Future<String> loginUser(String email, String password) async {
    valueResult = loginProvider.loginUserApi(email, password);

    return valueResult;
  }
}

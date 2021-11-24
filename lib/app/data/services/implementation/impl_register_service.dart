import 'package:get/get.dart';
import '../../models/user.dart';
import '../../providers/interfaces/i_register_provider.dart';
import '../interfaces/i_register_service.dart';

class ImplRegisterService extends IRegisterService {
  final registerProvider = Get.find<IRegisterProvider>();

  @override
  void registerUser(String firstName, String lastName, String email,
      String password, String password2, String gender, String company) {
    registerProvider.registerUserAPI(
      User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        password2: password2,
        company: company,
        gender: gender,
      ),
    );
  }
}

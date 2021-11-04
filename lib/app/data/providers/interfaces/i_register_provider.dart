import 'package:get/get.dart';
import '../../models/user.dart';

abstract class IRegisterProvider extends GetxService {
  void registerUserAPI(User user);
}

import 'package:get/get.dart';

import 'app/data/services/implementation/impl_connection_service.dart';
import 'app/data/services/interfaces/i_connection_service.dart';

Future<void> init() async {
  Get.put<IConnectionService>(ImplConnectionService());
}

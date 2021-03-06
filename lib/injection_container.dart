import 'package:get/get.dart';

import 'app/data/providers/implementation/impl_login_provider.dart';
import 'app/data/providers/implementation/impl_register_provider.dart';
import 'app/data/providers/interfaces/i_login_provider.dart';
import 'app/data/providers/interfaces/i_register_provider.dart';
import 'app/data/services/implementation/impl_connection_service.dart';
import 'app/data/services/implementation/impl_login_service.dart';
import 'app/data/services/implementation/impl_register_service.dart';
import 'app/data/services/interfaces/i_connection_service.dart';
import 'app/data/services/interfaces/i_login_service.dart';
import 'app/data/services/interfaces/i_register_service.dart';

Future<void> init() async {
  Get
    ..put<IConnectionService>(ImplConnectionService())
    //Services

    ..lazyPut<IRegisterService>(() => ImplRegisterService())
    ..lazyPut<ILoginService>(() => ImplLoginService())

    //Providers

    ..lazyPut<IRegisterProvider>(() => ImplRegisterProvider())
    ..lazyPut<ILoginProvider>(() => ImplLoginProvider());
}

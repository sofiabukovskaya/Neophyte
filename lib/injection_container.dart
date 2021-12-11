import 'package:get/get.dart';

import 'app/data/providers/implementation/impl_cv_provider.dart';
import 'app/data/providers/implementation/impl_login_provider.dart';
import 'app/data/providers/implementation/impl_register_provider.dart';
import 'app/data/providers/implementation/impl_user_info_provider.dart';
import 'app/data/providers/implementation/impl_vacancies_provider.dart';
import 'app/data/providers/interfaces/i_cv_provider.dart';
import 'app/data/providers/interfaces/i_login_provider.dart';
import 'app/data/providers/interfaces/i_register_provider.dart';
import 'app/data/providers/interfaces/i_user_info_provider.dart';
import 'app/data/providers/interfaces/i_vacancies_provider.dart';
import 'app/data/services/implementation/impl_connection_service.dart';
import 'app/data/services/implementation/impl_login_service.dart';
import 'app/data/services/implementation/impl_register_service.dart';
import 'app/data/services/implementation/impl_user_info_service.dart';
import 'app/data/services/interfaces/i_connection_service.dart';
import 'app/data/services/interfaces/i_login_service.dart';
import 'app/data/services/interfaces/i_register_service.dart';
import 'app/data/services/interfaces/i_user_info_service.dart';

Future<void> init() async {
  Get
    ..put<IConnectionService>(ImplConnectionService())
    //Services

    ..lazyPut<IRegisterService>(() => ImplRegisterService())
    ..lazyPut<ILoginService>(() => ImplLoginService())
    ..lazyPut<IUserInfoService>(() => ImplUserInfoService())

    //Providers

    ..lazyPut<IRegisterProvider>(() => ImplRegisterProvider())
    ..lazyPut<ILoginProvider>(() => ImplLoginProvider())
    ..lazyPut<IUserInfo>(() => ImplUserInfoProvider())
    ..lazyPut<IVacanciesProvider>(() => ImplVacanciesProvider())
    ..lazyPut<ICVProvider>(() => ImplCvProvider());
}

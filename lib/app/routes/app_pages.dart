import 'package:get/get.dart';
import 'package:neophyte/app/bindings/cv_binding.dart';
import 'package:neophyte/app/ui/pages/cv_page/cv_page.dart';

import '../bindings/home_binding.dart';
import '../bindings/sign_in_binding.dart';
import '../bindings/sign_up_binding.dart';
import '../bindings/splash_page_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/sign_in_page/sign_in_page.dart';
import '../ui/pages/sign_up_page/sign_up_page.dart';
import '../ui/pages/splash_page/splash_page.dart';
import '../utils/constants.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: SplashPageBinding(),
        transition: Transition.noTransition,
        transitionDuration: Constants.kDurationSpeed),
    GetPage(
        name: Routes.SIGN_IN,
        page: () => SignInPage(),
        binding: SignInBinding(),
        transition: Transition.downToUp,
        transitionDuration: Constants.kDurationSpeed),
    GetPage(
        name: Routes.SIGN_UP,
        page: () => SignUpPage(),
        binding: SignUpBinding(),
        transition: Transition.leftToRight,
        transitionDuration: Constants.kDurationSpeed),
    GetPage(
        name: Routes.CV,
        page: () => HomePage(),
        binding: HomeBindings(),
        transition: Transition.leftToRight,
        transitionDuration: Constants.kDurationSpeed),
    GetPage(
        name: Routes.HOME,
        page: () => CvPage(),
        binding: CvBindings(),
        transition: Transition.leftToRight,
        transitionDuration: Constants.kDurationSpeed),
  ];
}

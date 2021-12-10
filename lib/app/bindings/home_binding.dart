import 'package:get/get.dart';
import '../controllers/calendar_controller.dart';
import '../controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<CalendarControllerGetx>(CalendarControllerGetx());
  }
}

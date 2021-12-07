import 'package:get/get.dart';
import '../controllers/cv_controller.dart';

class CvBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CvController>(CvController());
  }
}

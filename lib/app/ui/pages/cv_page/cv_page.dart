import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widgets/linear_button.dart';
import '../../../utils/constants.dart';
import '../../../controllers/cv_controller.dart';

class CvPage extends GetView<CvController> {
  static const s22BlackW600 = TextStyle(
      fontFamily: 'avenir', fontSize: 22, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.black,
            ),
            title: const Text('Candidate Profile'),
            backgroundColor: Constants.mainColor,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/images/avatar.png',
                        fit: BoxFit.fill)),
                Text(
                  controller.candidate.firstName +
                      ' ' +
                      controller.candidate.lastName,
                  style: s22BlackW600,
                ),
                const SizedBox(height: 10.0),
                Text(controller.candidate.email, style: s22BlackW600),
                const SizedBox(height: 10.0),
                Text(
                  controller.vacancy.value,
                  style: s22BlackW600,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Constants.mainColor.withOpacity(0.4),
                          width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      trailing: Icon(Icons.download_sharp, color: Colors.black),
                      title: Text(
                        'Download CV',
                        style: s22BlackW600,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LinearButton(buttonTitle: 'Add Event', onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

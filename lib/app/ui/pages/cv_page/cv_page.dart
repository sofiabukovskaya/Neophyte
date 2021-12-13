import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cv_controller.dart';
import '../../../utils/constants.dart';
import '../../global_widgets/linear_button.dart';

class CvPage extends GetView<CvController> {
  static const s22BlackW600 = TextStyle(
      fontFamily: 'avenir', fontSize: 22, fontWeight: FontWeight.w600);

  final linkController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _pickDates() async {
      FocusScope.of(context).unfocus();
      final now = DateTime.now();
      final newDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2023),
        initialDate: now,
      );
      final time = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 12, minute: 0),
      );
      if (newDate != null && time != null) {
        dateController.text = newDate.year.toString() +
            '.' +
            newDate.month.toString() +
            '.' +
            newDate.day.toString() +
            ' ' +
            time.hour.toString() +
            ':' +
            time.minute.toString();

        final eventTime = DateTime(
            newDate.year, newDate.month, newDate.day, time.hour, time.minute);
        controller.dateInteview.value = eventTime.toIso8601String();
      }
    }

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
                  child: GestureDetector(
                    onTap: () {
                      // controller.candidate.createFile();
                      Get.snackbar('Download successful', 'Good! :)');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Constants.mainColor.withOpacity(0.4),
                            width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        trailing:
                            Icon(Icons.download_sharp, color: Colors.black),
                        title: Text(
                          'Download CV',
                          style: s22BlackW600,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LinearButton(
                    buttonTitle: 'Add Event',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Add Event',
                                style: TextStyle(
                                    fontFamily: 'avenir', fontSize: 18)),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: linkController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Constants.mainColor
                                                .withOpacity(0.5),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      hintText: 'Metting link',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Constants.mainColor
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    onTap: _pickDates,
                                    readOnly: true,
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Constants.mainColor
                                                .withOpacity(0.5),
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      hintText: 'Event Date',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Constants.mainColor
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.none,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 18,
                                    color: Colors.red.shade600,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.sendInterview(linkController.text);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 18,
                                    color: Constants.mainColor,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

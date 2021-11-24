import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/cv_tab_controller.dart';
import '../../../../utils/constants.dart';

class CvTab extends GetView<CvTabController> {
  const CvTab({required this.cvTabController});

  final CvTabController cvTabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(''), //later replace for list
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Add a candidate',
                          style: TextStyle(fontFamily: 'avenir', fontSize: 18)),
                      content: SizedBox(
                        height: 350,
                        width: 400,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'First name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Last name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 2),
                                const Text('Cv file:',
                                    style: TextStyle(fontFamily: 'avenir')),
                                const SizedBox(width: 10),
                                TextButton(
                                    onPressed: () => controller.pickFile(),
                                    child: const Text('Choose file',
                                        style: TextStyle(
                                            fontFamily: 'avenir',
                                            color: Colors.white)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey.shade500))),
                                const SizedBox(width: 5),
                                Text(
                                    controller.fileName == null
                                        ? 'picked file name'
                                        : controller.fileName!,
                                    style:
                                        const TextStyle(fontFamily: 'avenir'))
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Vacancies',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color:
                                          Constants.mainColor.withOpacity(0.5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(),
                            child: Text('Cancel',
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 18,
                                    color: Colors.red.shade600))),
                        TextButton(
                            onPressed: () => {},
                            child: const Text('Add',
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 18,
                                    color: Constants.mainColor)))
                      ],
                    ));
          },
          backgroundColor: Constants.mainLightColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

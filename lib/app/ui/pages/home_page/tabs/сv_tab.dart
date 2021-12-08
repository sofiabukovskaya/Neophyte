import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neophyte/app/data/models/candidates.dart';
import 'package:neophyte/app/routes/app_routes.dart';

import '../../../../controllers/cv_tab_controller.dart';
import '../../../../utils/constants.dart';

class CvTab extends GetView<CvTabController> {
  CvTab({required this.cvTabController});

  final CvTabController cvTabController;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Get.toNamed(Routes.CV,
                          arguments: cvTabController.candidatesList[index]),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Constants.mainColor.withOpacity(0.4),
                          width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            cvTabController.candidatesList[index].firstName,
                            style: const TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            cvTabController.candidatesList[index].lastName,
                            style: const TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child:
                        Text(cvTabController.candidatesList[index].email),
                      ),
                      trailing: SizedBox(
                        height: 20,
                        width: 130,
                        child: Row(
                          children: [
                            const Text('Vacancy: ',
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(width: 5),
                            Text(
                                cvTabController.vacanciesList
                                    .elementAt(cvTabController
                                    .candidatesList[index].vacancy!)
                                    .name,
                                style: const TextStyle(fontFamily: 'avenir')),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cvTabController.candidatesList.length,
              shrinkWrap: true,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: const Text('Add a candidate',
                        style: TextStyle(fontFamily: 'avenir', fontSize: 18)),
                    content: SizedBox(
                      height: 350,
                      width: 400,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'First name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5),
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Last name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                      color: Constants.mainColor.withOpacity(
                                          0.5)),
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
                                        backgroundColor: MaterialStateProperty
                                            .all(
                                            Colors.grey.shade500))),
                                const SizedBox(width: 5),
                                GetBuilder<CvTabController>(
                                    builder: (c) =>
                                        Expanded(
                                          child: Text(
                                              c.fileName == null
                                                  ? 'picked file name'
                                                  : c.fileName!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'avenir')),
                                        ))
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text('Select a vacancy:',
                                style: TextStyle(fontFamily: 'avenir')),
                            const SizedBox(height: 10),
                            StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 80),
                                child: SizedBox(
                                  width: 200,
                                  child: DropdownButton<String>(
                                    value: cvTabController.firstValue.value,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    elevation: 16,
                                    style: const TextStyle(
                                        fontFamily: 'avenir',
                                        color: Colors.black87),
                                    underline: Container(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        cvTabController.firstValue.value =
                                        newValue!;
                                      });
                                    },
                                    items: cvTabController.nameVacancies
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                style: const TextStyle(
                                                    fontFamily: 'avenir')),
                                          );
                                        }).toList(),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
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
                        onPressed: () => {
                        controller.sendCandidates(
                        Candidates(firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text,vacancy: 3)
                        )
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
                  ),
            );
          },
          backgroundColor: Constants.mainLightColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

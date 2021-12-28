import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/models/candidates.dart';
import '../data/models/vacancies.dart';
import '../data/providers/interfaces/i_cv_provider.dart';
import '../data/providers/interfaces/i_vacancies_provider.dart';

class CvTabController extends GetxController {
  final vacanciesProvider = Get.find<IVacanciesProvider>();
  final cvProvider = Get.find<ICVProvider>();

  TextEditingController searchController = TextEditingController();

  List<Vacancies> vacanciesList = [];
  List<Candidates> candidatesList = [];
  List<String> nameVacancies = [];

  List<Candidates> searchList = [];

  late RxString firstValue;
  String? fileName;

  @override
  void onInit() async {
    await vacanciesProvider
        .listVacancies()
        .then((value) => vacanciesList = value);
    nameVacancies = vacanciesList.map((e) => e.name).toList();
    nameVacancies = nameVacancies.toSet().toList(); //remove duplicates
    firstValue = nameVacancies.first.obs;

    await cvProvider.listCandidates().then((value) => candidatesList = value);

    searchList = List.from(candidatesList);
    update();
    super.onInit();
  }

  void pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final File file = File(result.files.single.path!);
      fileName = result.files.single.name;
      update();
    }
  }

  void onItemChanged(String value) {
    searchList = candidatesList
        .where((string) =>
            (string.firstName.toLowerCase().contains(value.toLowerCase()) ||
                string.lastName.toLowerCase().contains(value.toLowerCase())))
        .toList();

    update();
  }

  Future<void> sendCandidates(Candidates candidates) async {
    await cvProvider.postCandidates(candidates);

    await vacanciesProvider
        .listVacancies()
        .then((value) => vacanciesList = value);
    nameVacancies = vacanciesList.map((e) => e.name).toList();
    nameVacancies = nameVacancies.toSet().toList(); //remove duplicates
    firstValue = nameVacancies.first.obs;

    await cvProvider.listCandidates().then((value) => searchList = value);
    refresh();
    update();
  }

  void updateDropDownMenu(String newValue) {
    firstValue.value = newValue;
    update();
  }

  void deleteCandidate(Candidates candidate, int index) async {
    await cvProvider.deleteCandidate(candidate.id!);
    searchList.removeAt(index);
    refresh();
  }
}

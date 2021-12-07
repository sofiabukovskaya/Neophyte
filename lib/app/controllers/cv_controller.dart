import 'package:get/get.dart';

import '../data/models/candidates.dart';
import '../data/models/vacancies.dart';
import '../data/providers/interfaces/i_vacancies_provider.dart';

class CvController extends GetxController {
  final candidate = Candidates.test();
  final vacanciesProvider = Get.find<IVacanciesProvider>();

  List<Vacancies> vacanciesList = [];
  List<String> nameVacancies = [];

  RxString vacancy = ''.obs;

  @override
  void onInit() async {
    await vacanciesProvider
        .listVacancies()
        .then((value) => vacanciesList = value);
    nameVacancies = vacanciesList.map((e) => e.name).toList();
    nameVacancies = nameVacancies.toSet().toList();
    vacancy.value = nameVacancies[candidate.vacancy ?? 0];
    super.onInit();
  }

}

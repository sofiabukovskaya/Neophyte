import 'package:get/get.dart';
import 'package:neophyte/app/data/models/interview.dart';
import 'package:neophyte/app/data/providers/interfaces/i_cv_provider.dart';

import '../data/models/candidates.dart';
import '../data/models/vacancies.dart';
import '../data/providers/interfaces/i_vacancies_provider.dart';

class CvController extends GetxController {
  final candidate = Get.arguments as Candidates;
  final vacanciesProvider = Get.find<IVacanciesProvider>();
  final cvProvider = Get.find<ICVProvider>();

  List<Vacancies> vacanciesList = [];
  List<String> nameVacancies = [];

  RxString vacancy = ''.obs;
  RxString dateInteview = ''.obs;

  @override
  void onInit() async {
    await vacanciesProvider
        .listVacancies()
        .then((value) => vacanciesList = value);
    nameVacancies = vacanciesList.map((e) => e.name).toList();
    nameVacancies = nameVacancies.toSet().toList();
    vacancy.value = vacanciesList
        .firstWhere((element) => element.id == candidate.vacancy)
        .name;
    super.onInit();
  }

  Future<void> sendInterview(String link) async {
    final interview = Interview(
      candidate: candidate.id!,
      datetime: dateInteview.value,
      link: link,
    );
    await cvProvider.postInterview(interview);
    update();
  }
}

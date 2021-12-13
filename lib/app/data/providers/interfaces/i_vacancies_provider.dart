import '../../models/vacancies.dart';

abstract class IVacanciesProvider {
  Future<List<Vacancies>> listVacancies();
}

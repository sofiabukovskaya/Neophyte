import 'package:neophyte/app/data/models/result_AI.dart';

import '../../models/interview.dart';

abstract class IInterviewProvider {
  Future<List<Interview>> getListInterviews();

  Future<String> getNameCandidateOfId(int id);

  Future<bool> updateInterview(
      int id, String link, DateTime dateTime, int candidateId);

  Future<ResultAi> getResultAI(int id);
}

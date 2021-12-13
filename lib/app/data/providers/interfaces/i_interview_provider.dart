import '../../models/interview.dart';

abstract class IInterviewProvider {
  Future<List<Interview>> getListInterviews();

  Future<String> getNameCandidateOfId(int id);

  Future<bool> updateInterview(
      int id, String link, DateTime dateTime, int candidateId);
}

import '../../models/candidates.dart';
import '../../models/interview.dart';

abstract class ICVProvider {
  Future<List<Candidates>> listCandidates();

  Future<void> postCandidates(Candidates candidates);

  Future<void> postInterview(Interview interview);

  Future<void> deleteCandidate(int id);
}

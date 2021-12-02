import '../../models/candidates.dart';

abstract class ICVProvider {
  Future<List<Candidates>> listCandidates();
}

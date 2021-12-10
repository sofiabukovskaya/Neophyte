import '../../models/interview.dart';

abstract class IInterviewProvider {
  Future<List<Interview>> getListInterviews();
}

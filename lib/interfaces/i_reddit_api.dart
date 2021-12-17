import 'package:fortress_assignment/models/topic.dart';

abstract class IRedditApi {
  Future<List<Topic>> getTopTopics();
}

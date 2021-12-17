import 'package:flutter/material.dart';
import 'package:fortress_assignment/models/topic.dart';
import 'package:fortress_assignment/services/reddit_service.dart';

class HomePageViewModel extends ChangeNotifier {
  final RedditService redditService = RedditService();
  List<Topic> _listOfTopics = [];
  List<Topic> get listOfTopics => _listOfTopics;

  Future<void> getListOfSortedTopics() async {
    try {
      var topics = await redditService.getTopTopics();
      _listOfTopics = topics.take(20).toList(growable: false);
      _listOfTopics.sort((a, b) => b.comments!.compareTo(a.comments!));
    } catch (e) {
      throw Exception('Failed to get data');
    }
    notifyListeners();
  }
}

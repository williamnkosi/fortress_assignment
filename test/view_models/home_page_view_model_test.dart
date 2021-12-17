import 'package:flutter_test/flutter_test.dart';
import 'package:fortress_assignment/services/reddit_service.dart';
import 'package:fortress_assignment/view_models/home_page_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:fortress_assignment/models/topic.dart';
import 'dart:math';

class MockRedditService extends Mock implements RedditService {}

void main() {
  List<Topic> createListOf25Topics() {
    var rng = Random();
    List<Topic> listOfTopics = [];
    for (int i = 0; i < 25; i++) {
      listOfTopics.add(Topic(
          author: "test",
          title: "test-tilte",
          upVotes: rng.nextInt(100),
          comments: rng.nextInt(50),
          score: rng.nextInt(10000)));
    }
    return listOfTopics;
  }

  test('home page view model - get list of 20 topics', () async {
    final viewModel = HomePageViewModel();
    final redditService = MockRedditService();
    when(() => redditService.getTopTopics())
        .thenAnswer((_) => Future.value(createListOf25Topics()));
    await viewModel.getListOfSortedTopics();
    expect(viewModel.isLoading, false);
    expect(viewModel.listOfTopics, isA<List<Topic>>());
    expect(viewModel.listOfTopics.length, 20);
  });
}

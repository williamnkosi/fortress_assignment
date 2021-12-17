import 'package:flutter_test/flutter_test.dart';
import 'package:fortress_assignment/models/topic.dart';
import 'package:fortress_assignment/services/reddit_service.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'mock_topics_json.dart';

class MockHttp extends Mock implements http.Client {}

void main() {
  test('reddit service - When getTopTopics() is called, return list of Topics ',
      () async {
    final client = MockHttp();
    var url = Uri.https("www.reddit.com", "/r/programmerhumor/top.json");
    final redditService = RedditService();
    when(() => client.get(url))
        .thenAnswer((_) => Future.value(http.Response(jsonData, 200)));
    expect(await redditService.getTopTopics(), isA<List<Topic>>());
  });
}

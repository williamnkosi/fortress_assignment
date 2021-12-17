import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fortress_assignment/interfaces/i_reddit_api.dart';
import 'package:fortress_assignment/models/topic.dart';

class RedditService implements IRedditApi {
  final _baseUrl = "www.reddit.com";

  @override
  Future<List<Topic>> getTopTopics() async {
    try {
      var url = Uri.https(_baseUrl, "/r/programmerhumor/top.json");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> objects = jsonData["data"]["children"];
        List<Topic> listOfTopics =
            objects.map((obj) => Topic.fromMap(obj["data"])).toList();
        return listOfTopics;
      }
    } catch (e) {
      throw Exception('Failed to get data');
    }
    return List.empty();
  }
}

import 'package:flutter/material.dart';
import 'package:fortress_assignment/services/reddit_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("hello");
    RedditService test = new RedditService();
    test.getTopTopics();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Fortress Assignment App"),
        ),
        body: const Center(
          child: Text("Home Page"),
        ));
  }
}

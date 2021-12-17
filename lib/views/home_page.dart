import 'package:flutter/material.dart';
import 'package:fortress_assignment/models/topic.dart';
import 'package:fortress_assignment/view_models/home_page_view_model.dart';
import 'package:fortress_assignment/views/topic_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    viewModel.getListOfSortedTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Fortress Assignment App"),
      ),
      body: Provider.of<HomePageViewModel>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                semanticsLabel: "Loading Topics",
              ),
            )
          : ListView.builder(
              itemCount:
                  Provider.of<HomePageViewModel>(context).listOfTopics.length,
              itemBuilder: (_, index) {
                Topic topic =
                    Provider.of<HomePageViewModel>(context).listOfTopics[index];
                return TopicWidget(
                  topic: topic,
                );
              },
            ),
    );
  }
}

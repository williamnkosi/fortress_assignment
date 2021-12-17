import 'package:flutter/material.dart';
import 'package:fortress_assignment/models/topic.dart';

class TopicWidget extends StatelessWidget {
  final Topic topic;

  const TopicWidget({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorBackGround(score: topic.score!),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField("Title: ", topic.title!),
            TextField("Author: ", topic.author!),
            TextField("upVotes: ", topic.upVotes!.toString()),
            TextField("Comments: ", topic.comments!.toString())
          ],
        ),
      ),
    );
  }

  Row TextField(String label, String text) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(text)
      ],
    );
  }

  Color colorBackGround({required int score}) {
    Color backgroundColor = score.isEven ? Colors.orange : Colors.blue;
    return backgroundColor;
  }
}

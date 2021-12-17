import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  final String? title;
  final String? author;
  final int? upVotes;
  final int? comments;
  final int? score;

  const TopicWidget(
      {Key? key,
      this.title,
      this.author,
      this.upVotes,
      this.comments,
      this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackGround(score: score!),
      child: Column(
        children: [
          Text("Title: " + title!),
          Text("Author: " + author!),
          Text("upVotes: " + upVotes!.toString()),
          Text("Comments: " + comments!.toString())
        ],
      ),
    );
  }

  Color colorBackGround({required int score}) {
    Color backgroundColor = score.isEven ? Colors.orange : Colors.blue;
    return backgroundColor;
  }
}

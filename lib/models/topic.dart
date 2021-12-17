class Topic {
  String? title;
  String? author;
  int? upVotes;
  int? comments;
  int? score;

  Topic({this.title, this.author, this.upVotes, this.comments, this.score});

  Topic.fromMap(Map<String, dynamic> map) {
    title = map["permalink"] ?? "";
    author = map["author"] ?? "";
    upVotes = map["ups"];
    comments = map["num_comments"];
    score = map["score"];
  }
}

class Topic {
  String? title;
  String? author;
  int? upVotes;
  int? comments;

  Topic({this.title, this.author, this.upVotes, this.comments});

  Topic.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    author = map['author'];
    upVotes = map['upVotes'];
    comments = map['commtent'];
  }
}

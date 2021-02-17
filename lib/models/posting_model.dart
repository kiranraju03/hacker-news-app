class Posting {
  String title;
  int points;
  String author;
  String url;
  String text;
  DateTime createdAt;
  // List<Comments> comments;

  Posting.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    points = json['points'] as int;
    author = json['author'] as String;
    url = json['url'] as String;
    text = json['text'] as String;
    createdAt = DateTime.parse(json['created_at'] as String);
    // comments = Comments
  }
}

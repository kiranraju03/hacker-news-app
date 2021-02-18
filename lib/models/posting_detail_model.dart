import 'package:hackernews/models/comment_model.dart';

class PostingDetails {
  String title;
  int points;
  String author;
  String url;
  String text;
  DateTime createdAt;
  List<Comment> comments;

  PostingDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    points = json['points'] as int;
    author = json['author'] as String;
    url = json['url'] as String;
    text = json['text'] as String;
    createdAt = DateTime.parse(json['created_at'] as String);
    comments = (json['children'] as List)
        .map(
          (e) => Comment.fromJson(e),
        )
        .toList();
  }
}

class Comment {
  int id;
  String title;
  String author;
  String text;
  int parentId;

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    author = json['author'] as String;
    text = json['text'] as String;
    parentId = json['parent_id'] as int;
    title = json['title'] as String;
  }
}

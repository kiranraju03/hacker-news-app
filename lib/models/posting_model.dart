class Posting {
  String objectID;
  String title;
  String author;

  Posting.fromJson(Map<String, dynamic> json) {
    objectID = json['objectID'] as String;
    title = json['title'] as String;
    author = json['author'] as String;
  }
}

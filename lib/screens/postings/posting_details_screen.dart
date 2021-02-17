import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/models/posting_model.dart';
import 'package:hackernews/routes/routes.dart' as routes;

class PostingDetailsScreen extends StatelessWidget {
  final Posting posting;

  const PostingDetailsScreen({
    Key key,
    this.posting,
  }) : super(key: key);

  String getTitle() {
    if (posting.title == null) {
      return 'Not Specified';
    } else if (posting.title.isBlank) {
      return 'Not Specified';
    } else {
      return posting.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(
                routes.HOME,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('Posting'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getTitle(),
            ),
            Container(
              child: Text(
                posting?.points?.toString() ?? 'Not Provided',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

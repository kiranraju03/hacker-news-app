import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/models/comment_model.dart';

class CommentCard extends StatelessWidget {
  final Comment comments;

  CommentCard({
    this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(
        2 * SizeConfig.safeBlockHorizontal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5 * SizeConfig.safeBlockHorizontal,
        ),
      ),
      elevation: 5,
      color: Colors.white70,
      child: Padding(
        padding: EdgeInsets.all(
          5 * SizeConfig.safeBlockHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 3 * SizeConfig.safeBlockHorizontal,
                ),
                Text(
                  comments?.author ?? 'Unknown',
                  style: author,
                ),
              ],
            ),
            comments?.text != null
                ? Html(
                    data: comments?.text,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

TextStyle author = TextStyle(
  fontSize: 4 * SizeConfig.safeBlockHorizontal,
  fontWeight: FontWeight.bold,
);

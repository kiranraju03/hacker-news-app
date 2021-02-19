import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/models/posting_detail_model.dart';
import 'package:hackernews/routes/routes.dart' as routes;
import 'package:hackernews/widgets/postings/comment_card.dart';

class PostingDetailsScreen extends StatelessWidget {
  final PostingDetails postingDetails;

  const PostingDetailsScreen({
    this.postingDetails,
  });

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
          title: Text('Posting Details'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.safeBlockHorizontal,
            vertical: 2 * SizeConfig.safeBlockVertical,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postingDetails.title == null || postingDetails.title.isBlank
                    ? 'Not Specified'
                    : postingDetails.title,
                style: title,
              ),
              Container(
                child: Text(
                  "Points: ${postingDetails?.points?.toString() ?? 'Not Provided'}",
                  style: points,
                ),
              ),
              SizedBox(
                height: 4 * SizeConfig.safeBlockVertical,
              ),
              Text(
                'Comments : ',
                style: comments,
              ),
              Expanded(
                child: ListView(
                  children: postingDetails.comments
                      .map(
                        (e) => e.text != null
                            ? CommentCard(
                                comments: e,
                              )
                            : Container(),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle title = TextStyle(
  fontSize: 5 * SizeConfig.safeBlockHorizontal,
  fontWeight: FontWeight.bold,
);

TextStyle points = TextStyle(
  fontSize: 4 * SizeConfig.safeBlockHorizontal,
);

TextStyle comments = TextStyle(
  fontSize: 4 * SizeConfig.safeBlockHorizontal,
  fontWeight: FontWeight.bold,
);

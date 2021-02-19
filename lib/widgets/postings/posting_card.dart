import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/constants.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/models/posting_detail_model.dart';
import 'package:hackernews/models/posting_model.dart';
import 'package:hackernews/screens/postings/posting_details_screen.dart';
import 'package:hackernews/services/postings_service.dart';
import 'package:hackernews/widgets/shared/progress_loading_indicator.dart';

class PostingCard extends StatelessWidget {
  final Posting postings;

  const PostingCard({
    Key key,
    this.postings,
  }) : super(key: key);

  Future<void> getPosting() async {
    try {
      showLoading();
      PostingsService postingsService = PostingsService();
      PostingDetails posting = await postingsService.getPosting(
        postingId: int.parse(postings.objectID),
      );
      hideLoading();
      Get.to(
        () => PostingDetailsScreen(
          postingDetails: posting,
        ),
      );
    } catch (_) {
      hideLoading();
      Get.rawSnackbar(
        message: ERROR_MESSAGE,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.safeBlockHorizontal,
        ),
      ),
      margin: EdgeInsets.all(
        2 * SizeConfig.safeBlockHorizontal,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          3 * SizeConfig.safeBlockHorizontal,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50 * SizeConfig.safeBlockHorizontal,
                  child: Text(
                    postings.title.isBlank || postings.title == null
                        ? 'Not Specified'
                        : postings.title,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                postings.objectID != null
                    ? FlatButton(
                        padding: EdgeInsets.zero,
                        onPressed: getPosting,
                        child: Text(
                          'View article',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

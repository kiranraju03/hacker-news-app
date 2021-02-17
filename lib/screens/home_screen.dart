import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/constants.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/models/postings_model.dart';
import 'package:hackernews/services/postings_service.dart';
import 'package:hackernews/widgets/postings/posting_card.dart';
import 'package:hackernews/widgets/shared/progress_loading_indicator.dart';
import '../config/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();
  PostingsService postingsService = PostingsService();
  List<Postings> postings;

  @override
  void initState() {
    postings = [];
    super.initState();
  }

  void onSearchTextChanged(String text) async {
    postings.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    try {
      showLoading();
      List<Postings> temp = await postingsService.getPostingsBySearch(
        searchText: text,
      );
      setState(() {
        postings = temp;
      });
      hideLoading();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } catch (_) {
      hideLoading();
      Get.rawSnackbar(
        message: ERROR_MESSAGE,
      );
    }
  }

  Widget getSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
          leading: const Icon(Icons.search),
          title: TextField(
            controller: searchTextController,
            decoration: InputDecoration(
              hintText: 'Search for an article',
              hintStyle: TextStyle(
                fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
              ),
              border: InputBorder.none,
            ),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              searchTextController.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 4 * SizeConfig.safeBlockHorizontal,
          title: Text('Hacker News'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: 100 * SizeConfig.safeBlockHorizontal,
            height: 90 * SizeConfig.safeBlockVertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getSearchBox(),
                Expanded(
                  child: ListView(
                    children: postings
                        .map(
                          (e) => PostingCard(
                            postings: e,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle title = TextStyle(
  fontSize: 5 * SizeConfig.safeBlockHorizontal,
  color: Colors.black,
);

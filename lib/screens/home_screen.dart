import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hackernews/config/constants.dart';
import 'package:hackernews/config/size_config.dart';
import 'package:hackernews/controllers/search_results_controller.dart';
import 'package:hackernews/models/posting_model.dart';
import 'package:hackernews/services/debounce.dart';
import 'package:hackernews/services/postings_service.dart';
import 'package:hackernews/widgets/postings/posting_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchTextController = TextEditingController();
  PostingsService postingsService = PostingsService();
  List<Posting> postings;
  SearchResultsController searchResultsController =
      Get.find<SearchResultsController>();

  @override
  void initState() {
    searchTextController.text = searchResultsController.searchText;
    postings = searchResultsController.postings;
    super.initState();
  }

  void onSearchTextChanged(String text) async {
    final _debouncer = Debouncer(milliseconds: 1000);
    postings.clear();
    if (text.isEmpty) {
      setState(() {});
      searchResultsController.init();
      return;
    }
    _debouncer.run(
      () async {
        try {
          List<Posting> temp = await postingsService.getPostingsBySearch(
            searchText: text,
          );
          setState(() {
            postings = temp;
          });
          searchResultsController.postings = temp;
          searchResultsController.searchText = searchTextController.text;
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        } catch (_) {
          Get.rawSnackbar(
            message: ERROR_MESSAGE,
          );
        }
      },
    );
  }

  Widget getSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10 * SizeConfig.safeBlockHorizontal,
          ),
        ),
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
              hintStyle: hint,
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

TextStyle hint = TextStyle(
  fontSize: 3.5 * SizeConfig.safeBlockHorizontal,
);

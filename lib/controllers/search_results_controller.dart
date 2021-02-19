import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackernews/models/posting_model.dart';

class SearchResultsController extends GetxController {
  String searchText;
  List<Posting> postings;

  init() {
    searchText = '';
    postings = [];
  }
}

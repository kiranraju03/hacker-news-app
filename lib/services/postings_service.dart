import 'package:dio/dio.dart';
import 'package:hackernews/config/constants.dart';
import 'package:hackernews/models/posting_detail_model.dart';
import 'package:hackernews/models/posting_model.dart';

class PostingsService {
  Dio _dio = Dio();

  Future<PostingDetails> getPosting({
    int postingId,
  }) async {
    final String url = '$ENDPOINT/items/$postingId';
    final response = await _dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.data != null) {
      return PostingDetails.fromJson(response.data);
    } else {
      throw response.statusMessage;
    }
  }

  Future<List<Posting>> getPostingsBySearch({
    String searchText,
  }) async {
    final String url = '$ENDPOINT/search';
    final response = await _dio.get(
      url,
      queryParameters: {
        'query': searchText,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (response.data != null) {
      final List data = response.data['hits'] as List;
      return data.map((e) => Posting.fromJson(e)).toList();
    } else {
      throw response.statusMessage;
    }
  }
}

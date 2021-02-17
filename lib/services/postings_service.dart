import 'package:dio/dio.dart';
import 'package:hackernews/config/constants.dart';
import 'package:hackernews/models/posting_model.dart';
import 'package:hackernews/models/postings_model.dart';

class PostingsService {
  Dio _dio = Dio();

  Future<Posting> getPosting({
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
      return Posting.fromJson(response.data);
    } else {
      throw response.statusMessage;
    }
  }

  Future<List<Postings>> getPostingsBySearch({
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
      return data.map((e) => Postings.fromJson(e)).toList();
    } else {
      throw response.statusMessage;
    }
  }
}

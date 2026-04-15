import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

/// HTTP client scoped to JSONPlaceholder API
class ApiClient {

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client _client;

  ApiClient({http.Client? client})
      : _client = client ?? http.Client();

  /// Fetch a single page of posts.
  /// [page] - 1-indexed page number
  /// [limit] - number of items per page
  Future<List<PostModel>> fetchPosts({
    int page = 1,
    int limit = 10
  }) async {
    
    final uri = Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      {
        '_page': page.toString(),
        '_limit': limit.toString(),
      },
    );
    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      // json decode return dynamic
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>; // cast List<dynamic> 

     // map to postmodel
      return jsonList
        .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
        .toList();
    } else {
      // show HTTP error as exception to be catch them and emit as error state later
      throw Exception('Failed to fetch posts. Status : ${response.statusCode}');
    }
  }
}
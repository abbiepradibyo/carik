import 'dart:convert';

import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/data/storage/secure_storage.dart';
import 'package:carikerja/domain/models/response/response_post.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<List<Post>> getAllPostHome(
      [String lat = '', String long = '', int start = 0, int limit = 0]) async {
    final token = await secureStorage.readToken();

    final resp = await http
        .post(Uri.parse('${Environment.urlApi}/post/get-all-posts'), headers: {
      'Accept': 'application/json',
      'xxx-token': token!
    }, body: {
      'lat': lat,
      'long': long,
      'offs': start.toString(),
      'limit': limit.toString(),
      // 'offs': '7',
      // 'limit': '2'
    });

    return ResponsePost.fromJson(jsonDecode(resp.body)).posts;
  }
}

final postService = PostServices();

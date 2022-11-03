import 'dart:convert';

import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/data/storage/secure_storage.dart';
import 'package:carikerja/domain/models/response/response_categori.dart';
import 'package:http/http.dart' as http;

class CategoriServices {
  Future<List<Categori>> getAllCategories() async {
    final token = await secureStorage.readToken();

    final resp = await http.post(
        Uri.parse('${Environment.urlApi}/categories/get-all-categories'),
        headers: {'Accept': 'application/json', 'xxx-token': token!});

    return ResponseCategori.fromJson(jsonDecode(resp.body)).categories;
  }
}

final categoriService = CategoriServices();

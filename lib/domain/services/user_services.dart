import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/ui/helpers/debouncer.dart';
import 'package:carikerja/data/storage/secure_storage.dart';
import 'package:carikerja/domain/models/response/response_user.dart';

class UserServices {
  final debouncer = DeBouncer(duration: const Duration(milliseconds: 800));

  void dispose() {}

  Future<ResponseUser> getUserById() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${Environment.urlApi}/user/get-User-By-Id'),
        headers: {'Accept': 'application/json', 'xxx-token': token!});

    return ResponseUser.fromJson(jsonDecode(resp.body));
  }
}

final userService = UserServices();

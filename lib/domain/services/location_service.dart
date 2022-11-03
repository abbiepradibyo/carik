import 'dart:async';
import 'dart:convert';
import 'package:carikerja/data/storage/secure_storage.dart';
import 'package:carikerja/domain/models/response/response_location.dart';
import 'package:http/http.dart' as http;
import 'package:carikerja/data/env/env.dart';
import 'package:carikerja/ui/helpers/debouncer.dart';
import 'package:location/location.dart';

class LocationServices {
  final debouncer = DeBouncer(duration: const Duration(milliseconds: 800));

  void dispose() {}

  Future<ResponseLocation> getLocation(LocationData location) async {
    final token = await secureStorage.readToken();
    final resp = await http.post(
        Uri.parse('${Environment.urlApi}/location/get-Location'),
        headers: {
          'Accept': 'application/json',
          'xxx-token': token!
        },
        body: {
          'latitude': location.latitude.toString(),
          'longitude': location.longitude.toString()
        });
    return ResponseLocation.fromJson(jsonDecode(resp.body));
  }
}

final locationService = LocationServices();

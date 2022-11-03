import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationStorage {
  Future<void> persistenLocation(LocationData coordinate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("latitude", coordinate.latitude.toString());
    await prefs.setString("longitude", coordinate.longitude.toString());
  }

  Future<String?> readLatitude() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("latitude");
  }

  Future<String?> readLongitude() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("longitude");
  }

  Future<void> deleteLocationStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('latitude');
    await prefs.remove('longitude');
  }
}

final locationStorage = LocationStorage();

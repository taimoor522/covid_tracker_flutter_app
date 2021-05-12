import 'package:covid_tracker/models/location_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationDataService {
  static Future<LocationData> getData(String locationName) async {
    var url = Uri.parse(
        "https://covid-api.mmediagroup.fr/v1/cases?country=${locationName}");

    var responce = await http.get(url);

    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);
      LocationData locationData = LocationData();
      locationData.fromMap(data);
      return locationData;
    }
  }
}

import 'dart:convert';

import 'package:climate_flutter/services/network.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const whether_api_Key = 'd868dbcd4e73c1425d97c00a85dface4';

class GetCurrentUserLocation {
  var lati;
  var long;

  Future<void> GetLocationData() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lati = position.latitude;
      long = position.longitude;
      print(lati + long);

      final finalUri =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$long&appid=$whether_api_Key';

      Networking networkreq = Networking(finalUri);
      var data = await networkreq.GetData();
      var temp = data['main']['temp'];
      var desc = data[0]['description']; //weather[0].description
    } catch (e) {
      print('Unable to Load Location');
    }
  }
}

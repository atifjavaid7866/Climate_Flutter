import 'package:geolocator/geolocator.dart';
import 'package:climate_flutter/services/network.dart';

const whether_api_Key = 'd868dbcd4e73c1425d97c00a85dface4';
const whetherapi_firstpart = 'https://api.openweathermap.org/data/2.5/weather';

class GetUserLocation {
  var lati;
  var long;
  var data;

  Future<dynamic> GetStateByCityName(String cityName) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lati = position.latitude;
      long = position.longitude;

      final finalUri =
          '$whetherapi_firstpart?q=$cityName&appid=$whether_api_Key&units=metric';

      Networking networkreq = Networking(finalUri);
      data = await networkreq.GetData();
      return data;
    } catch (e) {
      return 'Unable to Load Location';
    }
  }

  Future<dynamic> GetState() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lati = position.latitude;
      long = position.longitude;

      final finalUri =
          '$whetherapi_firstpart?lat=$lati&lon=$long&appid=$whether_api_Key&units=metric';

      Networking networkreq = Networking(finalUri);
      data = await networkreq.GetData();
      return data;
    } catch (e) {
      return 'Unable to Load Location';
    }
  }
}

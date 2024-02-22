import 'package:climate_flutter/screens/city_screen.dart';
import 'package:climate_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_flutter/utilities/constants.dart';
import 'package:climate_flutter/services/whether.dart';
import 'package:climate_flutter/utilities/comindaysweatherprediction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurWeatherData {
  var obj;
  // CurWeatherData(this.obj);
  var temperature;
  var city;
  var condition;
  var cusIcon;
  var getMessage;
  var temp_min;
  var temp_max;
  var wind_speed;
  var cur_weather_icon;
  var date_time;
  WeatherModel whetherModel = WeatherModel();
  void UpdateUi(dynamic obj) {
    print("weather Data: $obj");
    if (obj == null) {
      temperature = 0;
      city = ' ';
      getMessage = 'Unable to get Location';
      temp_max = 0;
      temp_min = 0;
    }
    temperature = obj['main']['temp'].toInt();
    city = obj['name'];
    condition = obj['weather'][0]['id'];
    temp_min = obj['main']['temp_min']; //main.temp_min
    temp_max = obj['main']['temp_max'];
    wind_speed = obj['wind']['speed'].round();
    cur_weather_icon = obj['weather'][0]['icon']; //1708393678

    cusIcon = whetherModel.getWeatherIcon(condition);
    getMessage = whetherModel.getMessage(temperature);
  }
}

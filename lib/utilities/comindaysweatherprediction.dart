import 'package:climate_flutter/services/curweatherdata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FutureForCast extends StatelessWidget {
  CurWeatherData newobj;
  FutureForCast({required this.newobj});
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Wednesday'),
        Text('${newobj.cusIcon}', style: TextStyle(fontSize: 40.0)),
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                    height: 50.0,
                    'https://openweathermap.org/img/wn/09n@2x.png'),
                Text('80%'),
              ]),
        ),
        SizedBox(height: 5.0),
        Icon(FontAwesomeIcons.wind),
        Text('${newobj.wind_speed} km/h'),
      ],
    );
  }
}

// Weather Container Icons Formating
// Column(
//       children: [
//         Text('Wednesday'),
//         Icon(FontAwesomeIcons.cloud),
//         SizedBox(height: 15.0),
//         Icon(FontAwesomeIcons.cloudRain),
//         SizedBox(height: 5.0),
//         Text('80%'),
//         SizedBox(height: 10.0),
//         Icon(FontAwesomeIcons.wind),
//         Text('23 km/h'),
//       ],
//     );

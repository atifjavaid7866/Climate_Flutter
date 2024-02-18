import 'package:climate_flutter/screens/city_screen.dart';
import 'package:climate_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_flutter/utilities/constants.dart';
import 'package:climate_flutter/services/whether.dart';

class LocationScreen extends StatefulWidget {
  var obj;

  LocationScreen({required this.obj}) {}
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel whetherModel = WeatherModel();
  var temperature;
  var city;
  var condition;
  var cusIcon;
  var getMessage;
  void initState() {
    super.initState();
    UpdateUi(widget.obj);
  }

  void UpdateUi(dynamic obj) {
    setState(() {
      temperature = obj['main']['temp'].toInt();
      city = obj['name'];
      condition = obj['weather'][0]['id'];
      cusIcon = whetherModel.getWeatherIcon(condition);
      getMessage = whetherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/whetherappbackground.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      var updateLocation = GetUserLocation().GetState();
                      UpdateUi(updateLocation);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var userInputCity =
                            Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ));
                      });
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${city}',
                      style: TextStyle(fontSize: 40.0),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${temperature.toString() + "\u00B0"}',
                          style: kTempTextStyle,
                        ),
                        Text(
                          '$cusIcon',
                          style: TextStyle(
                            fontSize: 100.0,
                            // color: temperature <= 13
                            //     ? Color(0xffeade75)
                            //     : Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 35.0, bottom: 30.0, left: 15.0),
                child: Text(
                  '$getMessage in $city',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

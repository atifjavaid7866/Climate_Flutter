import 'package:climate_flutter/screens/city_screen.dart';
import 'package:climate_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:climate_flutter/utilities/constants.dart';
import 'package:climate_flutter/services/curweatherdata.dart';
import 'package:climate_flutter/utilities/comindaysweatherprediction.dart';

class LocationScreen extends StatefulWidget {
  var curLocationObj;

  LocationScreen({required this.curLocationObj});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  CurWeatherData curWeatherDataObj = CurWeatherData();

  void initState() {
    super.initState();
    curWeatherDataObj.UpdateUi(widget.curLocationObj);
  }

  void UpdateUi(dynamic obj) {
    setState(() {
      curWeatherDataObj.UpdateUi(obj);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(cur_weather_icon);
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
        child: ListView(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          var updateLocation =
                              await GetUserLocation().GetState();
                          UpdateUi(updateLocation);
                        },
                        icon: Icon(
                          Icons.near_me,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() async {
                              var userInputCity = await Navigator.push(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ));

                              GetUserLocation getLocation = GetUserLocation();
                              var userobj =
                                  await getLocation.GetStateByCityName(
                                      userInputCity);
                              UpdateUi(userobj);
                            });
                          },
                          icon: Icon(
                            Icons.location_city,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${curWeatherDataObj.city}',
                          style: TextStyle(fontSize: 35.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(children: [
                                Text(
                                  '${curWeatherDataObj.temperature.toString() + "\u00B0"}',
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  '${curWeatherDataObj.cusIcon}',
                                  style: TextStyle(
                                    fontSize: 100.0,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              // color: Colors.red,
                              margin: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Column(children: [
                                Text('${curWeatherDataObj.temp_min}',
                                    style: kTempMaxMinTextStyle),
                                SizedBox(
                                  child: Container(
                                    width: 70,
                                    height: 2.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text('${curWeatherDataObj.temp_max}',
                                    style: kTempMaxMinTextStyle),
                              ]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xff05467a)),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureForCast(newobj: curWeatherDataObj),
                          FutureForCast(newobj: curWeatherDataObj),
                          FutureForCast(newobj: curWeatherDataObj),
                          FutureForCast(newobj: curWeatherDataObj),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30.0, right: 35.0, bottom: 30.0, left: 15.0),
                    child: Container(
                      child: Text(
                        '${curWeatherDataObj.getMessage} in ${curWeatherDataObj.city}',
                        style: kMessageTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:climate_flutter/services/getCurrentLocation.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  GetCurrentUserLocation locationObj = GetCurrentUserLocation();
  var getposition;
  var lati;
  var long;
  void initState() {
    super.initState();
    CheckState();
  }

  void CheckState() async {
    await locationObj.GetLocationData();
    setState(() {
      lati = locationObj.lati;
      long = locationObj.long;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Get Location'),
              SizedBox(height: 20.0),
              Text('${locationObj.lati}'),
              Text('${locationObj.long}'),
            ],
          ),
        ),
      ),
    );
  }
}

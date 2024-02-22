import 'package:climate_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  GetUserLocation getLocation = GetUserLocation();

  var decoded_data;

  void initState() {
    super.initState();
    CheckState();
  }

  void CheckState() async {
    decoded_data = await getLocation.GetState();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        curLocationObj: decoded_data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}

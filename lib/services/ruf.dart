// // import 'package:climate_flutter/services/getCurrentLocation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   GetCurrentUserLocation locationObj = GetCurrentUserLocation();
//   var getposition;
//   var lati;
//   var long;
//   void initState() {
//     super.initState();
//     CheckState();
//   }

//   void CheckState() async {
//     await locationObj.GetLocationData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SpinKitDoubleBounce(
//           color: Colors.red,
//           size: 50.0,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var networkData = await WeatherModel().getLocationWeather();
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationData: networkData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitFadingFour(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import '../services/networking.dart';
import '../services/location.dart';

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
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        latitude: location.latitude, longitude: location.longitude);

    var networkData = await networkHelper.getData();
    print(networkData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

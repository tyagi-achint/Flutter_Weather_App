import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import '../utilities/api_key.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location currentLocation = Location();
    await currentLocation.getLocation();
  }

  void getData() async {
    final Uri url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '28',
        'lon': '77',
        'units': 'metric',
        'APPID': apiKey,
      },
    );
    print(apiKey);

    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

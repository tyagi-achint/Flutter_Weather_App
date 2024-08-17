import '../utilities/api_key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  Future getData() async {
    final Uri url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'units': 'metric',
        // Add API key || make a file(api_key.dart) for api key in utilities
        'APPID': apiKey,
      },
    );
    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        // double temp = decodedData['main']['temp'];
        // int id = decodedData['weather'][0]['id'];
        // String cityName = decodedData['name'];
        return decodedData;
      } else {
        return ('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      return ('Error occurred: $e');
    }
  }
}

import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print('Location permissions are denied');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
        latitude = position.latitude;
        longitude = position.longitude;

        return (latitude, longitude);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

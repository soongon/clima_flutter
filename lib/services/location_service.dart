import 'package:geolocator/geolocator.dart';

class LocationService {

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition();
      // 동기 vs 비동기(async)
      // 동기 - 메모리상에서 하는 작업
      // 비동기 - IO 에서는 반드시 비동기 작업..
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }
}
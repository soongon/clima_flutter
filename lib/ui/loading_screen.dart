import 'package:clima_flutter/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void _currentPosition() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    print('${locationService.latitude}, ${locationService.longitude}');
  }

  @override
  void initState() {
    super.initState();
    _currentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('위치정보 가져오기'),
          onPressed: () {  },
        ),
      ),
    );
  }
}

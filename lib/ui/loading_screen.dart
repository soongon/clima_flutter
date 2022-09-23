import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void _getCurrentLocation() async {

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition();
      // 동기 vs 비동기(async)
      // 동기 - 메모리상에서 하는 작업
      // 비동기 - IO 에서는 반드시 비동기 작업..

      print(position);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('위치정보 가져오기'),
          onPressed: () { _getCurrentLocation(); },
        ),
      ),
    );
  }
}

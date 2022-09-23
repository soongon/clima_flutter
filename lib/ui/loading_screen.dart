import 'dart:convert';

import 'package:clima_flutter/services/location_service.dart';
import 'package:clima_flutter/services/weather_api_service.dart';
import 'package:clima_flutter/ui/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void _getWeatherJsonData() async {
    //1. GPS 센서에서 현재 좌표를 받아온다.
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();
    print('${locationService.latitude}, ${locationService.longitude}');

    //2. 현재좌표를 이용해서 날씨API 서비스에서 날씨정보를 요청한다.
    WeatherApiService weatherApiService = WeatherApiService();
    // 2-1. 날씨정보를 JsON 데이터로 확보
    var weatherDataJson = await weatherApiService.getWeatherInfoWithLocation(
        latitude: locationService.latitude, longitude: locationService.longitude);

    print(weatherDataJson);

    //3. location 화면으로 이동
    Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData: weatherDataJson);
    }));

  }

  @override
  void initState() {
    super.initState();
    //1.날씨 정보 확보
    _getWeatherJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.purple,
          size: 100,
          lineWidth: 3.0,
        ),
      ),
    );
  }
}

import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/ui/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  late var weatherData;

  LocationScreen({Key? key, this.weatherData}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late int temperature;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;

  void _updateUI() {
    // 1. 이전화면에서 전달된 데이터를 확보
    var weather = widget.weatherData;
    //print('Location Screen: \n$weather');
    // 2. 전달된 데이터는 JSON 데이터 이다.
    // 따라서, JSON 을 파싱하여 원하는 데이터를 뽑아낸다.
    // 온도, 날씨아이콘, 도시명
    print(weather['name']);
    print(weather['main']['temp'].toInt());
    print(weather['weather'][0]['id']);

    setState(() {
      temperature = weather['main']['temp'].toInt();
      cityName = weather['name'];
      weatherIcon =
          WeatherModel().getWeatherIcon(weather['weather'][0]['id']);
      weatherMessage = WeatherModel().getMessage(weather['main']['temp'].toInt());
    });
  }

  @override
  void initState() {
    super.initState();

    _updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

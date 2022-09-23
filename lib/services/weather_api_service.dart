import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {

  Future<dynamic> getWeatherDataWithCityName({required String cityName}) async {
    var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': cityName,
          'units': 'metric',
          'appid': '5df3f1b99c9227bb6bb15d61c2b5bf9b'
        }
    );
    var res = await http.get(url);
    return jsonDecode(res.body);
  }

  Future<dynamic> getWeatherInfoWithLocation(
      {required double latitude, required double longitude}) async {
    var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': latitude.toString(),
          'lon': longitude.toString(),
          'units': 'metric',
          'appid': '5df3f1b99c9227bb6bb15d61c2b5bf9b'
        }
    );

    var res = await http.get(url);
    return jsonDecode(res.body);
  }

}
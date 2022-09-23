import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class CityScreen extends StatelessWidget {
  CityScreen({Key? key}) : super(key: key);

  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  hintText: '도시 이름을 적어주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

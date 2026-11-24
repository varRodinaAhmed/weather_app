import 'package:flutter/material.dart';
import 'package:weather_app/models/week_weather_model.dart';

class day_temp_card extends StatelessWidget {
  WeekWeatherModel dayWeather;
  day_temp_card({super.key, required this.dayWeather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(dayWeather.day)),
          SizedBox(width: 110),
          Image.asset(dayWeather.stateIcon, scale: 0.6),

          SizedBox(width: 50),
          Text('${dayWeather.maxTemp.round()}°'),
          SizedBox(width: 10),
          Text('${dayWeather.minTemp.round()}°'),
        ],
      ),
    );
  }
}

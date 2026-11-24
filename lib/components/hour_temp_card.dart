import 'package:flutter/material.dart';
import 'package:weather_app/models/hour_weather_model.dart';

class hourTempCard extends StatelessWidget {
  HourWeatherModel hour;
  hourTempCard({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.5),
      child: Column(
        children: [
          Text(
            "${formatTime(hour.time.hour)}:${formatTime(hour.time.minute)}",

            style: TextStyle(fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Image.asset(hour.stateIcon, scale: 0.75),
          ),
          Text(
            "${hour.temp.round().toString()}°",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  String formatTime(int value) {
    return value.toString().padLeft(2, '0');
  }
}

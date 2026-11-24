import 'package:flutter/material.dart';
import 'package:weather_app/components/background.dart';
import 'package:weather_app/components/day_temp_card.dart';
import 'package:weather_app/components/hour_temp_card.dart';
import 'package:weather_app/components/main_temp_display.dart';
import 'package:weather_app/models/today_weather_model.dart';

class WeatherView extends StatelessWidget {
  TodayWeatherModel weather;

  WeatherView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(imageUrl: weather.backgroundUrl),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.topRight,
                    child: mainTempDisplay(
                      mainTemp: weather.temp,
                      minTemp: weather.minTemp,
                      maxTemp: weather.maxTemp,
                      city: weather.city,
                      country: weather.country,
                    ),
                  ),

                  const SizedBox(height: 300),

                  Text(weather.weatherState, style: TextStyle(fontSize: 14)),
                  const Divider(),

                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weather.hourlyWeather.length,
                      itemBuilder: (context, index) {
                        return hourTempCard(hour: weather.hourlyWeather[index]);
                      },
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('next days temperture')],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: weather.weeklyWeather.length,
                      itemBuilder: (context, index) {
                        return day_temp_card(
                          dayWeather: weather.weeklyWeather[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

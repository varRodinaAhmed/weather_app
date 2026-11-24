import 'package:weather_app/const/iconsData.dart';

class HourWeatherModel {
  late DateTime time;
  late double temp;
  late String weatherState;
  late String stateIcon;
  late int isDay;
  HourWeatherModel({
    required this.temp,
    required String Strtime,
    required this.weatherState,
    required this.isDay,
  }) {
    this.time = stringToDateTime(Strtime);
    this.stateIcon = getHourlyWeatherIcon(this.weatherState, this.isDay);
  }
  DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }

  String getHourlyWeatherIcon(String condition, int isDay) {
    final c = condition.toLowerCase();

    if (c == 'sunny' || c == 'clear') {
      return (isDay == 1) ? Iconsdata.sunny : Iconsdata.partialyCloudyNight;
    }

    if (c.contains('partly cloudy')) {
      return (isDay == 1)
          ? Iconsdata.partialyCloudySun
          : Iconsdata.partialyCloudyNight;
    }

    // أي حالة تانية (غيوم كتيفة، غبار، شبورة، مطر، ثلج، رعد...)
    return (isDay == 1) ? Iconsdata.mostCloudySun : Iconsdata.mostCloudyNight;
  }
}

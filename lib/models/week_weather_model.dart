import 'package:weather_app/const/iconsData.dart';

class WeekWeatherModel {
  late String day;
  late double maxTemp;
  late double minTemp;
  late String weatherState;
  late String stateIcon;
  WeekWeatherModel({
    required strDay,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
  }) {
    DateTime day = stringToDateTime(strDay);
    this.day = getWeekDay(day);
    this.stateIcon = getWeeklyWeatherIcon(weatherState);
  }
  DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }

  String getWeekDay(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[date.weekday - 1];
  }

  String getWeeklyWeatherIcon(String condition) {
    const clearStates = {'Sunny', 'Clear'};

    const partlyCloudyStates = {'Partly cloudy'};

    const mostCloudyStates = {
      'Cloudy',
      'Overcast',
      'Haze',
      'Dust haze',
      'Blowing dust',
      'Dust storm',
      'Sandstorm',
      'Severe sandstorm',
      'Mist',
      'Smoke',
      'Smoky haze',
      'Smog',
      'Severe smog',
      'Saharan dust',
      'Dust',
      'Patchy rain possible',
      'Patchy snow possible',
      'Patchy sleet possible',
      'Patchy freezing drizzle possible',
      'Thundery outbreaks possible',
      'Blowing snow',
      'Blizzard',
      'Fog',
      'Freezing fog',
      'Patchy light drizzle',
      'Light drizzle',
      'Freezing drizzle',
      'Heavy freezing drizzle',
      'Patchy light rain',
      'Light rain',
      'Moderate rain at times',
      'Moderate rain',
      'Heavy rain at times',
      'Heavy rain',
      'Light freezing rain',
      'Moderate or heavy freezing rain',
      'Light sleet',
      'Moderate or heavy sleet',
      'Patchy light snow',
      'Light snow',
      'Patchy moderate snow',
      'Moderate snow',
      'Patchy heavy snow',
      'Heavy snow',
      'Ice pellets',
      'Light rain shower',
      'Moderate or heavy rain shower',
      'Torrential rain shower',
      'Light sleet showers',
      'Moderate or heavy sleet showers',
      'Light snow showers',
      'Moderate or heavy snow showers',
      'Light showers of ice pellets',
      'Moderate or heavy showers of ice pellets',
      'Patchy light rain with thunder',
      'Moderate or heavy rain with thunder',
      'Patchy light snow with thunder',
      'Moderate or heavy snow with thunder',
    };

    if (clearStates.contains(condition)) {
      return Iconsdata.sunny;
    }

    if (partlyCloudyStates.contains(condition)) {
      return Iconsdata.partialyCloudySun;
    }

    if (mostCloudyStates.contains(condition)) {
      return Iconsdata.mostCloudySun;
    }

    // fallback لأي حالة مش متوقعة
    return Iconsdata.mostCloudySun;
  }
}

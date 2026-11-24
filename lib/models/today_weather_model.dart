import 'package:weather_app/const/backgroundData.dart';
import 'package:weather_app/models/hour_weather_model.dart';
import 'package:weather_app/models/week_weather_model.dart';

class TodayWeatherModel {
  late String city;
  late String country;
  late double temp;
  late double maxTemp;
  late double minTemp;
  late String weatherState;
  late List<HourWeatherModel> hourlyWeather;
  late List<WeekWeatherModel> weeklyWeather;
  late String backgroundUrl;
  late int isDay;

  TodayWeatherModel({
    required this.country,
    required this.city,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.hourlyWeather,
    required this.weeklyWeather,
    required this.backgroundUrl,
    required this.isDay,
  });
  factory TodayWeatherModel.fromJson(json) {
    return TodayWeatherModel(
      country: json["location"]["country"],
      city: json["location"]["name"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherState:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      hourlyWeather: createHourlyList(json),
      weeklyWeather: createWeeklyList(json),
      backgroundUrl: getBackgrond(
        json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        json["current"]["is_day"],
      ),
      isDay: json["current"]["is_day"],
    );
  }

  static List<HourWeatherModel> createHourlyList(json) {
    List<HourWeatherModel> hourList = [];
    for (var i = 0; i < 24; i++) {
      hourList.add(
        HourWeatherModel(
          temp: json["forecast"]["forecastday"][0]["hour"][i]["temp_c"],
          Strtime: json["forecast"]["forecastday"][0]["hour"][i]["time"],
          weatherState:
              json["forecast"]["forecastday"][0]["hour"][i]["condition"]["text"],
          isDay: json["forecast"]["forecastday"][0]["hour"][i]["is_day"],
        ),
      );
    }
    return hourList;
  }

  static List<WeekWeatherModel> createWeeklyList(json) {
    List<WeekWeatherModel> weekList = [];
    for (var i = 1; i <= 2; i++) {
      weekList.add(
        WeekWeatherModel(
          strDay: json["forecast"]["forecastday"][i]["date"],
          maxTemp: json["forecast"]["forecastday"][i]["day"]["maxtemp_c"],
          minTemp: json["forecast"]["forecastday"][i]["day"]["mintemp_c"],
          weatherState:
              json["forecast"]["forecastday"][i]["day"]["condition"]["text"],
        ),
      );
    }
    return weekList;
  }

  static String getBackgrond(String weatherState, int isDay) {
    final c = weatherState.toLowerCase();

    if (c.contains('dust') ||
        c.contains('sandstorm') ||
        c.contains('sand storm') ||
        c.contains('overcast')) {
      return Backgrounddata.sandBackground;
    }

    // ثلج / صقيع / برد

    if (c.contains('snow') ||
        c.contains('sleet') ||
        c.contains('blizzard') ||
        c.contains('ice pellets') ||
        c.contains('freezing')) {
      return Backgrounddata.snowBackground;
    }

    // مطر / رذاذ / عاصفة رعدية

    if (c.contains('rain') || c.contains('drizzle') || c.contains('thunder')) {
      return Backgrounddata.rainBackground;
    }

    // مفيش مطر ولا ثلج ولا غبار -> نفرق بين ليل ونهار

    return (isDay == 1)
        ? Backgrounddata.sunnyBackground
        : Backgrounddata.nightBackground;
  }
}

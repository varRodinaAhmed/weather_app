import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/today_weather_model.dart';

class Weatherservice {
  Dio dio = Dio();
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "c68061f017dd498db8e231637262807";

  Future<TodayWeatherModel> getWeatherData({required String city}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$city&days=7&aqi=no&alerts=no",
      );

      TodayWeatherModel weather = TodayWeatherModel.fromJson(response.data);
      print(response.data);
      return weather;
    } on DioException catch (e) {
      final String errormsg =
          e.response?.data["error"]["message"] ??
          "there was an error , try later";
      throw Exception(errormsg);
    } catch (e) {
      print(e.toString());
      throw Exception("there was an error , try later");
    }
  }
}

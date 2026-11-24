import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/services/weatherService.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  late TodayWeatherModel weather;
  void getWeather({required String searchCity}) async {
    emit(WeatherLoadingState());
    try {
      weather = await Weatherservice().getWeatherData(city: searchCity);
      print(weather.city);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureState(err: e.toString()));
    }
  }
}

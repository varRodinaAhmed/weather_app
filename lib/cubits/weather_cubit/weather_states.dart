sealed class WeatherStates {}

final class WeatherInitialState extends WeatherStates {}

final class WeatherLoadingState extends WeatherStates {}

final class WeatherSuccessState extends WeatherStates {}

final class WeatherFailureState extends WeatherStates {
  late String err;
  WeatherFailureState({required this.err});
}

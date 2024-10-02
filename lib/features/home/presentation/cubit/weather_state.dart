part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}


 // ignore: must_be_immutable
 class GetWeatherLoading extends WeatherState {
  List <WeatherModel> weathers;
  GetWeatherLoading(this.weathers);
}
 class FailWeatherstate extends WeatherState {
  final String message;

  FailWeatherstate(this.message);
 }

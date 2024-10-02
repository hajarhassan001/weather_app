import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/data/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

    Future<List<WeatherModel>> getWeather({required String city}) async {
    try {
      Response response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=f5a6c4f896bd4d44823162233242909&q=$city&days=3&aqi=no&alerts=no');

      List<WeatherModel> weatherList = [
        WeatherModel.fromJson(response.data, 0),
        WeatherModel.fromJson(response.data, 1),
        WeatherModel.fromJson(response.data, 2),
      ];
            emit(GetWeatherLoading(weatherList));

      return weatherList;
    } on DioException catch (e) {
      final message = e.response?.data['error']['message'] ?? 'not found';
      emit(FailWeatherstate(message));
      throw Exception(message);
    } catch (e) {
            emit(FailWeatherstate('trying later! $e'));

      throw Exception('trying later! $e');

    }
  }
}

import 'package:dio/dio.dart';
import 'package:weather_app/features/home/data/weather_model.dart';

class WeatherServiceApi {
  Future<List<WeatherModel>> getWeather({required String city}) async {
    try {
      Response response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=f5a6c4f896bd4d44823162233242909&q=$city&days=3&aqi=no&alerts=no');

      List<WeatherModel> weatherList = [
        WeatherModel.fromJson(response.data, 0),
        WeatherModel.fromJson(response.data, 1),
        WeatherModel.fromJson(response.data, 2),
      ];
      return weatherList;
    } on DioException catch (e) {
      final message = e.response?.data['error']['message'] ?? 'not found';
      throw Exception(message);
    } catch (e) {
      throw Exception('trying later! $e');
    }
  }
}

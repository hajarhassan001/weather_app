class WeatherModel {
  final String cityName;
  final String date;
  final double avgtemp;
  final double mintemp;
  final double maxtemp;
  final String weatherStateName;
  final String icon;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.avgtemp,
      required this.mintemp,
      required this.maxtemp,
      required this.weatherStateName,
      required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json, int index) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['forecast']['forecastday'][index]['date'],
      avgtemp: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
      mintemp: json['forecast']['forecastday'][index]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
      weatherStateName: json['forecast']['forecastday'][index]['day']
          ['condition']['text'],
      icon: json['forecast']['forecastday'][index]['day']['condition']['icon'],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/witgets/no_weather_data.dart';
import 'package:weather_app/features/home/presentation/witgets/weather_data.dart';
import 'package:weather_app/features/search/presentation/search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.value});
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Switch(value: value, onChanged: (val) {

        }),
        actions: [IconButton(onPressed: () {

            GoRouter.of(context).push('/search_screen.dart');
        }, icon: const Icon(Icons.search))],
      ),
      body: 
      
      // weather.isEmpty? NoWeatherData(): WeatherData(weatherList: weather,)

      BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is GetWeatherLoading){
           return  WeatherData(weatherList:state.weathers,);
          }
          else {
            return const NoWeatherData();
          }
           
        },
      )
        
      
    );
  }
}

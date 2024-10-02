import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.weatherList});
  final List<WeatherModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              weatherList[index].cityName,
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 77, 113, 212)),
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(weatherList[index].weatherStateName,
                      style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(weatherList[index].date,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https:${weatherList[index].icon}'),
                      Text(
                        "${weatherList[index].avgtemp.toString()} C ",
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Min'),
                        Text("${weatherList[index].mintemp.toString()} C ")
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Mix"),
                        Text("${weatherList[index].maxtemp.toString()} C ")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      itemCount: 3,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}

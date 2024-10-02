import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/data/weather_service_api.dart';
import 'package:weather_app/features/home/presentation/cubit/weather_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for your city'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter City Name',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter City Name' : null,
                  )),
            ),
            MaterialButton(
              onPressed: () async {
           //     GoRouter.of(context).pop();

                if (formkey.currentState!.validate()) {
                  BlocProvider.of<WeatherCubit>(context).getWeather(city: controller.text);
                  // weather = await WeatherServiceApi().getWeather(
                  //   city: controller.text,
                  // );
                  // Navigator.pop(context);
                   GoRouter.of(context).pop();

              //    GoRouter.of(context).push('/home.dart');
                }
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Text('Search Now!'),
            )
          ],
        ),
      ),
    );
  }
}

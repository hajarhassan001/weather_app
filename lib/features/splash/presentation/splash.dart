import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
Future.delayed(
  const Duration(
    seconds: 2
  ),()
  {
GoRouter.of(context).pushReplacement('/onboardingscreen.dart');
  },
);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Weather',
          style: TextStyle(
              fontSize: 29,

              fontWeight: FontWeight.bold,
              
              color: Color.fromARGB(255, 77, 113, 212)),
        ),
      ),
    );
  }
}


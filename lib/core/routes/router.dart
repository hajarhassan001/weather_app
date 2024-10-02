import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/presentation/home.dart';
import 'package:weather_app/features/onboarding/presentation/onboardingscreen.dart';
import 'package:weather_app/features/search/presentation/search_screen.dart';
import 'package:weather_app/features/splash/presentation/splash.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
   GoRoute(
    path: '/onboardingscreen.dart',
    builder: (context, state) => const Onboardingscreen(),
  ),
   GoRoute(
    path: '/home.dart',
    builder: (context, state) => const HomePage(value: false,),
  ),
   GoRoute(
    path: '/search_screen.dart',
    builder: (context, state) => const SearchScreen(),
  ),
]);

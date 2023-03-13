import 'package:flutter/material.dart';
import 'package:lady_taxi/ui/home/home_page.dart';
import 'package:lady_taxi/ui/onBording/on_Bording.dart';
import 'package:lady_taxi/ui/registery/enter_phone_number.dart';
import 'package:lady_taxi/ui/registery/profile_create_page.dart';
import 'package:lady_taxi/ui/splash/splash.dart';

abstract class RouteName {
  static const splash = '/splash';
  static const onBoarding = 'onBoarding';
  static const enterPhoneNumber = '/enterPhoneNumer';
  static const languageChange = '/languageChange';
  static const about = '/about';
  static const profileCreate = '/profileCreate';
  static const home = '/home';
  static const noInternet = '/noInternet';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBordingPage());
      case RouteName.enterPhoneNumber:
        return MaterialPageRoute(builder: (_) => const EnterNumberPage());
      case RouteName.profileCreate:
        return MaterialPageRoute(
            builder: (_) => ProfileCreatePage(
                  token: settings.arguments as String,
                ));
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            token: settings.arguments as String,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/route_constants.dart';
import 'package:flutter_bloc_example/screens/home_screen.dart';
import 'package:flutter_bloc_example/screens/splash_screen.dart';
import 'package:path/path.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteConstants.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }

  static void visitHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteConstants.homeScreenRoute,
      (context) => false,
    );
  }
}

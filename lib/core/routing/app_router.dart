import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case Routes.splashView : 
        return MaterialPageRoute(builder: (context) => const SplashView());

      default : 
         return null;
    }
  } 
}
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/login_view.dart';
import 'package:ecommerce_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case Routes.splashView : 
        return MaterialPageRoute(builder: (context) => const SplashView());

        case Routes.onBoardingView : 
        return MaterialPageRoute(builder: (context) => const OnboardingView());

        case Routes.loginView : 
        return MaterialPageRoute(builder: (context) => const LoginView());

      default : 
         return null;
    }
  } 
}
import 'package:ecommerce_fruits/core/di/dependency_injection.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/signin_view.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/sign_up_view.dart';
import 'package:ecommerce_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());

      case Routes.signInView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SigninCubit>(),
            child: const SignInView(),
          ),
        );

      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpView(),
          ),
        );


      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Home View')),
          ),
        );
      default:
        return null;
    }
  }
}

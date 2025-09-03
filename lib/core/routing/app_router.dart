import 'package:ecommerce_fruits/core/di/dependency_injection.dart';
import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/entities/review_entity.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/signin_view.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/sign_up_view.dart';
import 'package:ecommerce_fruits/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_fruits/features/main/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_fruits/features/main/presentation/views/main_view.dart';
import 'package:ecommerce_fruits/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/product_details.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/reviews_view.dart';
import 'package:ecommerce_fruits/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
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

      case Routes.mainView:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BottomNavigationBarCubit>(),
              ),
              BlocProvider(create: (context) => CartCubit()),
            ],
            child: const MainView(),
          ),
        );

      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case Routes.bestSellingView:
        return MaterialPageRoute(builder: (context) => const BestSellingView());

      case Routes.productDetailsView:
        return MaterialPageRoute(
          builder: (context) => ProductDetails(product: args as ProductEntity),
        );

      case Routes.reviewsView:
        return MaterialPageRoute(
          builder: (context) =>
              ReviewsView(reviews: args as List<ReviewEntity>),
        );

      default:
        return null;
    }
  }
}

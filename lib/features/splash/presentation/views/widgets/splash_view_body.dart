import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {


  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: SvgPicture.asset(Assets.imagesPlant),
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill,),
      ],
    );
  }

  /// Navigates to the next screen based on whether the OnBoarding view has been seen.
  void _navigateToNextScreen() {
    switch (_isOnBoardingViewSeen) {
      case true:
        _navigateToLoginView();
        break;
      case false:
        _navigateToOnBoardingView();
        break;
    }
  }

  /// Navigates to the OnBoarding view after a delay.
  void _navigateToOnBoardingView() {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushNamed(Routes.onBoardingView);
    });
  }

  /// Navigates to the Login view after a delay.
  void _navigateToLoginView() {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushNamed(Routes.loginView);
    });
  }

  /// Checks if the OnBoarding view has been seen and navigates accordingly.
  bool get _isOnBoardingViewSeen {
    return SharedPrefHelper().getValueForKey(
      key: SharedPrefKeys.isOnBoardingViewSeen,
      defaultValue: false,
    );
  }
}

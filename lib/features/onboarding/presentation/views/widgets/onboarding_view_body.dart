import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/features/onboarding/presentation/views/widgets/custom_tab_indicator.dart';
import 'package:ecommerce_fruits/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;

  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }
  
  @override
    void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: OnboardingPageView(pageController: pageController,),),
        verticalSpacing(64),
        CustomTabIndicator(currentIndex:currentPage),
        verticalSpacing(29),
         Visibility(
           visible: currentPage == 1,
           maintainSize: true,
           maintainAnimation: true,
           maintainSemantics: true,
           maintainState: true,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
             child: CustomButton(
              title: LocaleKeys.startNow, 
              onPressed: ()=> _navigateToOnLoginViewView(context),
             ),
           ),
         ),
        verticalSpacing(70),
      ],
    );
  }

  /// Navigates to the Login view and marks the OnBoarding view as seen.
  void _navigateToOnLoginViewView(BuildContext context) {
    SharedPrefHelper().setValueForKey(
      key: SharedPrefKeys.isOnBoardingViewSeen,
      value: true,
    );
    context.pushReplacementNamed(Routes.loginView);
  }
}




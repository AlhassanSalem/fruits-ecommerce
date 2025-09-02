import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/routing/app_router.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashView,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('ar'),
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          onPrimary: Colors.white,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          errorBorder: outlineInputBorder(borderColor: Colors.red),
          focusedErrorBorder: outlineInputBorder(borderColor: Colors.red),
          filled: true,
          fillColor: Color(0xFFF9FAFA),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? Color(0xffE6E9EA), width: 1),
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/routing/app_router.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
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
      ),
    );
  }
}
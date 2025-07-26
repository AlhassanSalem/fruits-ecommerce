import 'package:ecommerce_fruits/core/routing/app_router.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:flutter/material.dart';

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashView,
      debugShowCheckedModeBanner: false,
    );
  }
}
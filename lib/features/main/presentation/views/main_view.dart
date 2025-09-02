import 'package:ecommerce_fruits/features/main/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce_fruits/features/main/presentation/views/widgets/main_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainViewBodyBlocConsumer(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}



import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/di/dependency_injection.dart';
import 'package:ecommerce_fruits/core/helper/custom_bloc_observer.dart';
import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/firebase_options.dart';
import 'package:ecommerce_fruits/fruits_hub.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefHelper().init();
  setupGetIt();
  Bloc.observer = CustomBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: const FruitsHub(),
    ),
  );
}

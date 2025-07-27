import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/fruits_hub.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefHelper().init();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: const FruitsHub()
    ),);
}



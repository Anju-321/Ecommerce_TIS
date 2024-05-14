import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/view/splash/splash_view.dart';
import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     
     
      debugShowCheckedModeBanner: false,
      title: 'FreshDay',
      theme: appTheme,
      home: const SplashView(),
    );
  }
}

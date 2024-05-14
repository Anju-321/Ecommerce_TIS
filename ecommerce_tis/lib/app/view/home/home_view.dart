import 'package:ecommerce_tis/app/widgets/app_text.dart';
import 'package:ecommerce_tis/core/style/fonts.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText("Good Day! 👋🏻",style: headline,),),

    );
  }
}
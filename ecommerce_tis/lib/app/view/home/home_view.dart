import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_tis/app/widgets/app_cached_image.dart';
import 'package:ecommerce_tis/app/widgets/app_text.dart';
import 'package:ecommerce_tis/app/widgets/app_text_field.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:ecommerce_tis/core/style/colors.dart';
import 'package:ecommerce_tis/core/style/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List carouselImages = [
    'assets/images/carousal1.png',
    'assets/images/carousal2.png',
    'assets/images/carousal3.png',
    'assets/images/carousal4.png',
    'assets/images/carousal5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "Good Day! 👋🏻",
          style: titleTwo.copyWith(color: primaryClr),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: highlightTextClr),
              child: const Icon(
                Icons.shopping_cart_checkout_outlined,
                color: primaryClr,
              )),
          8.wBox
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: AppTextField(
              borderRadius: 24,
              bgColor: highlightTextClr,
              hint: "Search grocery",
              borderClr: highlightTextClr,
              prefixIcon: Icon(
                Icons.search,
                color: inputHintClr,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
            ),
            items: carouselImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedImage(
                    imageUrl: i,
                    isAssetImg: true,
                    radius: 12,
                  );
                },
              );
            }).toList(),
          ),
          16.hBox,
          const AppText(
            "Categories",
            style: TextStyle(
                fontFamily: inter6SemiBold, fontSize: 18, color: primaryClr),
          ),
          12.hBox,
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => CategoryContainer(),
              itemCount: 5,
              separatorBuilder: (context, index) => 10.wBox,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
     
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: highlightTextClr),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CachedImage(
            imageUrl: 'assets/images/fruits.png',
            height: 25,
            width: 25,
            isAssetImg: true,
          ),
          4.hBox,
          AppText(
            "title",
            overflow: TextOverflow.ellipsis,
            style: captionOne.copyWith(color: primaryClr),
          )
        ],
      ),
    );
  }
}

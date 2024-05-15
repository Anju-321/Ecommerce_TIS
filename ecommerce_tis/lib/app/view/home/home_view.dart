import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_tis/app/view/customer/customer_view.dart';
import 'package:ecommerce_tis/app/view/product/product_view.dart';
import 'package:ecommerce_tis/app/widgets/app_bottom_nav.dart';
import 'package:ecommerce_tis/app/widgets/app_cached_image.dart';
import 'package:ecommerce_tis/app/widgets/app_text.dart';
import 'package:ecommerce_tis/app/widgets/app_text_field.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:ecommerce_tis/core/screen_utils.dart';
import 'package:ecommerce_tis/core/style/colors.dart';
import 'package:ecommerce_tis/core/style/fonts.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List carouselImages = [
      'assets/images/carousal1.png',
      'assets/images/carousal2.png',
      'assets/images/carousal3.png',
      'assets/images/carousal4.png',
      'assets/images/carousal5.png',
    ];

    final List screens = [
      const HomeView(),
      const ProductView(),
      const CustomerView()
    ];
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
      bottomNavigationBar: AppBottomNav(onTap: (index) {
        Screen.open(screens[index]);
      }),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
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
              height: 180,
              
              autoPlay: true,
              aspectRatio: 1.5,
            ),
            items: carouselImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedImage(
                    width: 280,
                   
                    imageUrl: i,
                    isAssetImg: true,
                    radius: 12,
                  );
                },
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppText(
              "Categories",
              style: TextStyle(
                  fontFamily: inter6SemiBold, fontSize: 18, color: primaryClr),
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => const CategoryContainer(),
              itemCount: 10,
              separatorBuilder: (context, index) => 10.wBox,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppText(
                  "Discovery",
                  style: TextStyle(
                      fontFamily: inter6SemiBold,
                      fontSize: 18,
                      color: primaryClr),
                ),
                const Spacer(),
                AppText(
                  "See All >",
                  style: captionOne.copyWith(color: primaryClr),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DiscoveryContainer(),
                Spacer(),
                DiscoveryContainer(),
              ],
            ),
          ),
   
        ],
      ),
    );
  }
}

class DiscoveryContainer extends StatelessWidget {
  const DiscoveryContainer({
    super.key,this.isProductPage=false
  });

  final bool isProductPage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          35.hBox,
          Container(
            width: 165,
           
            decoration: BoxDecoration(
                color: highlightTextClr,
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            "Mango",
                            style: TextStyle(
                                fontFamily: inter6SemiBold,
                                fontSize: 12,
                                color: primaryClr),
                      
                          ),
                         
                          AppText(
                        "\$10/Kg",
                        style: TextStyle(
                            fontFamily: inter6SemiBold,
                            fontSize: 18,
                            color: primaryClr),
                      ),
                      
                        ],
                      ),
                      const Spacer(),
                      isProductPage?
                      Row(
                        children: [
                          const Icon(Icons.do_not_disturb_on_outlined,color: primaryClr,),
                          2.wBox,
                            const AppText(
                        "1"
                      ),
                      2.wBox,
                      const Icon(Icons.add_circle,color: primaryClr,)
                        ],
                      ):0.hBox,

                    
                    ],
                  ),
                ),
               
                16.hBox
              ],
            ),
          ),
        ],
      ),
      const Positioned(
        left: 60,
        bottom: 80,
        child: CachedImage(
          imageUrl: "assets/images/fruits.png",
          isAssetImg: true,
          height: 50,
          width: 35,
        ),
      ),
    ]);
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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

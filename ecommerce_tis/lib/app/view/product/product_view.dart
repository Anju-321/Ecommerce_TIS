import 'package:ecommerce_tis/app/view/home/home_view.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/style/colors.dart';
import '../../../core/style/fonts.dart';
import '../../widgets/app_cached_image.dart';
import '../../widgets/app_text.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "Products",
          style: titleTwo.copyWith(color: primaryClr),
        ),
        iconTheme: const IconThemeData(color: primaryClr),
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
      bottomNavigationBar: const CheckoutButton(),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.05,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductContainer();
        },
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          35.hBox,
          Container(
          
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const AppText(
                            "Mango",
                            style: TextStyle(
                                fontFamily: inter6SemiBold,
                                fontSize: 10,
                                color: primaryClr),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$10",
                                  style: TextStyle(
                                    fontFamily: inter6SemiBold,
                                    fontSize: 18,
                                    color: primaryClr,
                                  ),
                                ),
                                TextSpan(
                                  text: "/Kg",
                                  style: TextStyle(
                                    fontFamily: inter6SemiBold,
                                    fontSize:
                                        12, // Adjust font size for smaller text
                                    color: Colors
                                        .grey, // Change color to light grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(
                            Icons.do_not_disturb_on_outlined,
                            color: primaryClr,
                          ),                          
                          SizedBox ( width:30,child:  AppText("123456789789789",overflow: TextOverflow.ellipsis,)),                        
                          Icon(
                            Icons.add_circle,
                            color: primaryClr,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                24.hBox
              ],
            ),
          ),
        ],
      ),
      const Positioned(
        left: 60,
        top: 12,
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

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: btmnClr,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  "Subtotal",
                  style: subheadTwo.copyWith(color: inputHintClr),
                ),
                4.hBox,
                AppText(
                  "\$45",
                  style: titleTwo.copyWith(color: primaryClr),
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: primaryClr),
              child: AppText(
                "Checkout Now",
                style: subheadOne.copyWith(color: highlightTextClr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

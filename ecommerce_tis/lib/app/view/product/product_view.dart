import 'package:ecommerce_tis/app/view/home/home_view.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/style/colors.dart';
import '../../../core/style/fonts.dart';
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
          childAspectRatio: 1.25,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,        
        
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const DiscoveryContainer(isProductPage: true,);
        },
      ),
    );
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

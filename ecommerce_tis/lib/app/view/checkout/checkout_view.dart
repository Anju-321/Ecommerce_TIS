import 'package:ecommerce_tis/app/view/product/product_view.dart';
import 'package:ecommerce_tis/app/widgets/app_cached_image.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/style/colors.dart';
import '../../../core/style/fonts.dart';
import '../../widgets/app_text.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "My Cart",
          style: titleTwo.copyWith(color: primaryClr),
        ),
        iconTheme: const IconThemeData(color: primaryClr),
      ),
      bottomNavigationBar: const CheckoutButton(),
      body: ListView.separated(
        shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) => ProductCheckoutTile(),
          itemCount: 10,
          separatorBuilder: (context, index) => 8.hBox,
       
      ),
    );
  }
}

class ProductCheckoutTile extends StatelessWidget {
  const ProductCheckoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Column(
        children: [
          12.hBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 14),
            decoration: BoxDecoration(
                color: highlightTextClr,
                borderRadius: BorderRadius.circular(6)),
            child:  Row(
              children: [
          
                Spacer(),
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
                          fontSize: 14,
                          color: primaryClr),
                    ),
                  ],
                ),
                const Spacer(),
                 Row(
                        children: [
                          const Icon(Icons.do_not_disturb_on_outlined,color: primaryClr,),
                          6.wBox,
                            const AppText(
                        "1"
                      ),
                      6.wBox,
                      const Icon(Icons.add_circle,color: primaryClr,),
                      24.wBox,
                       const AppText(
                      "\$10/Kg",
                      style: TextStyle(
                          fontFamily: inter6SemiBold,
                          fontSize: 18,
                          color: primaryClr),
                    ),
          
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
      const Positioned(
            left: 16,
            top: 0,
            child: CachedImage(
    imageUrl: "assets/images/fruits.png",
    isAssetImg: true,
    height: 50,
    width: 35,
            ),
          ),
      
      ]
    );
  }
}

import 'package:ecommerce_tis/app/view/checkout/checkout_view.dart';
import 'package:ecommerce_tis/app/widgets/app_cached_image.dart';
import 'package:ecommerce_tis/app/widgets/app_svg.dart';
import 'package:ecommerce_tis/app/widgets/app_text.dart';
import 'package:ecommerce_tis/app/widgets/app_text_field.dart';
import 'package:ecommerce_tis/core/extensions/margin_ext.dart';
import 'package:ecommerce_tis/core/screen_utils.dart';
import 'package:ecommerce_tis/core/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/style/fonts.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: AppText(
          "Customers",
          style: titleTwo.copyWith(color: secondaryBrandClr),
          
        ),
      
      ),
      body: Column(
        children: [const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AppTextField(
               hint: "Search Customer",
               borderRadius: 18,
              suffixIcon: Icon(CupertinoIcons.search, size: 20),
          ),
        ),
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          tileColor: highlightTextClr,
          onTap: () {
            Screen.open(const CheckOutView());            
          },
         
         
          leading: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4)
              
            ),
            child: const CachedImage(imageUrl: "assets/images/default_image.png",isAssetImg: true,),


          ),
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText("Nesto Super Market",style:  TextStyle(
                      fontFamily: inter6SemiBold, fontSize: 14, color: secondaryBrandClr),),
            const Spacer(),
            SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            
              children: [  const Icon(CupertinoIcons.phone_circle,size:20,),4.wBox, const AppSvg(assetName: "whatsappIcons",height: 25,width: 25,)],
            
            ),
          ),
            ],
          ),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText("ID: HEJDH",style: captionOne,),
              AppText("Palazhi,Hilite",style: captionOne,),


              

            ],
          ),
       
        )
        ],
      ) ,
    );
  }
}

import 'package:ecommerce_tis/app/widgets/app_svg.dart';
import 'package:ecommerce_tis/app/widgets/app_text.dart';
import 'package:ecommerce_tis/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';

import '../../core/style/colors.dart';
import '../../core/style/fonts.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav(
      {super.key,  required this.onTap});

  static const menus = [
    'home',
    'products',
    'customer',
  ];

 
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      onTap: (index) => onTap(index),
      currentIndex: 0,
      items: menus
          .map(
            (menu) => BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: BnvIcon(
                  iconName: menu,
                  color:primaryClr ,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: BnvIcon(
                  iconName: "${menu}_fill",
                  color: primaryClr,
                ),
              ),
              label: menu.upperFirst,
            ),
          )
          .toList(),
      showUnselectedLabels: true,
      backgroundColor: btmnClr,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
          color: primaryClr, fontSize: 12, fontFamily: inter4Regular),
      unselectedLabelStyle: const TextStyle(
          color: Colors.black, fontSize: 12, fontFamily: inter4Regular),
      fixedColor: primaryClr,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    );
  }
}

class BnvIcon extends StatelessWidget {
  const BnvIcon({
    super.key,
    required this.iconName,
    required this.color,
  });

  final String iconName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AppSvg(assetName: iconName, color: color),
    );
  }
}




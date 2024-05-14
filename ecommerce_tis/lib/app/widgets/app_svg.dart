import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String assetName;
  final Color? color;
  final BoxFit fit;
  final double? width, height;
  final void Function()? onPressed;
  final AlignmentGeometry alignment;

  const AppSvg(
      {super.key,
      required this.assetName,
      this.color,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.onPressed,
      this.alignment = Alignment.center});

  const AppSvg.clickable(
      {super.key,
      required this.assetName,
      this.color,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      required this.onPressed,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) => onPressed == null
      ? buildSvgPicture()
      : IconButton(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: buildSvgPicture(),
        );

  SvgPicture buildSvgPicture() =>
      SvgPicture.asset("assets/images/$assetName.svg",
          fit: fit,
          width: width,
          alignment: alignment,
          height: height,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);
}

import 'package:flutter/material.dart';
import 'package:lavex/utils/colors.dart';

class LocalAssetImage extends StatelessWidget {
  Color? color;
  double? height;
  double? width;
  double circular;
  String path;

  LocalAssetImage(
      {super.key,
      this.color,
      this.height,
      this.width,
      this.circular = 8,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        path,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}

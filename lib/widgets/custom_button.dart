import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final SvgPicture? image;
  final VoidCallback onPressed;
  double? width;

  double? fontsie;

  CustomButton(
      {required this.text,
      this.image,
      required this.onPressed,
      this.width,
      this.fontsie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(25.0), // Adjust the value as needed
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: (image == null)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            if (text.isNotEmpty)
              Text(
                text,
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontsie ?? 16),
              ),
            if (image != null)
              CircleAvatar(
                child: image,
                backgroundColor: whiteColor,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';

Widget cards(String desc, String image, int index) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 110,
          width: 110,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        CTextBlack(desc, mBold: true, mSize: 15)
      ],
    ),
  );
}
